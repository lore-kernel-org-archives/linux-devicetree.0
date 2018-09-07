From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v4 2/2] phy: add Rockchip Innosilicon hdmi phy
Date: Fri, 7 Sep 2018 09:58:04 +0100
Message-ID: <81c527fc-5837-658f-5c57-60acd909ed2e@arm.com>
References: <20180906135047.30788-1-heiko@sntech.de>
 <20180906135047.30788-2-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180906135047.30788-2-heiko@sntech.de>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, kishon@ti.com
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, zhengyang@rock-chips.com
List-Id: devicetree@vger.kernel.org

On 2018-09-06 2:50 PM, Heiko Stuebner wrote:
> From: Zheng Yang <zhengyang@rock-chips.com>
> 
> Add a driver for the Innosilicon hdmi phy used on rk3228/rk3229
> and rk3328 socs from Rockchip.
> 
> Signed-off-by: Zheng Yang <zhengyang@rock-chips.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Robin Murphy <robin.murphy@arm.com>

That reminds me, I really must dig out that box again and finish 
figuring out the GPIOs and regulators... :)

[...]
> +static int inno_hdmi_phy_probe(struct platform_device *pdev)
> +{
> +	struct inno_hdmi_phy *inno;
> +	const struct of_device_id *match;
> +	struct phy_provider *phy_provider;
> +	struct resource *res;
> +	void __iomem *regs;
> +	int ret;
> +
> +	inno = devm_kzalloc(&pdev->dev, sizeof(*inno), GFP_KERNEL);
> +	if (!inno)
> +		return -ENOMEM;
> +
> +	inno->dev = &pdev->dev;
> +
> +	match = of_match_device(inno->dev->driver->of_match_table, inno->dev);
> +	inno->plat_data = (struct inno_hdmi_phy_drv_data *)match->data;

Nit: if there's cause to do another respin anyway, you could simplify 
this part with of_device_get_match_data().

Robin.
