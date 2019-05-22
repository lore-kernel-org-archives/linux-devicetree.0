From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v12 1/4] MAINTAINERS: add an entry for for arm64 imx
 devicetrees
Date: Wed, 22 May 2019 16:30:52 +0800
Message-ID: <20190522083051.GB9261@dragon>
References: <20190514132822.27023-1-angus@akkea.ca>
 <20190514132822.27023-2-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190514132822.27023-2-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: angus.ainslie@puri.sm, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, May 14, 2019 at 06:28:19AM -0700, Angus Ainslie (Purism) wrote:
> Add an explicit reference to imx* devicetrees
> 
> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7707c28628b9..9fc30f82ab81 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1624,6 +1624,7 @@ R:	NXP Linux Team <linux-imx@nxp.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> +F:	arch/arm64/boot/dts/freescale/imx*

This is partially reverting commit da8b7f0fb02b ("MAINTAINERS: add all
files matching "imx" and "mxs" to the IMX entry").  I'm not sure that we
want it.

Shawn

>  N:	imx
>  N:	mxs
>  X:	drivers/media/i2c/
> -- 
> 2.17.1
> 
