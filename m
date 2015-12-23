From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 1/6] dt-bindings: misc: add document for reboot-mode
 driver
Date: Tue, 22 Dec 2015 18:32:17 -0600
Message-ID: <20151223003217.GA18700@rob-hp-laptop>
References: <1450774949-23901-1-git-send-email-andy.yan@rock-chips.com>
 <1450775124-23966-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450775124-23966-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 22, 2015 at 05:05:24PM +0800, Andy Yan wrote:
> add device tree bindings document for reboot-mode driver
> 
> Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> ---
> 
> Changes in v1: None
> 
>  .../devicetree/bindings/misc/reboot-mode.txt       | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/reboot-mode.txt
> 
> diff --git a/Documentation/devicetree/bindings/misc/reboot-mode.txt b/Documentation/devicetree/bindings/misc/reboot-mode.txt
> new file mode 100644
> index 0000000..082bc0c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/reboot-mode.txt
> @@ -0,0 +1,41 @@
> +Generic reboot mode communication driver

You're not describing a driver. It is a mapping of boot modes to values.
> +
> +This driver get reboot mode arguments from userspace

Coming from userspace is a Linuxism.

> +and stores it in special register or ram . Then the
> +bootloader will read it and take different action
> +according the argument stored.
> +
> +Required properties:
> +        - compatible = "reboot-mode" or other vendor compatible string;
> +
> +Each mode is represented as a sub-node of reboot_mode:
> +
> +Subnode required properties:
> +        - linux,mode: reboot mode command,such as "loader","recovery", "fastboot".
> +        - linux,magic: magic number for the mode, this is vendor specific.
> +
> +example:
> +	reboot_mode {
> +		compatible = "rockchip,reboot-mode";
> +		rockchip,regmap = <&pmu>;
> +		offset = <0x40>;
> +		loader {
> +			linux,mode = "loader";
> +			linux,magic = <0x5242C301>;
> +		};

These can be much more simply expressed as:

loader = <0x5242c301>;

I would like to see the property names here standardized as much as
possible. I'm not sure if we can define the properties as a u32 or need
some flexibility here.

Rob
