From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 net-next 7/7] net: dsa: Add Lantiq / Intel DSA driver
 for vrx200
Date: Thu, 6 Sep 2018 14:36:56 -0700
Message-ID: <d344e75f-92f8-cbf2-9f69-fb17007a01cf@gmail.com>
References: <20180901114535.9070-1-hauke@hauke-m.de>
 <20180901120511.10112-1-hauke@hauke-m.de>
 <eb5c0815-e80c-7fd7-a14a-ccc3f28a7c93@gmail.com>
 <d0da3eb2-8adb-677a-0f88-b6fe7989ae45@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <d0da3eb2-8adb-677a-0f88-b6fe7989ae45@hauke-m.de>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Hauke Mehrtens <hauke@hauke-m.de>, davem@davemloft.net
Cc: netdev@vger.kernel.org, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, john@phrozen.org, linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/06/2018 02:11 PM, Hauke Mehrtens wrote:
> On 09/03/2018 09:54 PM, Florian Fainelli wrote:
>>
>>
>> On 9/1/2018 5:05 AM, Hauke Mehrtens wrote:
>>> This adds the DSA driver for the GSWIP Switch found in the VRX200 SoC.
>>> This switch is integrated in the DSL SoC, this SoC uses a GSWIP version
>>> 2.1, there are other SoCs using different versions of this IP block, but
>>> this driver was only tested with the version found in the VRX200.
>>> Currently only the basic features are implemented which will forward all
>>> packages to the CPU and let the CPU do the forwarding. The hardware also
>>> support Layer 2 offloading which is not yet implemented in this driver.
>>>
>>> The GPHY FW loaded is now done by this driver and not any more by the
>>> separate driver in drivers/soc/lantiq/gphy.c, I will remove this driver
>>> is a separate patch. to make use of the GPHY this switch driver is
>>> needed anyway. Other SoCs have more embedded GPHYs so this driver should
>>> support a variable number of GPHYs. After the firmware was loaded the
>>> GPHY can be probed on the MDIO bus and it behaves like an external GPHY,
>>> without the firmware it can not be probed on the MDIO bus.
>>>
>>> Currently this depends on SOC_TYPE_XWAY because the SoC revision
>>> detection function ltq_soc_type() is used to load the correct GPHY
>>> firmware on the VRX200 SoCs.
>>>
>>> The clock names in the sysctrl.c file have to be changed because the
>>> clocks are now used by a different driver. This should be cleaned up and
>>> a real common clock driver should provide the clocks instead.
>>>
>>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
>>> ---
>>
>> Looks great, just a few suggestions below
>>
>> [snip]
>>
>>> +static void gswip_adjust_link(struct dsa_switch *ds, int port,
>>> +                  struct phy_device *phydev)
>>> +{
>>> +    struct gswip_priv *priv = ds->priv;
>>> +    u16 macconf = phydev->mdio.addr & GSWIP_MDIO_PHY_ADDR_MASK;
>>> +    u16 miirate = 0;
>>> +    u16 miimode;
>>> +    u16 lcl_adv = 0, rmt_adv = 0;
>>> +    u8 flowctrl;
>>> +
>>> +    /* do not run this for the CPU port */
>>> +    if (dsa_is_cpu_port(ds, port))
>>> +        return;
>>
>> Typically we expect the adjust_link callback to run for fixed link
>> ports, that is inter-switch links (between switches) or between the CPU
>> port and the Ethernet MAC attached to the switch. Here you are running
>> this for the user facing ports (IIRC), which should really not be
>> necessary, most Ethernet switches will be able to look at their built-in
>> PHY's state and configure the switch's port automatically. Maybe this is
>> not possible here because you had to disable polling?
> 
> I deactivated the PHY auto polling, I can activate it again. Some PHYs
> could also be external on the same MDIO bus as the internal PHYs.
> 
> The CPU facing fixed link is a special MAC in the switch, at least in
> this version of the switch IP which is embedded in the networking SoCs.
> The MAC is more or less integrated in the switch and the driver can not
> configure the link between the MAC and the switch.

OK

> 
>> Can you consider implementing PHYLINK operations which would make the
>> driver more future proof, should you consider newer generations of
>> switches that support 10G PHY, SGMII, SFP/SFF and so on?
> 
> I will have a look at this later. I just saw that you pushed some
> branches adding SFP support to b53. ;-)

I would really add PHYLINK callbacks now what you have is fairly simple
to extract into separate functions doing the MAC configuration, and then
setting link up/down, that's pretty much all you need. Once you start
adding SFP/SFF support, things can get a bit more complicated
configuration wise.

> 
> The next step will be adding layer 2 offload. This is planned for the
> next patch series after this was merged. The switch uses internal VLANs
> for the offloading, so you configure a VLAN in the hardware and then add
> ports to it. I saw that multiple switches use this model, but converting
> the not VLAN aware layer 2 offloading to it looks a little bit strange,
> is there a good practice?
> 

Not VLAN aware layer 2 offload is actually quite common, the switch must
accept all frames in that case (not checking VID). L2 offload is really
about the following use case create a bridge, enslave ports of the
switch into it, and you should now have the switch forward from/to/
port0/port1 without this traffic going all the way to the CPU. If it
does, then there is no point having a switch in the first place :)

>> [snip]
>>
>>> +    if (priv->ds->dst->cpu_dp->index != priv->hw_info->cpu_port) {
>>> +        dev_err(dev, "wrong CPU port defined, HW only supports port:
>>> %i",
>>> +            priv->hw_info->cpu_port);
>>> +        err = -EINVAL;
>>> +        goto mdio_bus;
>>> +    }
>>
>> There are a number of switches (b53, qca8k, mt7530) that have this
>> requirement, we should probably be moving this check down into the core
>> DSA layer and allow either to continue but disable switch tagging, if it
>> was requested. Andrew what do you think?
> 
> As the CPU port is a special port many registers are only available for
> the normal front facing Ethernet ports and not for the CPU port so I
> have to make sure the correct port was selected as CPU port, otherwise
> the driver will write to the wrong register offsets.

OK, my comment was mostly for Andrew, this is not the first switch that
has specific requirements on which port of the switch is the
"CPU/management" port. So we should probably add some core functionality
within DSA to say "here are the ports that I can accept for management",
if the port you connected your switch to any other than those, then you
just lose tagging.
-- 
Florian
