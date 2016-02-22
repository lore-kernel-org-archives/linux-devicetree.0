From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 0/2] Add Rockchip display port phy driver support
Date: Mon, 22 Feb 2016 16:45:10 +0530
Message-ID: <56CAEDBE.2050808@ti.com>
References: <1455534071-31230-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1455534071-31230-1-git-send-email-ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Monday 15 February 2016 04:31 PM, Yakir Yang wrote:
> 
> Hi Kison,
> 
> This series is splited from Analogix DP DRM thread [0], and Heiko suggest this
> should be an independent thread which may be easy for you to apply.

Indeed. Merged now thanks. (Changed the year to 2016 in the file header before
merging)

Thanks
Kishon

> 
> Best regards,
> Yakir
> 
> [0]: https://patchwork.kernel.org/patch/8086571/
> 
> 
> Changes in v12:
> - Re-order the include headers file alphabetically in phy-rockchip-dp.c (Jingoo)
> 
> Changes in v11:
> - Correct the title of this rockchip dp phy document(Rob)
> - Add the ack from Rob Herring
> 
> Changes in v10:
> - Fix the wrong macro value of GRF_EDP_REF_CLK_SEL_INTER_HIWORD_MASK
>     BIT(4) -> BIT(20)
> 
> Changes in v9:
> - Removed the unused the variable "res" in probe function. (Heiko)
> - Removed the unused head file.
> 
> Changes in v8:
> - Fix the mixed spacers on macro definitions. (Heiko)
> - Remove the unnecessary empty line after clk_prepare_enable. (Heiko)
> - Remove the specific address in the example node name. (Heiko)
> 
> Changes in v7:
> - Simply the commit message. (Kishon)
> - Symmetrical enable/disbale the phy clock and power. (Kishon)
> - Simplify the commit message. (Kishon)
> 
> Changes in v5:
> - Remove "reg" DT property, cause driver could poweron/poweroff phy via
>   the exist "grf" syscon already. And rename the example DT node from
>   "edp_phy: phy@ff770274" to "edp_phy: edp-phy" directly. (Heiko)
> - Add deivce_node at the front of driver, update phy_ops type from "static
>   struct" to "static const struct". And correct the input paramters of
>   devm_phy_create() interfaces. (Heiko)
> - Split binding doc's from driver changes. (Rob)
> - Update the rockchip,grf explain in document, and correct the clock required
>   elemets in document. (Rob & Heiko)
> 
> Changes in v4:
> - Add commit message, and remove the redundant rockchip_dp_phy_init()
>   function, move those code to probe() method. And remove driver .owner
>   number. (Kishon)
> 
> Changes in v3:
> - Suggest, add rockchip dp phy driver, collect the phy clocks and
>   power control. (Heiko)
> 
> Yakir Yang (2):
>   phy: Add driver for rockchip Display Port PHY
>   dt-bindings: add document for rockchip dp phy
> 
>  .../devicetree/bindings/phy/rockchip-dp-phy.txt    |  22 +++
>  drivers/phy/Kconfig                                |   7 +
>  drivers/phy/Makefile                               |   1 +
>  drivers/phy/phy-rockchip-dp.c                      | 151 +++++++++++++++++++++
>  4 files changed, 181 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt
>  create mode 100644 drivers/phy/phy-rockchip-dp.c
> 
