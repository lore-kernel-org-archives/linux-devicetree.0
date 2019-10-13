From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v1 3/3] ARM: dts: bcm2711: Enable GENET support for the
 RPi4
Date: Sun, 13 Oct 2019 12:19:55 -0700
Message-ID: <15b182b4-488a-c023-91ff-e0e253dc41f9@gmail.com>
References: <20191011184822.866-1-matthias.bgg@kernel.org>
 <20191011184822.866-4-matthias.bgg@kernel.org>
 <a514751e-e82a-b5ea-34d3-46468c851a80@gmail.com>
 <c7fac096-4a0a-1d52-2284-4fe86554fbc8@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c7fac096-4a0a-1d52-2284-4fe86554fbc8@gmx.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <wahrenst@gmx.net>, matthias.bgg@kernel.org, "David S . Miller" <davem@davemloft.net>
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>, Eric Anholt <eric@anholt.net>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 10/13/2019 11:41 AM, Stefan Wahren wrote:
> Hi Florian,
> 
> Am 11.10.19 um 21:31 schrieb Florian Fainelli:
>> On 10/11/19 11:48 AM, matthias.bgg@kernel.org wrote:
>>> From: Matthias Brugger <mbrugger@suse.com>
>>>
>>> Enable Gigabit Ethernet support on the Raspberry Pi 4
>>> Model B.
>>>
>>> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
>>>
>>> ---
>>>
>>>  arch/arm/boot/dts/bcm2711-rpi-4-b.dts | 22 ++++++++++++++++++++++
>>>  arch/arm/boot/dts/bcm2711.dtsi        | 18 ++++++++++++++++++
>>>  2 files changed, 40 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
>>> index cccc1ccd19be..958553d62670 100644
>>> --- a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
>>> +++ b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
>>> @@ -97,6 +97,28 @@
>>>  	status = "okay";
>>>  };
>>>
>>> +&genet {
>>> +	phy-handle = <&phy1>;
>>> +	phy-mode = "rgmii";
>> Can you check that things still work against David Miller's net-next?
>> Tree, in particular the BCM54213PE PHY might be matched by the BCM54210E
>> entry in drivers/net/phy/broadcom.c and I just fixed an issue in how
>> RGMII delays were configured:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git/commit/?id=fea7fda7f50a6059220f83251e70709e45cc8040
>>
>> This might require you to change the 'phy-mode' property to what is
>> appropriate.
> 
> i applied your changes, kept the phy-mode above and the interfaces cames
> up. But there is a lot of packet loss using ping. After applying this
> downstream patch [1] the packet loss doesn't occur.

Packet loss is symptomatic of a mis-configured RGMII interface between
the MAC and the PHY.

> 
> Is the packet loss a possible cause of the wrong phy-mode and mentioned
> patch only a workaround?

The patch at [1] is not doing much with respect to RGMII delays, so it
will just keep whatever was configured prior to Linux taking over the
PHY. The addition of the BCM54213PE entry makes use of the
bcm54xx_config_init() callback, which does not call
bcm54xx_config_clock_delay() for the BCM54213PE PHY model, which is why
it "solves" the packet loss by preserving whatever was already configured.

I would suggest checking with the Pi folks whether 'rgmii' is really the
right mode of operation here (that is, the PHY is not adding TXC or RXC
delays at all), or it just happens to work by virtue of the PHY device
defaulting to a certain mode *and* the PHY device driver in Linux not
attempting to correctly change the RX/TX clock delays based on the
phy_interface_t value (aka: maintain the status quo).

Thanks for checking!

> 
> [1] -
> https://github.com/raspberrypi/linux/commit/360c8e98883f9cd075564be8a7fc25ac0785dee4
> 

-- 
Florian
