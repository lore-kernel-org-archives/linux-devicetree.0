From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/2] dt-bindings: add root compatible property for
 PopMetal board
Date: Sat, 28 Feb 2015 18:43:19 +0100
Message-ID: <20074998.Rot74D46YJ@diego>
References: <1425034505-25163-1-git-send-email-andy.yan@rock-chips.com>
 <1425034741-25229-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1425034741-25229-1-git-send-email-andy.yan@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andy Yan <andy.yan@rock-chips.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, naobsd@gmail.com, b.galvani@gmail.com, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, galak@codeaurora.org, romain.perier@gmail.com, linux-arm-kernel@lists.infradead.org, mark.yao@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi Andy,

Am Freitag, 27. Februar 2015, 18:59:01 schrieb Andy Yan:
> PopMetal board is a rk3288 based board made by ChipSpark,
> this patch add root compatible property for it
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
>  Documentation/devicetree/bindings/arm/rockchip.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.txt
> b/Documentation/devicetree/bindings/arm/rockchip.txt index 6809e4e..818d249
> 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.txt
> +++ b/Documentation/devicetree/bindings/arm/rockchip.txt
> @@ -22,3 +22,7 @@ Rockchip platforms device tree bindings
>        - compatible = "firefly,firefly-rk3288", "rockchip,rk3288";
>      or
>        - compatible = "firefly,firefly-rk3288-beta", "rockchip,rk3288";
> +
> +- PopMetal PopMetal-RK3288 board:

this should probably be
	ChipSPARK PopMetal-RK3288 board:


> +    Required root node properties:
> +      - compatible = "chipspark,popmetal-rk3288", "rockchip,rk3288";
