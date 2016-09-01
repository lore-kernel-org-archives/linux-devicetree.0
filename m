From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5 2/2] phy: add a driver for the Rockchip SoC internal
 PCIe PHY
Date: Thu, 1 Sep 2016 10:35:16 +0530
Message-ID: <57C7B70C.3020101@ti.com>
References: <1471661617-26432-1-git-send-email-shawn.lin@rock-chips.com>
 <1471661617-26432-2-git-send-email-shawn.lin@rock-chips.com>
 <6005500.MI6i4QbaFN@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <6005500.MI6i4QbaFN@diego>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On Wednesday 31 August 2016 07:38 PM, Heiko St=FCbner wrote:
> Hi,
> =

> Am Samstag, 20. August 2016, 10:53:37 schrieb Shawn Lin:
>> This patch to add a generic PHY driver for rockchip PCIe PHY.
>> Access the PHY via registers provided by GRF (general register
>> files) module.
>>
>> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> =

> seems I'm late to the party, but when looking if I can apply the pcie-
> devicetree patches, I found that the phy is still pending.
> =

> Apart from some error-message nitpicks below, this looks ok to me. I don'=
t =

> know enough about the actual pci phy part though.
> =

> Kishon, is this on your radar?

yes.. can the nipicks be fixed and posted asap?

Thanks
Kishon

> =

> [...]
> =

>> +static int rockchip_pcie_phy_power_off(struct phy *phy)
>> +{
>> +	struct rockchip_pcie_phy *rk_phy =3D phy_get_drvdata(phy);
>> +	int err =3D 0;
>> +
>> +	err =3D reset_control_assert(rk_phy->phy_rst);
>> +	if (err) {
>> +		pr_err("assert phy_rst err %d\n", err);
> =

> 	dev_err(phy->dev, ...)
> =

> probably the same for all other pr_err invocations
> =

> =

>> +		return err;
>> +	}
>> +
>> +	return 0;
>> +}
> =

> [...]
> =

>> +static const struct of_device_id rockchip_pcie_phy_dt_ids[] =3D {
>> +	{
>> +		.compatible =3D "rockchip,rk3399-pcie-phy",
>> +		.data =3D &rk3399_pcie_data,
>> +	},
>> +	{}
>> +};
>> +
>> +MODULE_DEVICE_TABLE(of, rockchip_pcie_phy_dt_ids);
>> +
>> +static int rockchip_pcie_phy_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev =3D &pdev->dev;
>> +	struct rockchip_pcie_phy *rk_phy;
>> +	struct phy *generic_phy;
>> +	struct phy_provider *phy_provider;
>> +	struct regmap *grf;
>> +	const struct of_device_id *of_id;
>> +
>> +	grf =3D syscon_node_to_regmap(dev->parent->of_node);
>> +	if (IS_ERR(grf)) {
>> +		dev_err(dev, "Missing rockchip,grf property\n");
> =

> 		dev_err(dev, "Cannot find GRF syscon\n");
> =

> =

> Heiko
> =
