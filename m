From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: soc: update MT6797 power domain
Date: Wed, 23 May 2018 13:27:59 -0500
Message-ID: <20180523182759.GA12966@rob-hp-laptop>
References: <1526890186-16219-1-git-send-email-kaichieh.chuang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1526890186-16219-1-git-send-email-kaichieh.chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: KaiChieh Chuang <kaichieh.chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, May 21, 2018 at 04:09:46PM +0800, KaiChieh Chuang wrote:
> remove unused power domain in mt6797 and re-index
> 
> Signed-off-by: KaiChieh Chuang <kaichieh.chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  include/dt-bindings/power/mt6797-power.h | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/include/dt-bindings/power/mt6797-power.h b/include/dt-bindings/power/mt6797-power.h
> index a60c1d8..f96c4e2 100644
> --- a/include/dt-bindings/power/mt6797-power.h
> +++ b/include/dt-bindings/power/mt6797-power.h
> @@ -20,11 +20,6 @@
>  #define MT6797_POWER_DOMAIN_MM			3
>  #define MT6797_POWER_DOMAIN_AUDIO		4
>  #define MT6797_POWER_DOMAIN_MFG_ASYNC		5
> -#define MT6797_POWER_DOMAIN_MFG		6
> -#define MT6797_POWER_DOMAIN_MFG_CORE0		7
> -#define MT6797_POWER_DOMAIN_MFG_CORE1		8
> -#define MT6797_POWER_DOMAIN_MFG_CORE2		9
> -#define MT6797_POWER_DOMAIN_MFG_CORE3		10
> -#define MT6797_POWER_DOMAIN_MJC		11
> +#define MT6797_POWER_DOMAIN_MJC		6

This is an ABI. You can't just change the numbering. You'll cause a 
mismatch between existing dtb and new kernel.

Rob
