From: Frederik Lotter <frederik.lotter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: DTB file appears to have corrupted node property according to
 fdtdump and kernel?
Date: Fri, 3 Feb 2017 10:38:42 +0200
Message-ID: <CAPBAm7Ts4shbZA0vt_XDn5ytUKCN3n5WSrZuT-m2e28DG5KAEw@mail.gmail.com>
References: <CAPBAm7R0y_ddrre7ydOioNfXbimwtyFonBxwoBaK+BXWuUipcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPBAm7R0y_ddrre7ydOioNfXbimwtyFonBxwoBaK+BXWuUipcA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2 February 2017 at 20:09, Frederik Lotter <frederik.lotter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
>
> I have a particular device tree node property which refuses to reach
> the Linux kernel without corruption:
>
> I am looking at the following call stack:
>
> #0 of_platform_bus_create(...)
> #1 of_platform_bus_create(...)
> #2 of_platform_bus_create(...)
> #3 of_platform_populate(...)
> #4 sama5_dt_device_init(...)
> #5 customize_machine(...)
> #6 do_one_initcall(...)
> #7 do_initcall_level(...)
> #8 do_initcalls()
> #9 do_basic_setup() at main.c:881
> #10 kernel_init_freeable() at main.c:1004
> #11 kernel_init(unused = <Value currently has no location>) at main.c:941
>
> Once I reach the i2c node below, I can walk the properties linked list
> in the debugger. Once I get to the lsm6ds3 child and the "interrupts"
> property, the value is (second value corrupted as zero)
>
>  interrupts = <0xc 0x0>;
>
> (I am investigating this because the second value which is used as the
> interrupt trigger is always zero when the driver reads it).
>
> I have done some additional tests using the dtc and fdtdump utility to
> try and isolate the issue.
>
> From the extract below from the preprocessed file:
>
>    i2c1: i2c@f0018000 {
>     compatible = "atmel,at91sam9x5-i2c";
>     reg = <0xf0018000 0x4000>;
>     interrupts = <0x13 0x4 0x6>;
>     dmas = <0x2 0x2 0x9 0x2 0x2 0xa>;
>     dma-names = "tx", "rx";
>     pinctrl-names = "default";
>     pinctrl-0 = <0x12>;
>     #address-cells = <0x1>;
>     #size-cells = <0x0>;
>     clocks = <0x13>;
>     status = "okay";
>     clock-frequency = <0x61a80>;
>     atmel,recover-scl = <0x14 0x1b 0x0>;
>     atmel,recover-sda = <0x14 0x1a 0x0>;
>
>     lsm6ds3@6b {
>      compatible = "st,lsm6ds3";
>      reg = <0x6b>;
>      pinctrl-names = "default";
>      pinctrl-0 = <0x15>;
>      interrupt-parent = <0x16>;
>      interrupts = <0xc 0x1>;
>      interrupt-names = "lsm6ds_int1";
>      st,drdy-int-pin = <0x1>;
>     };
>    };
>
> Version: DTC 1.4.0 (ubuntu package) for manual testing.
>
> (1)  fdtdump mix6000.dtb | grep interrupts
>
> Thsi returns the interrupt line as:
>
> interrupts = <0x0000000c 0x000001d0>;
>
> (2) In the linux kernel the of_platform_populate() reads the same property as:
>
> 0x0000000c 0x00000000 with lenth=8
>
> (3) If I take the DTS file and manually compile the DTB with the dtc
> compiler, and convert it back to the DTS the correct values are shown
>
> (4) If I change the interrupt value:
>
> interrupts = <0xc 0x0>;
>
> and I do:
>
> cat <file-old.dtb> | od -t x1 > file1.txt
> cat <file-mod.dtb> | od -t x1 > file2.txt
> kdiff3 file1.txt file2.txt
>
> I actually see a single hex byte change from 0x1 to 0x0.
>
> If it was not for the faulty fdtdump output (in conjuection with the
> Linux kernel zero at the same place) I would have said its definately
> a kernel issue.
>
> Any ideas?

I mad a very embarrassing mistake.

Our system has two boot paths and changed our main DT, while I tested
the changes on a debug boot path using a second DT. The second DT
happen to have the same LSM6DS3 node defined from a previous driver we
tested, and had the second "interrupts" field hardcoded as zero.

I should have made additional changes to the DT to confirm the updated
file actually reach the kernel in our build flow.

Thanks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
