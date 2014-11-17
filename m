From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv2 7/8] arm: mvebu: add .dts file for Synology DS213j
Date: Mon, 17 Nov 2014 02:29:06 +0100
Message-ID: <20141117012906.GA23536@lunn.ch>
References: <cover.1416158990.git.arno@natisbad.org>
 <9a6ba2383c1a4ce9fad3f7c15b23050e67409178.1416158990.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9a6ba2383c1a4ce9fad3f7c15b23050e67409178.1416158990.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Nov 16, 2014 at 06:37:54PM +0100, Arnaud Ebalard wrote:
> +				sata1_pres_pin: sata1-pres-pin {
> +					marvell,pins = "mpp60";
> +					marvell,function = "gpio";
> +				};
> +
> +				sata2_pres_pin: sata2-pres-pin {
> +					marvell,pins = "mpp48";
> +					marvell,function = "gpio";
> +				};

Hi Arnaud

Are they above correct?

       MPP_MODE(48,
           MPP_FUNCTION(0x0, "gpio", NULL),
           MPP_FUNCTION(0x1, "dev", "ad9"),
           MPP_FUNCTION(0x2, "uart0", "rts"),
           MPP_FUNCTION(0x3, "sd0", "cmd"),
           MPP_FUNCTION(0x4, "sata1", "prsnt"),
           MPP_FUNCTION(0x5, "spi0", "cs1")),

and

        MPP_MODE(60,
           MPP_FUNCTION(0x0, "gpio", NULL),
           MPP_FUNCTION(0x1, "dev", "ale1"),
           MPP_FUNCTION(0x2, "uart1", "rxd"),
           MPP_FUNCTION(0x3, "sata0", "prsnt"),
           MPP_FUNCTION(0x4, "pcie", "rst-out"),
           MPP_FUNCTION(0x5, "audio", "sdi")),

Seems like function sata[01] would be better than gpio.

Also, i don't see you using these anywhere.

There are a few files in /sys which you might find interesting.

/sys/kernel/debug/pinctrl/f1018000.pinctrl/pinconf-groups shows you
how pins are currently defined. These can be how Linux has set them,
or if Linux has not touched them, how the boot loader set them.

/sys/kernel/debug/pinctrl/f1018000.pinctrl/pinmux-pins shows you what
has been claimed by Linux, either as a gpio or for a specific
function.

There are two schools of thoughts for pinctl. One is to leave the
bootloader to configure the pins, and Linux should use them as they
are. The other is that Linux should not trust the bootloader and
configure the pins itself. With kirkwood we have tried to configure
everything in Linux. I also think for these two boards, we should
configure everything. The reason being the broken bootloader. I
suspect because of the saveenv corruption, more than average are going
to install a new uboot, or barebox image. A generic uboot might not
get the pinctl correct, and a barebox image will be using the dtb blob
to configure the pins. So it would be good to see that all pins which
are used and claimed by a driver.

Thanks
	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
