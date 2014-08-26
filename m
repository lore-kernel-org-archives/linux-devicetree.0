From: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Generic communication of boot loader state to the OS
Date: Tue, 26 Aug 2014 12:10:00 -0400
Message-ID: <CAKON4Oz-PRgXyNKj=T9ymzOOhCMPjBMdYdE1Mr1CHWv3boskiw@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBC55LFUF6ALBBWHC6KPQKGQEMDWDGAQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, ARM Linux Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

New thread split off from the simple-framebuffer discussion....

Is there a generic, underlying problem here that needs to be solved?
AFAIK no one has designed a general purpose mechanism for
communicating boot loader state to the OS. There is the existing
device tree <chosen> node but it is limited compared to what is
needed. Maybe we should step back and first design a good solution to
this basic problem. Then specific solutions for things like
framebuffers would fall out of the basic design.

So what are the requirements?
1) Indicate that the boot loader has set up a device
2) Indicate the purpose of that device
3) Protect the resources in use
4) Provide for a handoff to the OS specific device driver
5) Communicate all of this via the device tree

So what is a device tree syntax that would solve this general problem?
As a first design attempt, I would propose <boot> (or <chosen>) child
nodes be added to the various core devices. By core device I mean the
top level device, like the framebuffer, not each dependent clock and
regulator.

Inside the <boot> nodes a compatible string would be used to designate
a device class the bootloader has assigned to the devices. For example
- serial, framebuffer, media, input, network.

Some examples, I've deleted a lot of properties to make them smaller.
The boot loader could add these nodes either statically or
dynamically.

uart0: uart@01c18000 {
        compatible = "allwinner,sun4i-a10-uart";
        clocks = <&ahb_gates 20>, <&uart2_clk>;
        clock-names = "ahb", "mod";
        boot {
                compatible = "boot,serial";
                baud = <192000>;
                console;
       };
};

reserved-memory {
        display_reserved: framebuffer@78000000 {
                reg = <0x78000000 0x800000>;
        };
};

fb0: fb@01c10000 {
        compatible = "allwinner,sun4i-a10-framebuffer";
        clocks = <&ahb_gates 18>, <&fb2_clk>;
        clock-names = "ahb", "mod";
        boot {
                compatible = "boot,framebuffer";
                memory-region = <&display_reserved>;
        };
};

spi1: spi@01c16000 {
        compatible = "allwinner,sun4i-a10-spi";
        clocks = <&ahb_gates 22>, <&spi2_clk>;
        clock-names = "ahb", "mod";

        flash0: flash@2 {
        compatible = "atmel,at12345";
        reg = <2>;
        spi-max-frequency = <100000>;
                boot {
                        compatible = "boot,media";
                };
        };
};

An OS booting off from a device tree like this can then implement
support for boot,xxxx drivers if it chooses. If it doesn't implement
support for the boot tags, nothing changes from the current situation.

The problem with clocks and regulators can be addressed by following
the chains of clocks/regulators in the parent nodes of the boot
sections. This would be implement by these frameworks providing a
"claim_all_xxx(DT node)" function.  A boot,framebuffer driver would
first call claim_all_clk(parent node) and claim_all_regulator(parent
node). Need to figure out exactly how these functions would work.

Driver handoff is the OS's problem. Under Linux the device specific
drivers could soft-link to the boot,xxx code. After the device
specific driver is fully initialized it would tell the boot,xxx driver
to let go.

As a side effect this will eliminate the need for kernel command line
parameters describing boot state. Like console="". Over time it might
even be able to pass a DHCP IP address from uboot into the kernel.

This is just a first attempt, how can we improve on this?

-- 
Jon Smirl
jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
