From: Beniamino Galvani <b.galvani@gmail.com>
Subject: Re: [PATCH v3 2/3] pinctrl: add driver for Amlogic Meson SoCs
Date: Thu, 27 Nov 2014 23:34:02 +0100
Message-ID: <20141127223402.GA11418@gmail.com>
References: <1416168856-12747-1-git-send-email-b.galvani@gmail.com>
 <1416168856-12747-3-git-send-email-b.galvani@gmail.com>
 <CACRpkda-U5OuKdBVGJ8UWprJkAtmTL1m11+AbNskVULPfyS72A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkda-U5OuKdBVGJ8UWprJkAtmTL1m11+AbNskVULPfyS72A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@arm.linux.org.uk>, Carlo Caione <carlo@caione.org>, Soren Brinkmann <soren.brinkmann@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jerry Cao <jerry.cao@amlogic.com>, Victor Wan <victor.wan@amlogic.com>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 27, 2014 at 02:48:31PM +0100, Linus Walleij wrote:
> On Sun, Nov 16, 2014 at 9:14 PM, Beniamino Galvani <b.galvani@gmail.c=
om> wrote:
>=20
> > This is a driver for the pinmux and GPIO controller available in
> > Amlogic Meson SoCs. At the moment it only supports Meson8 devices,
> > however other SoC families like Meson6 and Meson8b (the Cortex-A5
> > variant) appear to be similar, with just different sets of banks an=
d
> > registers.
> >
> > GPIO interrupts are not supported at the moment due to lack of
> > documentation.
> >
> > Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
>=20
> This is dependent on S=F6ren's patches I guess?
>=20
> OK I'll merge this once we have that other code sorted out.

Yes, this depends on Soren's patches.

Thanks,
Beniamino
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
