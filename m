From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v4 0/2] arm64: rockchip: support RK3399 Ficus board
Date: Thu, 12 Jul 2018 11:31:06 +0200
Message-ID: <31262174.ngUfOPmpOk@diego>
References: <20180706150818.5631-1-ezequiel@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180706150818.5631-1-ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 6. Juli 2018, 17:08:16 CEST schrieb Ezequiel Garcia:
> Fourth round for the RK3399 Ficus support.
> 
> Changes from v3:
>  * Fixed a regulator node name, as noted by Rob.
>  * Fixed wrong alphabetical order in vendors prefix patch, also noted by
> Rob.
> 
> Changes from v2:
>  * Dropped rk3399.dtsi changes and rebased on top of Randy's patch.
>  * Removed double empty line.
>  * Coalesced schematics comment
> 
> Changes from v1:
>  * Dropoed USB support as it's not working.
>  * Added schematics.
>  * Splitted rk3399.dtsi from new ficus.dts file.
>  * Added new vendor.
>  * Cleaned regulators syntax and stlye.
> 
> Series based on: 600b359d2b98 ("arm64: dts: rockchip: add some common
> pin-settings to rk3399").
> 
> Ezequiel Garcia (2):
>   dt-bindings: Add vendor prefix for Vamrs Ltd.
>   arm64: dts: rockchip: add 96boards RK3399 Ficus board

applied both for 4.19

Thanks
Heiko
