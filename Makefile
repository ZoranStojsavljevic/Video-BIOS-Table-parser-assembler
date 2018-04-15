PROG:=vbt
OBJS:=intel_device_info.o intel_vbt_decode.o
LIBDRM_CFLAGS:=$(shell pkg-config --cflags libdrm)

all: $(PROG)

$(PROG): $(OBJS)
	gcc -o $@ $^

%.o: %.c
	gcc $(LIBDRM_CFLAGS) -c $<

.PHONY: clean
clean:
	rm -f $(PROG) $(OBJS)
