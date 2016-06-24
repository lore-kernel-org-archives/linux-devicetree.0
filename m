From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v3 2/2] phy: add a driver for the Rockchip SoC internal
 PCIe PHY
Date: Fri, 24 Jun 2016 09:37:41 +0800
Message-ID: <180dc842-3daf-a8b2-b333-fb51e4bc4f2a@rock-chips.com>
References: <1466040179-30973-1-git-send-email-shawn.lin@rock-chips.com>
 <5763F665.6070403@ti.com>
 <c88eb16f-e976-ad52-02fb-5ec7b6e261b9@rock-chips.com>
 <57678ED2.9000707@ti.com>
 <428a1393-c6b4-163c-ceec-9b79fdd8ad4a@rock-chips.com>
 <20160623233737.GB21157@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160623233737.GB21157-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2016/6/24 7:37, Brian Norris =E5=86=99=E9=81=93:
> Hi,
>
> On Thu, Jun 23, 2016 at 10:30:17AM +0800, Shawn Lin wrote:
>> =E5=9C=A8 2016/6/20 14:36, Kishon Vijay Abraham I =E5=86=99=E9=81=93=
:
>>> On Monday 20 June 2016 06:28 AM, Shawn Lin wrote:
>>>> On 2016/6/17 21:08, Kishon Vijay Abraham I wrote:
>>>>> On Thursday 16 June 2016 06:52 AM, Shawn Lin wrote:
>>>>>> This patch to add a generic PHY driver for rockchip PCIe PHY.
>>>>>> Access the PHY via registers provided by GRF (general register
>>>>>> files) module.
>>>>>>
>>>>>> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>>>>> ---
>>>>>>
>>>>>> Changes in v3: None
>>>>>> Changes in v2: None
>>>>>>
> [...]
>>>>>> diff --git a/drivers/phy/phy-rockchip-pcie.c b/drivers/phy/phy-r=
ockchip-pcie.c
>>>>>> new file mode 100644
>>>>>> index 0000000..bc6cd17
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/phy/phy-rockchip-pcie.c
>>>>>> @@ -0,0 +1,378 @@
>
> [...]
>
>>>>>> +void rockchip_pcie_phy_laneoff(struct phy *phy)
>>>>>> +{
>>>>>> +    u32 status;
>>>>>> +    struct rockchip_pcie_phy *rk_phy =3D phy_get_drvdata(phy);
>>>>>> +    int i;
>>>>>> +
>>>>>> +    for (i =3D 0; i < PHY_MAX_LANE_NUM; i++) {
>>>>>> +        status =3D phy_rd_cfg(rk_phy, PHY_LANE_A_STATUS + i);
>>>>>> +        if (!((status >> PHY_LANE_RX_DET_SHIFT) &
>>>>>> +               PHY_LANE_RX_DET_TH))
>>>>>> +            pr_debug("lane %d is used\n", i);
>>>>>> +        else
>>>>>> +            regmap_write(rk_phy->reg_base,
>>>>>> +                     rk_phy->phy_data->pcie_laneoff,
>>>>>> +                     HIWORD_UPDATE(PHY_LANE_IDLE_OFF,
>>>>>> +                           PHY_LANE_IDLE_MASK,
>>>>>> +                           PHY_LANE_IDLE_A_SHIFT + i));
>>>>>> +    }
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(rockchip_pcie_phy_laneoff);
>
> Shawn, I can't find an example of how you planned to use this (though=
 I
> can make educated guesses). As such, it's possible there's some
> misunderstanding. Maybe you can include a sample patch for the PCIe
> controller driver?

It will be called after rockchip_pcie_init_port for phy to disable
the unused lanes.

>
> Related: it might make sense to have the PCIe controller and PHY
> drivers/bindings all in the same patch series (with proper threading,
> which we already talked about off-list).
>
>>>>> Er.. don't use export symbols from phy driver. I think it would b=
e nice if you
>>>>> can model the driver in such a way that the PCIe driver can contr=
ol individual
>>>>> phy's.
>>>>>
>>>>
>>>> Yes, I was trying to look for a way not to export symbols from
>>>> phy... But I failed to find it as there at least need three
>>>> interaction between controller and phy which made me believe we
>>>> at least need to export one symbol without adding new API for phy.
>
> My interpretation of the above is that Shawn means we might turn off =
up
> to 3 different lanes (i.e., 3 of 4 supported lanes might be unused).

yes, pcie drivers support up to 4 lanes. But the device may only
support x2. This is beyound the awareness of PCIe controller, so pcie
controller can't tell which one(s) should be turned off.

>
>>> That can be managed by implementing a small state machine within th=
e PHY driver.
>>
>> I don't understand your point of implementing a small state machine
>> within the PHY driver.
>
> I'm not 100% sure I understand, but I think I have a reasonable
> interpretation below.
>
>> Do you mean I need to call vaarious of power_on/off and count the
>> on/off times to decide the state machine?
>>
>> I would appreciate it If you could elaborate this a bit more or
>> show me a example. :)
>
> My interpretation: rather than associating a single PCIe controller
> device with a single struct phy that controls up to 4 lanes, Kishon i=
s
> suggesting you should have this driver implement 4 phy objects, one f=
or
> each lane. You'd need to add #phy-cells =3D <1> to the DT binding, an=
d
> implement an ->of_xlate() hook so we can associate/address them
> properly. Then the PCIe controller would call phy_power_off() on each
> lane that's not used.

As I say above, even we have 4 phy objects, PCIe controller still
doesn't know which one(s) to be turned off, so you have to call 4 times
phy_power_off if I understand it correctly. This doesn't look
okay to me.

>
> The state machine would come into play because you have additional po=
wer
> savings to utilize, but only when all PHYs are off. So the state mach=
ine
> would just track how many of the lane PHYs are still on, and when the
> count reaches 0, you call reset_control_assert(rk_phy->phy_rst).
>
> The DT for this would be:
>
> 	pcie0: pcie@f8000000 {
> 		compatible =3D "rockchip,rk3399-pcie";
> 		...
> 		phys =3D <&pcie_phy 0>, <&pcie_phy 1>, <&pcie_phy 2>, <&pcie_phy 3>=
;
> 		phy-names =3D "pcie-lane0", "pcie-lane1", "pcie-lane2", "pcie-lane3=
";
> 		...
> 	};
>
> 	pcie_phy: pcie-phy {
> 		compatible =3D "rockchip,rk3399-pcie-phy";
> 		...
> 		#phy-cells =3D <1>;
> 		...
> 	};
>
> (See Documentation/devicetree/bindings/phy/phy-bindings.txt for the
> #phy-cells explanation.)
>
> Is that close to what you're suggesting, Kishon? Seems reasonable eno=
ugh
> to me, even if it's slightly more complicated.
>
> Brian
>
>
>


--=20
Best Regards
Shawn Lin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
