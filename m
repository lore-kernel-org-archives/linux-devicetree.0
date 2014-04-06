From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH] ARM: i.MX6: update KSZ9031 phy fixup
Date: Sun, 6 Apr 2014 12:26:55 +0100
Message-ID: <20140406112655.GP7528@n2100.arm.linux.org.uk>
References: <1395421687-12934-1-git-send-email-hchaumette@adeneo-embedded.com> <20140402220125.4e203cd2@crub> <1396533947.25686.22.camel@EMBLYSD005.adetelgroup.com> <20140406110635.GA24260@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140406110635.GA24260@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hubert Chaumette <hchaumette-HH5893ap9ioXz/+GnIZSFEEOCMrvLtNR@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Apr 06, 2014 at 07:06:38PM +0800, Shawn Guo wrote:
> On Thu, Apr 03, 2014 at 04:05:47PM +0200, Hubert Chaumette wrote:
> > Le mercredi 02 avril 2014 =E0 22:01 +0200, Anatolij Gustschin a =E9=
crit :
> > > It would be better to configure the pad skews in the board specif=
ic
> > > way in the device tree. There is a binding for ksz9021 PHY in
> > > Documentation/devicetree/bindings/net/micrel-ksz9021.txt.
> >=20
> > I wonder why it it's not used in arch/arm/boot/dts/imx6q-sabrelite.=
dts
> > instead of ksz9021rn_phy_fixup().
>=20
> Oh, if you look at arch/arm/boot/dts/imx6qdl-sabrelite.dtsi on mainli=
ne
> tree today, you will find it.

Ergh.  So much for "DT describes the hardware, not the software
implementation."

commit 954c396756e3d31985f7bc6a414a988a4736a7d0
Author: Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
Date:   Wed Aug 21 01:46:12 2013 +0000

    net/phy: micrel: Add OF configuration support for ksz9021

    Some boards require custom PHY configuration, for example due to tr=
ace
    length differences.  Add the ability to configure these registers i=
n
    order to get the PHY to function on boards that need it.

    Because PHYs are auto-detected based on MDIO device IDs, allow PHY
    configuration to be specified in the parent Ethernet device node if=
 no
    PHY device node is present.

If we were describing the hardware, we'd create a node for the phy and =
put
the phy specific properties in there, and reference it from the etherne=
t
driver, and have some way to look up the phy node when we automatically
discover the phy.

Well, it's too late to do anything else now, we're stuck with this, and
I guess everyone's going to be stuffing the phy chip's configuration in=
to
the ethernet device's node from now on. :(

--=20
=46TTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... sl=
owly
improving, and getting towards what was expected from it.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
