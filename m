From: Mason <slash.tmp-GANU6spQydw@public.gmane.org>
Subject: Converting "board file" to device tree one device at a time?
Date: Fri, 31 Jul 2015 11:57:26 +0200
Message-ID: <55BB4686.8030509@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

I'm using an ARM Cortex A9 based platform. I have a minimal
3.14 port working (UART and Ethernet, loads a root file system
over NFS) using a board file.

I'm trying to convert the port to device tree, so that I can
(try to) push it upstream.

As I can't wrap my head around the concept, I'm trying to do
the conversion "one device at a time", starting with just the
UART, then Ethernet, then the clock tree, and that's basically
all I need to boot the board.

I started by enabling

CONFIG_ARM_APPENDED_DTB=y
CONFIG_ARM_ATAG_DTB_COMPAT=y
CONFIG_ARM_ATAG_DTB_COMPAT_CMDLINE_FROM_BOOTLOADER=y
CONFIG_SERIAL_OF_PLATFORM=y

and wrote this dts:

/dts-v1/;

/ {
	compatible = "sigma,tango4-soc";

	#address-cells = <1>;
	#size-cells = <1>;

	soc {
		compatible = "simple-bus";
		#address-cells = <1>;
		#size-cells = <1>;
		ranges;

		uart0: serial@10700 {
			compatible = "ns16550a";
			reg = <0x10700 0x100>;
			interrupts = <1>;
			clock-frequency = <7372800>;
			reg-shift = <2>;
			no-loopback-test;

			#address-cells = <1>;
			#size-cells = <1>;
		};
	};
};

and added "sigma,tango4-soc" to my struct machine_desc .dt_compat


Then I generated a kernel with appended DT using:

$ make dtbs
$ make -j2 zImage && cat arch/arm/boot/zImage arch/arm/boot/dts/tango.dtb >XXX
$ mv XXX arch/arm/boot/zImage && make uImage


Then I set a breakpoint in of_platform_serial_probe, hoping
to witness the miracle... and nothing. Looks like device is
never registered :-(

Can anyone point me where to look?
What did I do wrong?

Where does the kernel parse the appended DTB?
Is it setup_machine_fdt?

When/Where is the UART description in the device tree supposed
to be used to register the device?

Any help greatly appreciated!

Regards.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
