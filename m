From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH v2 1/2] gpio: Add driver for Zynq GPIO controller
Date: Mon, 7 Jul 2014 18:23:09 +0300
Message-ID: <20140707152309.GH4939@tarshish>
References: <1403091577-10232-1-git-send-email-harinik@xilinx.com>
 <5cc8b89b-20ff-4fa9-92dd-bb2f6d3512d8@BY2FFO11FD030.protection.gbl>
 <CACRpkdb1M3-hrSKLKWz21LCJ1sMvsq5E-aqkpmVhy0NwOS5HhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdb1M3-hrSKLKWz21LCJ1sMvsq5E-aqkpmVhy0NwOS5HhA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Harini Katakam <harinik@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, Harini Katakam <harinikatakamlinux@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Harini Katakam <harini.katakam@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Linux,

On Mon, Jul 07, 2014 at 04:51:56PM +0200, Linus Walleij wrote:
> On Wed, Jun 18, 2014 at 5:36 PM, S=F6ren Brinkmann <soren.brinkmann@x=
ilinx.com> wrote:
> > The first is, how is userspace supposed to find the correct offset =
for a
> > GPIO pin.
>=20
> The sysfs interface to GPIO is *NOT* *GOOD* this is universally
> agreed upon.
>=20
> This needs someone to step in and provide a replacement, my preferred
> mechanism would be a /dev/gpiochip0/... hierarchy using char devices.

I really like the ability to control GPIOs from shell, both interactive=
ly and=20
scripted. I find it useful for quick hardware level debugging, and for =
boot=20
time scripting (mainly in initramfs). Do you intend to preserve this=20
capability in the future? Will I need a special utility (or Busybox app=
let) to=20
do this with char device ioctl?

baruch

--=20
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Sy=
stems
=3D}------------------------------------------------ooO--U--Ooo--------=
----{=3D
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
