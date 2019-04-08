From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6qdl-nitrogen6_max: Disable LVDS channels
Date: Mon, 8 Apr 2019 17:37:47 -0300
Message-ID: <CAOMZO5DAvaibi5r9CXzk8qbE7XHiHJHHvi9rcq_BJdx7aRVgoQ@mail.gmail.com>
References: <20190408175319.9106-1-robert.foss@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190408175319.9106-1-robert.foss@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Foss <robert.foss@collabora.com>, Gary Bisson <gary.bisson@boundarydevices.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Robert,

[Adding Gary]

On Mon, Apr 8, 2019 at 2:54 PM Robert Foss <robert.foss@collabora.com> wrote:
>
> If a LVDS device is not connected, having the LVDS channels
> enabled will prevent imx-ldb from probing correctly even
> if other CRTCs are connected.
>
> Signed-off-by: Robert Foss <robert.foss@collabora.com>
> ---
>  arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi b/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi
> index 39200e5dc896..5b413cf4c250 100644
> --- a/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi
> @@ -703,7 +703,7 @@
>         status = "okay";
>
>         lvds-channel@0 {
> -               status = "okay";
> +               status = "disabled";
>
>                 port@4 {
>                         reg = <4>;
> @@ -715,7 +715,7 @@
>         };
>
>         lvds-channel@1 {
> -               status = "okay";
> +               status = "disabled";

I am not sure I understood what you are trying to fix.

Could you please share some logs when imx-ldb fails to probe correctly?

Is this a regression?
