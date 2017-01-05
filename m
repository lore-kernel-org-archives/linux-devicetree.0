From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: phy: introduce new optional property
 to specify drive impedance
Date: Thu, 05 Jan 2017 12:15:18 +0100
Message-ID: <11505388.Y1Yzh8HsIT@diego>
References: <1483608682-226716-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1483608682-226716-1-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

Am Donnerstag, 5. Januar 2017, 17:31:21 schrieb Shawn Lin:
> We need to modify the drive impedance according to the
> different hardware condition. So let's expose this to
> the DT.
> 
> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
>  Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
> b/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt index
> e3ea557..731aeb9 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
> @@ -14,6 +14,11 @@ specified by name:
>  		access to it), it is strongly suggested.
>   - clocks: Should have a phandle to the card clock exported by the SDHCI
> driver.
> 
> +Optional Properties:
> +- drive_impedance: Must be one of 33, 40, 50, 66, 100. This property allows
> +	different boards to specify their own drive impedance depending on the
> +	hardware condition.

In what unit are your 33, 40 etc values?

It is recommended that properties should specify their unit, see all the 
properties ending in "-ma", "-ns" and so on and also 
Documentation/devicetree/bindings/property-units.txt

Also properties should use dashes ("-") not underscores.

Judging by the second patch, these are Ohm, so combining the above you 
probably want

	drive-impedance-ohms

as property name.

Also the patch subject is slightly misleading and should probably specify the 
rockchip-emmc as well :-)


Heiko
