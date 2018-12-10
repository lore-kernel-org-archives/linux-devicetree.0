From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: media: sun6i: Add A64 CSI compatible
Date: Mon, 10 Dec 2018 17:24:23 -0600
Message-ID: <20181210232423.GA13891@bogus>
References: <20181210115246.8188-1-jagan@amarulasolutions.com>
 <20181210115246.8188-2-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181210115246.8188-2-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi <linux-sunxi@googlegroups.com>, linux-amarula@amarulasolutions.com, Michael Trimarchi <michael@amarulasolutions.com>, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

On Mon, 10 Dec 2018 17:22:41 +0530, Jagan Teki wrote:
> Allwinner A64 CSI has single channel time-multiplexed BT.656
> CMOS sensor interface like H3 but work by lowering clock than
> default mod clock.
> 
> Add a compatible string for it.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  Documentation/devicetree/bindings/media/sun6i-csi.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
