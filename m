From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V2 2/3] ARM: dts: imx7ulp: add mmdc support
Date: Wed, 27 Feb 2019 22:32:26 -0300
Message-ID: <CAOMZO5DQM0-rBbWuWa7dZw8es1NbY8DwCGmU4_ZJ2FdFEXYC6Q@mail.gmail.com>
References: <1551316741-7848-1-git-send-email-Anson.Huang@nxp.com> <1551316741-7848-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551316741-7848-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Wed, Feb 27, 2019 at 10:23 PM Anson Huang <anson.huang@nxp.com> wrote:
>
> i.MX7ULP has a MMDC module to control DDR, it reuses
> i.MX6Q's MMDC module, add support for it.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V1:
>         - use "memory-controller" as MMDC node name to make it more generic.
> ---
>  arch/arm/boot/dts/imx7ulp.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dtsi
> index fca6e50..78f6117 100644
> --- a/arch/arm/boot/dts/imx7ulp.dtsi
> +++ b/arch/arm/boot/dts/imx7ulp.dtsi
> @@ -286,6 +286,12 @@
>                         status = "disabled";
>                 };
>
> +               mmdc: memory-controller@40ab0000 {

It seems that the 'mmdc' label is not neeed.

You could make it simpler as:

memory-controller@40ab0000 {
