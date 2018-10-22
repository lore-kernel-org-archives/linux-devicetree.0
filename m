From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: ccimx6ulsbcpro: Add support for AUO
 G101EVN010 display
Date: Mon, 22 Oct 2018 09:35:32 -0300
Message-ID: <CAOMZO5Ad8DMSq+bs21fqpcDqwzDnEgvnRgEsGUiLxUw87K1QAw@mail.gmail.com>
References: <1540204399-12982-1-git-send-email-alex.gonzalez@digi.com> <1540204399-12982-2-git-send-email-alex.gonzalez@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540204399-12982-2-git-send-email-alex.gonzalez@digi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gonzalez, Alex" <alex.gonzalez@digi.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Alex,

On Mon, Oct 22, 2018 at 7:34 AM Alex Gonzalez <alex.gonzalez@digi.com> wrote:

> +       g101evn010: display@0 {
> +               bits-per-pixel = <16>;
> +               bus-width = <18>;
> +
> +               display-timings {
> +                       native-mode = <&timing0>;
> +                       timing0: timing0 {
> +                               clock-frequency = <68930000>;
> +                               hactive = <1280>;
> +                               vactive = <800>;
> +                               hfront-porch = <120>;
> +                               hback-porch = <0>;
> +                               hsync-len = <8>;
> +                               vback-porch = <10>;
> +                               vfront-porch = <0>;
> +                               vsync-len = <6>;
> +                               hsync-active = <1>;
> +                               vsync-active = <1>;
> +                               de-active = <1>;
> +                               pixelclk-active = <0>;

The recommendation is not to put the panel timings in the dts file anymore.

You could add an entry for this panel into the simple-panel driver and
then reference its compatible string in the board dts.
