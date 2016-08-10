From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v1 1/4] nvmem: rockchip-efuse: update compatible strings
 for Rockchip efuse
Date: Wed, 10 Aug 2016 10:21:46 +0200
Message-ID: <18634361.lkZvz8cT7b@diego>
References: <1470811843-42668-1-git-send-email-finley.xiao@rock-chips.com>
 <1470811843-42668-2-git-send-email-finley.xiao@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1470811843-42668-2-git-send-email-finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Finlye Xiao <finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tony.xie-TNX95d0MmH7DzftRWevZcw@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, wbriannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Finley,

Am Mittwoch, 10. August 2016, 14:50:40 schrieb Finlye Xiao:
> From: Finley Xiao <finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> Rk3399-efuse is organized as 32bits by 32 one-time programmable
> electrical fuses. The efuse of earlier SoCs are organized as
> 32bits by 8 one-time programmable electrical fuses with random
> access interface.
> 
> Add different device tree compatible string for different SoCs
> to be able to differentiate between the two.
> 
> Signed-off-by: Finley Xiao <finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
> b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt index
> 8f86ab3..8ec1b80 100644
> --- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
> +++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
> @@ -1,7 +1,11 @@
>  = Rockchip eFuse device tree bindings =
> 
>  Required properties:
> -- compatible: Should be "rockchip,rockchip-efuse"
> +- compatible: Should be one of the following.
> +	"rockchip,rk3066a-efuse" - for RK3066a SoCs.
> +	"rockchip,rk3188-efuse" - for RK3188 SoCs.
> +	"rockchip,rk3288-efuse" - for RK3288 SoCs.
> +	"rockchip,rk3399-efuse" - for RK3399 SoCs.
>  - reg: Should contain the registers location and exact eFuse size
>  - clocks: Should be the clock id of eFuse
>  - clock-names: Should be "pclk_efuse"

you cannot drop the old compatible that way. Please add a new section

Deprecated properties:
- compatible: "rockchip,rockchip-efuse"
  Old efuse compatible value compatible to rk3066a, rk3188 and rk3288 efuses

and move the old compatible there.


Thanks
Heiko
