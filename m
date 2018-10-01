From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next v3 11/11] net: mscc: ocelot: make use of SerDes
 PHYs for handling their configuration
Date: Mon, 1 Oct 2018 09:29:07 -0700
Message-ID: <228f9d74-be17-5157-9755-b265a6e234b8@gmail.com>
References: <cover.ff40d591b548a6da31716e6e600f11a303e0e643.1536912834.git-series.quentin.schulz@bootlin.com>
 <00989856964175eafbe1435a70862c2ac66cffc0.1536912834.git-series.quentin.schulz@bootlin.com>
 <0f762d63-a392-d2fe-a121-a013a13a8584@gmail.com>
 <20181001094245.cr4hdcechrqkjymq@qschulz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181001094245.cr4hdcechrqkjymq@qschulz>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch, allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

On 10/01/2018 02:42 AM, Quentin Schulz wrote:
> Hi Florian,
> 
> On Sat, Sep 15, 2018 at 02:25:05PM -0700, Florian Fainelli wrote:
>>
>>
>> On 09/14/18 01:16, Quentin Schulz wrote:
>>> Previously, the SerDes muxing was hardcoded to a given mode in the MAC
>>> controller driver. Now, the SerDes muxing is configured within the
>>> Device Tree and is enforced in the MAC controller driver so we can have
>>> a lot of different SerDes configurations.
>>>
>>> Make use of the SerDes PHYs in the MAC controller to set up the SerDes
>>> according to the SerDes<->switch port mapping and the communication mode
>>> with the Ethernet PHY.
>>
>> This looks good, just a few comments below:
>>
>> [snip]
>>
>>> +		err = of_get_phy_mode(portnp);
>>> +		if (err < 0)
>>> +			ocelot->ports[port]->phy_mode = PHY_INTERFACE_MODE_NA;
>>> +		else
>>> +			ocelot->ports[port]->phy_mode = err;
>>> +
>>> +		switch (ocelot->ports[port]->phy_mode) {
>>> +		case PHY_INTERFACE_MODE_NA:
>>> +			continue;
>>
>> Would not you want to issue a message indicating that the Device Tree
>> must be updated here? AFAICT with your patch series, this should no
>> longer be a condition that you will hit unless you kept the old DTB
>> around, right?
>>
> 
> It'll occur for internal PHYs. On the PCB123[1], there are four of them,
> so we need to be able to give no mode in the DT for those. For the
> upcoming PCB120, there'll be 4 external PHYs that require a mode in the
> DT and 4 internal PHYs that do not require any mode. I could put a debug
> message that says this or that PHY is configured as an internal PHY but
> I wouldn't put a message that is printed with the default log level.
> 
> So I think we should keep it, shouldn't we?

Internal PHYs either use a standard connection internally (e.g: GMII) or
they are using a proprietary connection interface, in which case
phy-mode = "internal" is what we defined to represent those.

> 
> [1] https://elixir.bootlin.com/linux/latest/source/arch/mips/boot/dts/mscc/ocelot_pcb123.dts
> 
>>> +		case PHY_INTERFACE_MODE_SGMII:
>>> +			phy_mode = PHY_MODE_SGMII;
>>> +			break;
>>> +		case PHY_INTERFACE_MODE_QSGMII:
>>> +			phy_mode = PHY_MODE_QSGMII;
>>> +			break;
>>> +		default:
>>> +			dev_err(ocelot->dev,
>>> +				"invalid phy mode for port%d, (Q)SGMII only\n",
>>> +				port);
>>> +			return -EINVAL;
>>> +		}
>>> +
>>> +		serdes = devm_of_phy_get(ocelot->dev, portnp, NULL);
>>> +		if (IS_ERR(serdes)) {
>>> +			err = PTR_ERR(serdes);
>>> +			if (err == -EPROBE_DEFER) {
>>
>> This can be simplified into:
>>
>> 			if (err == -EPROBE_DEFER)
>> 				dev_dbg();
>> 			else
>> 				dev_err();
>> 			goto err_probe_ports;
>>
> 
> Indeed, good catch.
> 
> Thanks,
> Quentin
> 


-- 
Florian
