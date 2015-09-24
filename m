From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH linux-next v9 0/3] mfd: flexcom: add a driver for Flexcom
Date: Thu, 24 Sep 2015 18:37:16 +0100
Message-ID: <20150924173716.GE27197@x1>
References: <cover.1441118159.git.cyrille.pitchen@atmel.com>
 <20150920041912.GS3039@x1>
 <56027F10.1060804@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56027F10.1060804-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 23 Sep 2015, Nicolas Ferre wrote:
> Le 20/09/2015 06:19, Lee Jones a =C3=A9crit :
> > Patch set description?
>=20
> Cyrille actually placed it as the v1 changelog below...

I see it now, but that's not a very intuitive way of representing the
set description.  Please use the normal format with the description at
the top.  Normally all I care about is the description and the latest
changes (although please keep in the previous changelogs, as they can
also prove useful).

> > Once Rob is satisfied, please re-submit this set with Nicolas' Acks
>=20
> I think that Rob was okay with the DT binding: "A few comments, but i=
n
> general looks fine." and it may not be important to tack Rob for
> addition of his formal tag...
>=20
> Or maybe this message can act as a "ping" for Rob...

I'm not asking for that, although it's never UNwanted.  I'm asking for
the discussion between the submitter and other interested parties to
play out, then adapt and re-submit accordingly.  I receive far too
many submissions to keep track of all of the discussions.

> > and I will re-review.
>=20
> We wait one or two days before Cyrille re-send the series. We are
> looking forward to using this driver in Linux-next soon.
>=20
> >> ChangeLog
> >>
> >> v9:
> >> - go back to v5 (use the new "atmel,flexcom-mode" DT property).
> >> - fix the name of the spi node in the DT example: from spi@f803440=
0 to
> >>   spi@400
> >> - align the fields of the struct platform_driver atmel_flexcom_dri=
ver as
> >>   suggested by Lee Jones.
> >>
> >> v8:
> >> - fix the name of the spi node in the DT example: from spi@f803440=
0 to
> >>   spi@2,0
> >> - use the return code of op_property_read_u32_index() instead of -=
EINVAL
> >>   to report error.
> >> - add Acked-by from Nicolas Ferre
> >>
> >> v7:
> >> - read the operating mode from the very first u32 of the reg prope=
rty from
> >>   the first available child node (should be unique).
> >> - update the DT bindings documentation accordingly.
> >>
> >> v6:
> >> - select the operating mode according to the "compatible" DT prope=
rty of
> >>   the first available child node (should be unique).
> >> - remove the "atmel,flexcom-mode" DT property so the need of a hea=
der file
> >>   defining macros for the possible values of this deprecated prope=
rty.
> >>
> >> v5:
> >> - create a header file containing macros used by DT bindings
> >> - use numeric constants instead of strings to select the Flexcom m=
ode
> >> - change the license to "GPL v2"
> >> - update the DT binding documentation to make it more readable and=
 add
> >>   references to USART, SPI and I2C DT binding documentations. remo=
ve the
> >>   useless label in the Example section.
> >> - change the register prefix from FX_ to FLEX_ to match the Flexco=
m
> >>   programmer datasheet.
> >> - rename some variables to make them more understandable.
> >>
> >> v4:
> >> - check clk_prepare_enable() return code in atmel_flexcom_probe()
> >> - add a commit message to the DT binding patch
> >>
> >> v3:
> >> - remove MODULE_ALIAS()
> >> - add Acked-by from Boris Brezillon and Alexandre Belloni
> >>
> >> v2:
> >> - enhance the documentation of DT bindings and change the way the =
"ranges"
> >>   property is used.
> >> - replace __raw_readl() and __raw_writel() by readl() and writel()=
=2E
> >> - change the module license to "GPL" for v2 or later
> >> - print the selected flexcom mode after the hardware version
> >>
> >> v1:
> >> This series of patches a support to the Atmel Flexcom, a wrapper w=
hich
> >> integrates an USART, a SPI controller and a TWI controller. Only o=
ne
> >> peripheral can be used at a time. The active function is selected =
though
> >> the Flexcom Mode Register.
> >>
> >> Cyrille Pitchen (3):
> >>   mfd: atmel-flexcom: create include file with macros used by DT
> >>     bindings
> >>   mfd: devicetree: add bindings for Atmel Flexcom
> >>   mfd: atmel-flexcom: add a driver for Atmel Flexible Serial
> >>     Communication Unit
> >>
> >>  .../devicetree/bindings/mfd/atmel-flexcom.txt      |  67 ++++++++=
+++++
> >>  drivers/mfd/Kconfig                                |  11 +++
> >>  drivers/mfd/Makefile                               |   1 +
> >>  drivers/mfd/atmel-flexcom.c                        | 104 ++++++++=
+++++++++++++
> >>  include/dt-bindings/mfd/atmel-flexcom.h            |  16 ++++
> >>  5 files changed, 199 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/mfd/atmel-fl=
excom.txt
> >>  create mode 100644 drivers/mfd/atmel-flexcom.c
> >>  create mode 100644 include/dt-bindings/mfd/atmel-flexcom.h
> >>
> >=20
>=20
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
