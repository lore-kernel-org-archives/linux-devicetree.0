From: erin.lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] Document: DT: Add bindings for mediatek MT2701 SoC
 Platform
Date: Thu, 24 Sep 2015 11:15:59 +0800
Message-ID: <1443064559.23409.13.camel@mtksdaap41>
References: <1442998570-54031-1-git-send-email-erin.lo@mediatek.com>
 <1442998570-54031-2-git-send-email-erin.lo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1442998570-54031-2-git-send-email-erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2015-09-23 at 16:56 +0800, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> This adds a DT binding documentation for the MT2701 SoC from Mediatek.
> 
> Signed-off-by: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.txt                 | 4 ++++
>  Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt | 1 +
>  Documentation/devicetree/bindings/serial/mtk-uart.txt              | 5 +++--
>  Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt     | 5 +++--
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt             | 6 +++++-
>  5 files changed, 16 insertions(+), 5 deletions(-)
> 

[snip...]

> diff --git a/Documentation/devicetree/bindings/serial/mtk-uart.txt b/Documentation/devicetree/bindings/serial/mtk-uart.txt
> index 2d47add..f5effb7 100644
> --- a/Documentation/devicetree/bindings/serial/mtk-uart.txt
> +++ b/Documentation/devicetree/bindings/serial/mtk-uart.txt
> @@ -9,8 +9,9 @@ Required properties:
>    * "mediatek,mt6589-uart" for MT6589 compatible UARTS
>    * "mediatek,mt6582-uart" for MT6582 compatible UARTS
>    * "mediatek,mt6580-uart" for MT6580 compatible UARTS
> -  * "mediatek,mt6577-uart" for all compatible UARTS (MT8173, MT6795,
> -        MT6589, MT6582, MT6580, MT6577)
> +  * "mediatek,mt6577-uart" for all compatible UARTS (MT8173, MT6589, MT6582,


MT6795 will be added back in next version.

Regards,
-Erin
