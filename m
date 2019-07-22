From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: fsl: pico-pi: Add a device tree for the PICO-PI-IMX8M
Date: Tue, 23 Jul 2019 00:19:06 +0300
Message-ID: <CAEnQRZDDjvMA5imQK5cEfycMUm3DiJ6i=0uuoHma2PfY3cqS-Q@mail.gmail.com>
References: <20190625123407.15888-1-andradanciu1997@gmail.com>
 <20190718035523.GD11324@X250> <CAJNLGszB239AHpD+kRCPRWZaToTYHiq5YUHRjfRwTqknwHMdMA@mail.gmail.com>
 <20190722020345.GR3738@dragon> <042F8805D2046347BB8420BEAE397A40749E9BDA@WILL-MAIL002.REu.RohmEu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <042F8805D2046347BB8420BEAE397A40749E9BDA@WILL-MAIL002.REu.RohmEu.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Andra Danciu <andradanciu1997@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>, Fabio Estevam <festevam@gmail.com>, "aisheng.dong@nxp.com" <aisheng.dong@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "angus@akkea.ca" <angus@akkea.ca>, "vabhav.sharma@nxp.com" <vabhav.sharma@nxp.com>, "pankaj.bansal@nxp.com" <pankaj.bansal@nxp.com>, "bhaskar.upadhaya@nxp.com" <bhaskar.upadhaya@nxp.com>, "ping.bai@nxp.com" <ping.bai@nxp.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Richard Hu <richard.hu@technexion.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kern>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 22, 2019 at 9:30 PM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
>
> Sorry for top posting. I'm replying using mobile phone and outlook web app...
>
> gpio_intr is not needed. Irq must be given using the standard irq property. gpio_intr has been used in an old draft driver - I assume the dts originates from NXP bsp which used the old driver.

Thanks Matti for your observation! We already fixed this as we are now
on v6 of the patches for review :).

yes the dts originates form TechNexion bsp tree which is based on NXP tree :).

Daniel.
