From: Frank Wang <frank.wang@rock-chips.com>
Subject: Re: [v2, 2/2] phy: rockchip-inno-usb2: add a new driver for Rockchip
 usb2phy
Date: Mon, 6 Jun 2016 12:51:43 +0800
Message-ID: <b860eb32-265e-ddb2-cb99-aba652540a34@rock-chips.com>
References: <1464850090-99371-3-git-send-email-frank.wang@rock-chips.com>
 <20160603195922.GB3524@roeck-us.net> <1561602.DGny4Hlya3@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561602.DGny4Hlya3@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Guenter Roeck <linux@roeck-us.net>
Cc: dianders@chromium.org, kishon@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org, jwerner@chromium.org, xzy.xu@rock-chips.com, huangtao@rock-chips.com, kever.yang@rock-chips.com, william.wu@rock-chips.com, frank.wang@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi Heiko & Guenter,

On 2016/6/4 5:24, Heiko St=FCbner wrote:
> Am Freitag, 3. Juni 2016, 12:59:22 schrieb Guenter Roeck:
>> On Thu, Jun 02, 2016 at 02:48:10PM +0800, Frank Wang wrote:
>>> The newer SoCs (rk3366, rk3399) take a different usb-phy IP block
>>> than rk3288 and before, and most of phy-related registers are also
>>> different from the past, so a new phy driver is required necessaril=
y.
>>>
>>> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
>>> ---
>>>
>>> Changes in v2:
>>>   - Changed vbus_host operation from gpio to regulator in *_probe.
>>>   - Improved the fault treatment relate to 480m clock register.
>>>   - Cleaned up some meaningless codes in *_clk480m_disable.
>>>   - made more clear the comment of *_sm_work.
>>>  =20
>>> [...]
>>>
>>> +static struct clk *
>>> +rockchip_usb2phy_clk480m_register(struct rockchip_usb2phy *rphy)
>>> +{
>>> +	struct device_node *node =3D rphy->dev->of_node;
>>> +	struct clk *clk;
>>> +	struct clk_init_data init;
>>> +	int ret;
>>> +
>>> +	init.name =3D "clk_usbphy_480m";
>>> +	init.ops =3D &rockchip_usb2phy_clkout_ops;
>>> +	init.flags =3D CLK_IS_ROOT;
>> One more comment:
>>
>> include/linux/clk-provider.h:#define CLK_IS_ROOT                BIT(=
4) /*
>> Deprecated: Don't use */
>>
>> ... and the definition has been removed in linux-next.
> also, the created clock should be a child of the phy-supply clock. Pl=
ease take
> a look at the picophy-variant (phy-rockchip-usb) that already handles=
 that
> parent assignment.
>

Okay, I will refer and correct them in the next patch (patch v3) .

BR.
=46rank
