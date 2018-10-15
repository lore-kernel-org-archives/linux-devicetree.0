From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 03/12] dt-bindings: sun6i-dsi: Add compatible for A64
 MIPI DSI
Date: Mon, 15 Oct 2018 13:24:02 -0500
Message-ID: <20181015182402.GA5988@bogus>
References: <20180927114850.24565-1-jagan@amarulasolutions.com>
 <20180927114850.24565-4-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180927114850.24565-4-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Vasily Khoruzhick <anarsoul@gmail.com>, linux-clk@vger.kernel.org, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

On Thu, 27 Sep 2018 17:18:41 +0530, Jagan Teki wrote:
> The MIPI DSI controller on Allwinner A64 is similar to
> Allwinner A31 without support of DSI mod clock.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
