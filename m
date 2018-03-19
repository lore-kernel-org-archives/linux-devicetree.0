From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] arm: dts: hummingboard2: convert onboard audio to simple-audio-card
Date: Mon, 19 Mar 2018 11:13:01 -0300
Message-ID: <CAOMZO5Dq3hWXKNBwqM7zFW-FjwBGLAsUJnSaUNPXO5kg=iaaGA@mail.gmail.com>
References: <20180319135326.24357-1-mporter@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180319135326.24357-1-mporter@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matt Porter <mporter@konsulko.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 19, 2018 at 10:53 AM, Matt Porter <mporter@konsulko.com> wrote:
> The HB2 onboard audio currently makes use of the imx-audio-sgtl5000
> binding. This binding does not support auxiliary audio devices such
> as external amplifiers. The simple-audio-card binding does support
> this property which allows systems incorporating the HB2 to easily
> add an auxiliary device that's attached to the HB2 audio jack with
> an overlay. Convert HB2 to use simple-audio-card for the onboard
> audio to allow for this additional flexibility.
>
> Signed-off-by: Matt Porter <mporter@konsulko.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
