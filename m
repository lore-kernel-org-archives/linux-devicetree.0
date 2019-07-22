From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 05/10] dt-bindings: display: Add max-res property for
 mxsfb
Date: Mon, 22 Jul 2019 11:48:53 -0600
Message-ID: <20190722174853.GA31795@bogus>
References: <1561555938-21595-1-git-send-email-robert.chiras@nxp.com>
 <1561555938-21595-6-git-send-email-robert.chiras@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1561555938-21595-6-git-send-email-robert.chiras@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Chiras <robert.chiras@nxp.com>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 26, 2019 at 04:32:13PM +0300, Robert Chiras wrote:
> Add new optional property 'max-res', to limit the maximum supported
> resolution by the MXSFB_DRM driver.

Bindings are for h/w description, not driver config.

> 
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> ---
>  Documentation/devicetree/bindings/display/mxsfb.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mxsfb.txt b/Documentation/devicetree/bindings/display/mxsfb.txt
> index 472e1ea..55e22ed 100644
> --- a/Documentation/devicetree/bindings/display/mxsfb.txt
> +++ b/Documentation/devicetree/bindings/display/mxsfb.txt
> @@ -17,6 +17,12 @@ Required properties:
>  Required sub-nodes:
>    - port: The connection to an encoder chip.
>  
> +Optional properties:
> +- max-res:	an array with a maximum of two integers, representing the
> +		maximum supported resolution, in the form of
> +		<maxX>, <maxY>; if one of the item is <0>, the default
> +		driver-defined maximum resolution for that axis is used

I suppose what you are after is bandwidth limits? IIRC, there's already 
some bindings expressing such limits. Also, wouldn't you need to account 
for bpp and using the 2nd plane (IIRC that there is one).

Rob
