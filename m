From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 0/9] ARM: Berlin: USB support
Date: Mon, 9 Jun 2014 12:30:20 +0800
Message-ID: <20140609043019.GA32255@shlinux1.ap.freescale.net>
References: <1401983326-19205-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1401983326-19205-1-git-send-email-antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 05, 2014 at 05:48:37PM +0200, Antoine T=E9nart wrote:
> This series adds the support for the Marvell Berlin USB controllers,
> the USB PHYs and also adds a reset controller.
>=20
> The reset controller is used by the USB PHY driver and shares the
> existing chip controller node with the clocks and one pin controller.
>=20
> The Marvell Berlin USB controllers are host only on the BG2Q and are
> compatible with USB ChipIdea. We here add a glue to use the available
> common functions for this kind of controllers. A USB PHY driver is al=
so
> added to control the PHY.
>=20
> Antoine T=E9nart (9):
>   reset: add the Berlin reset controller driver
>   ARM: Berlin: select the reset controller
>   ARM: dts: berlin: add a required reset property in the chip control=
ler
>     node
>   usb: phy: add the Berlin USB PHY driver
>   Documentation: bindings: add doc for the Berlin USB PHY
>   usb: chipidea: add Berlin USB support
>   Documentation: bindings: add doc for the Berlin ChipIdea USB driver
>   ARM: dts: berlin: add BG2Q nodes for USB support
>   ARM: dts: Berlin: enable USB on the BG2Q DMP
>=20
>  .../devicetree/bindings/usb/berlin-usbphy.txt      |  18 ++
>  .../devicetree/bindings/usb/ci-hdrc-berlin.txt     |  18 ++
>  arch/arm/boot/dts/berlin2.dtsi                     |   1 +
>  arch/arm/boot/dts/berlin2cd.dtsi                   |   1 +
>  arch/arm/boot/dts/berlin2q-marvell-dmp.dts         |  20 ++
>  arch/arm/boot/dts/berlin2q.dtsi                    |  52 +++++
>  arch/arm/mach-berlin/Kconfig                       |   2 +
>  drivers/reset/Makefile                             |   1 +
>  drivers/reset/reset-berlin.c                       | 113 +++++++++++
>  drivers/usb/chipidea/Makefile                      |   1 +
>  drivers/usb/chipidea/ci_hdrc_berlin.c              | 108 ++++++++++
>  drivers/usb/phy/Kconfig                            |   9 +
>  drivers/usb/phy/Makefile                           |   1 +
>  drivers/usb/phy/phy-berlin-usb.c                   | 223 +++++++++++=
++++++++++
>  14 files changed, 568 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/berlin-usbp=
hy.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/ci-hdrc-ber=
lin.txt
>  create mode 100644 drivers/reset/reset-berlin.c
>  create mode 100644 drivers/usb/chipidea/ci_hdrc_berlin.c
>  create mode 100644 drivers/usb/phy/phy-berlin-usb.c
>=20
> --=20
> 1.9.1
>=20

I am fine with 6/9, 7/9, will queue them if no other objections.

--=20

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
