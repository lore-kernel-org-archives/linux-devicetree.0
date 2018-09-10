From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 2/4] dt-bindings: arm: rockchip: Add binding for Rock960 board
Date: Mon, 10 Sep 2018 19:22:26 +0200
Message-ID: <1606406.b630GQBvc1@phil>
References: <20180910151356.25946-1-manivannan.sadhasivam@linaro.org> <20180910151356.25946-3-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180910151356.25946-3-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: robh+dt@kernel.org, vicencb@gmail.com, shawn.lin@rock-chips.com, ezequiel@collabora.com, enric.balletbo@collabora.com, pbrobinson@gmail.com, tom@vamrs.com, dev@vamrs.com, stephen@vamrs.com, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Montag, 10. September 2018, 17:13:54 CEST schrieb Manivannan Sadhasivam:
> Add devicetree binding for Rock960 board from Vamrs Limited.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.txt b/Documentation/devicetree/bindings/arm/rockchip.txt
> index acfd3c773dd0..aaad9e2ff9a3 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.txt
> +++ b/Documentation/devicetree/bindings/arm/rockchip.txt
> @@ -5,6 +5,10 @@ Rockchip platforms device tree bindings
>      Required root node properties:
>        - compatible = "vamrs,ficus", "rockchip,rk3399";
>  
> +- 96boards RK3399 Rock960 (ROCK960 Consumer Edition)
> +    Required root node properties:
> +      - compatible = "vamrs,rk3399-rock960", "rockchip,rk3399";

hmm, are there more boards labeled rock960 from Vamrs?
Because I'm trying to determine what makes "vamrs,rock960" unsuitable.


Heiko
