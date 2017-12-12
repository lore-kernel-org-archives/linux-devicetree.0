From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: Document the Rockchip RK1608 bindings
Date: Tue, 12 Dec 2017 11:50:41 +0100
Message-ID: <1720708.Qj5c0Lsxha@phil>
References: <1513060095-29588-1-git-send-email-leo.wen@rock-chips.com>
 <1513060095-29588-3-git-send-email-leo.wen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1513060095-29588-3-git-send-email-leo.wen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Leo Wen <leo.wen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Leo,

Am Dienstag, 12. Dezember 2017, 14:28:15 CET schrieb Leo Wen:
> +Optional properties:
> +
> +- spi-max-frequency	: Maximum SPI clocking speed of the device;
> +			        (for RK1608)
> +- spi-min-frequency	: Minimum SPI clocking speed of the device;
> +			        (for RK1608)

There is no general spi-min-frequency property specified and I also guess
systems would try to use a frequency close to maximum anyway, so I don't
really see the use of specifying a minimum frequency.


> +&pinctrl {
> +	rk1608_irq_gpios {
> +		rk1608_irq_gpios: rk1608_irq_gpios {
> +			rockchip,pins = <6 2 RK_FUNC_GPIO &pcfg_pull_none>;
> +			rockchip,pull = <1>;
> +		};
> +	};

There is no need to specify the soc-specific pinctrl settings in a general
devicetree example and you're using properties from your vendor-tree
like the rockchip,pull one ... that are not used in the mainline kernel.

So I'd suggest dropping the whole &pinctrl from the example.


Heiko
