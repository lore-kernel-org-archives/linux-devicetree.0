From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 7/9] dt-bindings: sun6i-dsi: Add R40 DPHY compatible
 (w/  A31 fallback)
Date: Tue, 9 Jul 2019 10:16:26 -0600
Message-ID: <20190709161626.GA28908@bogus>
References: <20190614164324.9427-1-jagan@amarulasolutions.com>
 <20190614164324.9427-8-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190614164324.9427-8-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>, linux-sunxi@googlegroups.com, Michael Trimarchi <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

On Fri, 14 Jun 2019 22:13:22 +0530, Jagan Teki wrote:
> The MIPI DSI PHY controller on Allwinner R40 is similar
> on the one on A31.
> 
> Add R40 compatible and append A31 compatible as fallback.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
