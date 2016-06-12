From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH 1/2] Documentation: bindings: add dt documentation for
 Rockchip PCIe PHY
Date: Sun, 12 Jun 2016 15:38:52 +0800
Message-ID: <d2aa6f82-7b20-8c40-c134-370e9f91281e@rock-chips.com>
References: <1465370708-23619-1-git-send-email-shawn.lin@rock-chips.com>
 <20160608202900.GA25662@rob-hp-laptop> <1524911.R4OXTTYFIK@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524911.R4OXTTYFIK@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Rob Herring <robh@kernel.org>
Cc: shawn.lin@rock-chips.com, devicetree@vger.kernel.org, Wenrui Li <wenrui.li@rock-chips.com>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: devicetree@vger.kernel.org

On 2016/6/9 4:40, Heiko St=FCbner wrote:
> Am Mittwoch, 8. Juni 2016, 15:29:00 schrieb Rob Herring:
>> gOn Wed, Jun 08, 2016 at 03:25:08PM +0800, Shawn Lin wrote:
>>> This patch adds a binding that describes the Rockchip PCIe PHY
>>> found on Rockchip SoCs PCIe interface.
>>>
>>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>>> ---
>>>
>>>  .../devicetree/bindings/phy/rockchip-pcie-phy.txt  | 22
>>>  ++++++++++++++++++++++ 1 file changed, 22 insertions(+)
>>>  create mode 100644
>>>  Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt>
>>> diff --git a/Documentation/devicetree/bindings/phy/rockchip-pcie-ph=
y.txt
>>> b/Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt new f=
ile
>>> mode 100644
>>> index 0000000..ba8c406
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt
>>> @@ -0,0 +1,22 @@
>>> +Rockchip PCIE PHY
>>> +-----------------------
>>> +
>>> +Required properties:
>>> + - compatible: rockchip,rk3399-pcie-phy
>>> + - #phy-cells: must be 0
>>> +
>>> +Example:
>>> +
>>> +grf: syscon@ff770000 {
>>> +	compatible =3D "rockchip,rk3399-grf", "syscon", "simple-mfd";
>>> +	#address-cells =3D <1>;
>>> +	#size-cells =3D <1>;
>>> +
>>> +	...
>>> +
>>> +	pcie_phy: phy@e220 {
>>
>> unit-address needs a reg property or drop the unit address. I'd do t=
he
>> former if there's a register range you can describe here.
>
> Hmm, I think I'd suggest going the other way - call the node pcie-phy=
 .

pcie phy does not cantain a reg range, so I will drop the unit-address.

>
> While the General Register Files do contain some specific address ran=
ges (like
> for the emmc phy, or some performance monitor things), the register a=
t 0xe220
> is a shared register (GRF_SOC_CON8), containing both i2s and pcie set=
ting
> bits.

yes, we only need two bits: test_addr(for pcie phy's internal configure
address) and test_i(corresponding value for the address given) whthin
GRF_SOC_CON8 to W/R the phy.

>
> Specifying register ranges suggests some form of exclusivity to me - =
which is
> just great for things like the emmc phy that has an actual range, but=
 for a
> device being controlled from some shared register.
>
>
> Heiko
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>


--=20
Best Regards
Shawn Lin
