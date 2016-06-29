From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5 2/2] phy: rockchip-inno-usb2: add a new driver for
 Rockchip usb2phy
Date: Wed, 29 Jun 2016 19:44:52 +0530
Message-ID: <5773D7DC.9050902@ti.com>
References: <1465783810-18756-1-git-send-email-frank.wang@rock-chips.com>
 <1465783810-18756-3-git-send-email-frank.wang@rock-chips.com>
 <5763E506.1060500@ti.com> <1653733.7f4MgdqfFf@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1653733.7f4MgdqfFf@diego>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Friday 17 June 2016 10:16 PM, Heiko St=FCbner wrote:
> Hi Kishon,
> =

> Am Freitag, 17. Juni 2016, 17:24:46 schrieb Kishon Vijay Abraham I:
> =

>>> +	ret =3D of_clk_add_provider(node, of_clk_src_simple_get, rphy->clk480=
m);
>>> +	if (ret < 0)
>>> +		goto err_clk_provider;
>>> +
>>> +	ret =3D devm_add_action(rphy->dev, rockchip_usb2phy_clk480m_unregiste=
r,
>>> +			      rphy);
>>> +	if (ret < 0)
>>> +		goto err_unreg_action;
>>> +
>>> +	return 0;
>>> +
>>> +err_unreg_action:
>>> +	of_clk_del_provider(node);
>>> +err_clk_provider:
>>> +	clk_unregister(rphy->clk480m);
>>> +err_register:
>>> +	if (rphy->clk)
>>> +		clk_put(rphy->clk);
>>> +	return ret;
>>> +}
>>
>> I'm seeing lot of similarities specifically w.r.t to clock handling part=
 in
>> drivers/phy/phy-rockchip-usb.c. Why not just re-use that driver?
> =

> It's a completely different phy block (Designware vs. Innosilicon) and a =
lot =

> of stuff also is handled differently.
> =

> For one on the old block, each phy was somewhat independent and had for e=
xamle =

> its own clock-supply, while on this one there is only one for both ports =
of =

> the phy. Similarly with the clock getting fed back to the clock-controlle=
r =

> (one clock per port on the old block, now one clock for the whole phy).
> =

> Then as you can see, the handling for power-up and down is a bit differen=
t and =

> I guess one big block might be the still missing special otg handling, Fr=
ank =

> wrote about.

All right then.
> =

> =

> [...]
> =

>>> +		/*
>>> +		 * we don't need to rearm the delayed work when the phy port
>>> +		 * is suspended.
>>> +		 */
>>> +		mutex_unlock(&rport->mutex);
>>> +		return;
>>> +	default:
>>> +		dev_dbg(&rport->phy->dev, "unknown phy state\n");
>>> +		break;
>>> +	}
>>> +
>>> +next_schedule:
>>> +	mutex_unlock(&rport->mutex);
>>> +	schedule_delayed_work(&rport->sm_work, SCHEDULE_DELAY);
>>
>> Why are you scheduling the work again? Interrupt handlers can invoke this
>> right?
> =

> Frank said, that the phy is only able to detect the plug-in event via =

> interrupts, not the removal, so once a plugged device is detected, this g=
ets =

> rescheduled until the device gets removed.

okay.
> =

> [...]
> =

>>> +	/* find out a proper config which can be matched with dt. */
>>> +	index =3D 0;
>>> +	while (phy_cfgs[index].reg) {
>>> +		if (phy_cfgs[index].reg =3D=3D reg) {
>>
>> Why not pass these config values from dt? Moreover finding the config us=
ing
>> register offset is bound to break.
> =

> As you have probably seen, this phy block is no stand-alone (mmio-)device=
, but =

> gets controlled through special register/bits in the so called "General =

> Register Files" syscon.
> =

> The values stored and accessed here, are the location and layout of those =

> control registers. Bits in those phy control registers at times move betw=
een =

> phy-versions in different socs (rk3036, rk3228, rk3366, rk3368, rk3399) a=
nd =

> some are even missing. So I don't really see a nice way to describe that =
in dt =

> without describing the register and offset of each of those 22 used bits =

> individually.
> =

> =

> I'm also not sure where you expect it to break? The reg-offset is the off=
set =

> of the phy inside the GRF and the Designware-phy also already does someth=
ing =

> similar to select some appropriate values.

I'm concerned the phy can be placed in the different reg-offset within GRF
(like in the next silicon revision) and this driver can't be used.

Thanks
Kishon
> =
