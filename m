From: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v5 2/2] phy: rockchip-inno-usb2: add a new driver for
 Rockchip usb2phy
Date: Wed, 15 Jun 2016 11:23:26 +0800
Message-ID: <44bb6bf0-cf86-c440-665a-b0d441ce4427@rock-chips.com>
References: <1465783810-18756-1-git-send-email-frank.wang@rock-chips.com>
 <1465783810-18756-3-git-send-email-frank.wang@rock-chips.com>
 <7225720.0AClDW7eQ6@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7225720.0AClDW7eQ6@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 2016/6/14 21:27, Heiko St=C3=BCbner wrote:
> Am Montag, 13. Juni 2016, 10:10:10 schrieb Frank Wang:
>> The newer SoCs (rk3366, rk3399) take a different usb-phy IP block
>> than rk3288 and before, and most of phy-related registers are also
>> different from the past, so a new phy driver is required necessarily=
=2E
>>
>> Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>
>> Changes in v5:
>>   - Added 'reg' in the data block to match the different phy-blocks =
in dt.
>>
>> Changes in v4:
>>   - Removed some processes related to 'vbus_host-supply'.
>>
>> Changes in v3:
>>   - Resolved the mapping defect between fixed value in driver and th=
e
>> property in devicetree.
>>   - Optimized 480m output clock register function.
>>   - Code cleanup.
>>
>> Changes in v2:
>>   - Changed vbus_host operation from gpio to regulator in *_probe.
>>   - Improved the fault treatment relate to 480m clock register.
>>   - Cleaned up some meaningless codes in *_clk480m_disable.
>>   - made more clear the comment of *_sm_work.
>>
>>   drivers/phy/Kconfig                  |    7 +
>>   drivers/phy/Makefile                 |    1 +
>>   drivers/phy/phy-rockchip-inno-usb2.c |  645
>> ++++++++++++++++++++++++++++++++++ 3 files changed, 653 insertions(+=
)
>>  =20
>> [...]
>>
>> +
>> +static int rockchip_usb2phy_exit(struct phy *phy)
>> +{
>> +	struct rockchip_usb2phy_port *rport =3D phy_get_drvdata(phy);
>> +
> 	if (!rport->port_cfg)
> 		return 0;
>
>> +	if (rport->port_id =3D=3D USB2PHY_PORT_HOST)
>> +		cancel_delayed_work_sync(&rport->sm_work);
>> +
> you will also need to resume the port here, if it is suspended at thi=
s point,
> as phy_power_off gets called after phy_exit and would probably produc=
e clk
> enable/disable mismatches otherwise.
>

Hmm, from my personal point of view, when canceling sm_work here, it ma=
y=20
not cause the port goes to suspend, isn't it? besides, clk only prepare=
d=20
in *_usb2phy_resume(), and unprepared in *_usb2phy_suspend(), so if we=20
resume port here,  the prepare_count of clk will be increased again, I=20
am afraid this is not correct, and am I wrong? would you like to tell m=
e=20
more details?

>> +	return 0;
>> +}
>>
>> [...]
>>
>> +static int rockchip_usb2phy_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev =3D &pdev->dev;
>> +	struct device_node *np =3D dev->of_node;
>> +	struct device_node *child_np;
>>
>> [...]
>>
>> +	index =3D 0;
>> +	for_each_available_child_of_node(np, child_np) {
>> +		struct rockchip_usb2phy_port *rport =3D &rphy->ports[index];
>> +		struct phy *phy;
>> +
>> +		phy =3D devm_phy_create(dev, child_np, &rockchip_usb2phy_ops);
>> +		if (IS_ERR(phy)) {
>> +			dev_err(dev, "failed to create phy\n");
>> +			ret =3D PTR_ERR(phy);
>> +			goto put_child;
>> +		}
>> +
>> +		rport->phy =3D phy;
> 	phy_set_drvdata(rport->phy, rport);
>
>> +
>> +		/* initialize otg/host port separately */
>> +		if (!of_node_cmp(child_np->name, "host-port")) {
>> +			ret =3D rockchip_usb2phy_host_port_init(rphy, rport,
>> +							      child_np);
>> +			if (ret)
>> +				goto put_child;
>> +		}
>> +
>> +		phy_set_drvdata(rport->phy, rport);
> move this to the location above to prevent null-pointer dereferences =
with
> devices plugged in on boot.

OK, I will fix it.

>
> I've tested this a bit on a rk3036 (which is lacking the disconnect-d=
etection
> it seems), so in general (apart from the stuff mentioned above) this =
looks
> nice now. So with the stuff above fixed:
>
> Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Tested-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

BR.
=46rank

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
