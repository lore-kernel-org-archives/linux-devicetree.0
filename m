From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 22/25] dt-bindings: sun6i-dsi: Add compatible for A64
 DPHY
Date: Tue, 30 Oct 2018 15:28:31 -0500
Message-ID: <20181030202831.GA22352@bogus>
References: <20181026144344.27778-1-jagan@amarulasolutions.com>
 <20181026144344.27778-23-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181026144344.27778-23-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Vasily Khoruzhick <anarsoul@gmail.com>, linux-clk@vger.kernel.org, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

On Fri, 26 Oct 2018 20:13:41 +0530, Jagan Teki wrote:
> The MIPI DSI PHY HDMI controller on Allwinner A64 is similar
> on the one on A31.
> 
> Add A64 compatible and append A31 compatible as fallback.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v3:
> - none
> Changes for v2:
> - new patch
> 
>  Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
