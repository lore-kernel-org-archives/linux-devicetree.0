From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: Provide support for reading ID code from MVB
 device (BK4)
Date: Mon, 3 Dec 2018 09:13:50 -0200
Message-ID: <CAOMZO5AJPiexbvHUq+vsz5zz6gNwL3O1KJ9ka_XPFotac2Sb=A@mail.gmail.com>
References: <20181113121213.14296-1-lukma@denx.de> <20181126143619.GB31334@dragon>
 <20181203103333.111c2463@jawa>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203103333.111c2463@jawa>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Majewski <lukma@denx.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Stefan Agner <stefan@agner.ch>, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Lukasz,

On Mon, Dec 3, 2018 at 7:33 AM Lukasz Majewski <lukma@denx.de> wrote:

> > > +           72xx165@0 {
> >
> > Please use a generic name for the node.
>
> This is a bit tricky.

What about using 'gpio@0' like described in
Documentation/devicetree/bindings/gpio/gpio-pisosr.txt ?
