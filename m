From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v1 0/2] Common SerDes driver for TI's Keystone Platforms
Date: Thu, 15 Oct 2015 17:51:06 +0100
Message-ID: <20151015165105.GE32532@n2100.arm.linux.org.uk>
References: <1444919145-30845-1-git-send-email-w-kwok2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444919145-30845-1-git-send-email-w-kwok2-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: WingMan Kwok <w-kwok2-l0cyMroinI0@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 15, 2015 at 10:25:43AM -0400, WingMan Kwok wrote:
> On TI's Keystone platforms, several peripherals such as the
> gbe ethernet switch, 10gbe ethether switch and PCIe controller
> require the use of a SerDes for converting SoC parallel data into
> serialized data that can be output over a high-speed electrical
> interface, and also converting high-speed serial input data
> into parallel data that can be processed by the SoC.  The
> SerDeses used by those peripherals, though they may be different,
> are largely similar in functionality and setup.

Given that serdes is not specific to TI, should this be specific to
TI, or should there be an effort to come up with something which
everyone who has serdes links can make use of?

Serdes comes in multiple different forms: PCIe, 1G SGMII ethernet,
1000base-X ethernet, 10g ethernet, SATA... I'd hate to see a
plethora of SoC specific stuff for this.

When serdes is combined with SFP cages, the situation becomes much
more fun, because the serdes link then needs to become hotpluggable
(SFP modules are designed to be hotplugged) which means you have to
be able to switch between (at least) 1G SGMII and 1000base-X modes,
and probably 10G mode as well.  There's even a SFP module that has
a SATA connector on it, though I believe there's no standard for
that, and it's more a hardware hack.

I've been working in this area but from the Ethernet side on an
Armada 38x based board which has a SFP cage on it, though it's
slightly simpler there because there is no support (or I believe
any desire) to reconfigure the serdes lanes between PCI, ethernet
and SATA - that's all setup and initialised for us by uboot.

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
