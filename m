From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v10 1/4] MAINTAINERS: add an entry for for arm64 imx devicetrees
Date: Mon, 13 May 2019 15:01:56 -0300
Message-ID: <CAOMZO5BaQnrDOYogzgpmCExjB+uhYQ8SsxBiMWrSB-1KRtgeVQ@mail.gmail.com>
References: <20190513174057.4410-1-angus@akkea.ca> <20190513174057.4410-2-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190513174057.4410-2-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: angus.ainslie@puri.sm, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 13, 2019 at 2:41 PM Angus Ainslie (Purism) <angus@akkea.ca> wrote:
>
> Add an explicit reference to imx* devicetrees
>
> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7707c28628b9..0871a21a5bbb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1648,6 +1648,7 @@ T:        git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
>  F:     arch/arm/boot/dts/ls1021a*
>  F:     arch/arm64/boot/dts/freescale/fsl-*
>  F:     arch/arm64/boot/dts/freescale/qoriq-*
> +F:     arch/arm64/boot/dts/freescale/imx*

No, please put this entry under ARM/FREESCALE IMX / MXC ARM ARCHITECTURE

Thanks
