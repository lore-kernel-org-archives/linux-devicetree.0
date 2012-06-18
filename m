From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch v5 00/13] add imx usb driver for mx28/6x
Date: Mon, 18 Jun 2012 14:10:45 -0300
Message-ID: <CAOMZO5BXsPtwC2CTt6Z-DjZUYhrWMKDkr2QnFoAKb-aLc1XsNA@mail.gmail.com>
References: <1339590863-10564-1-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1339590863-10564-1-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Richard,

On Wed, Jun 13, 2012 at 9:34 AM, Richard Zhao
<richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> The work is based on =C2=A0ci13xxx rework done by Alexander Shishkin.
>
> Status:
> =C2=A0- this version only support host
> =C2=A0- usbotg controler works at host role
>
> Changes since last version:
> =C2=A0- collect ack received.
>
> Richard Zhao (13):
> =C2=A0usb: otg: add notify_connect/notify_disconnect callback
> =C2=A0USB: move transceiver from ehci_hcd and ohci_hcd to hcd and ren=
ame it
> =C2=A0 =C2=A0as phy
> =C2=A0USB: notify phy when root hub port connect change
> =C2=A0usb: chipidea: permit driver bindings pass phy pointer
> =C2=A0usb: otg: add basic mxs phy driver support
> =C2=A0usb: chipidea: add imx platform driver
> =C2=A0ARM: imx6q: correct device name of usbphy and usb controller cl=
ock
> =C2=A0 =C2=A0export
> =C2=A0ARM: imx6q: add config-on-boot gpios
> =C2=A0ARM: imx6q: add usbphy clocks
> =C2=A0ARM: imx6q: disable usb charger detector
> =C2=A0ARM: dts: imx6q-sabrelite: add usb devices
> =C2=A0ARM: mxs: clk_register_clkdev mx28 usb clocks
> =C2=A0ARM: dts: imx28-evk: add usb devices

I am trying your patch series on a mx28evk and I am not able to have
my USB pen drive detected.

I tried enabling all the required config options in .config.

Could you please share your .config?

Thanks,

=46abio Estevam
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
