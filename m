From: Frank Wang <frank.wang@rock-chips.com>
Subject: Re: [PATCH v3 1/2] Documentation: bindings: add DT documentation for
 Rockchip USB2PHY
Date: Tue, 7 Jun 2016 11:31:59 +0800
Message-ID: <9a34e448-2b4d-4797-2e6b-c7a36c03b597@rock-chips.com>
References: <1465204804-31161-1-git-send-email-frank.wang@rock-chips.com>
 <1465204804-31161-2-git-send-email-frank.wang@rock-chips.com>
 <20160606112754.GE6831@leverpostej> <7083100.uVXA4CkAgE@diego>
 <2b3e9b0b-f17e-063b-6eb0-2390bd87901b@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2b3e9b0b-f17e-063b-6eb0-2390bd87901b@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Mark Rutland <mark.rutland@arm.com>
Cc: dianders@chromium.org, linux@roeck-us.net, groeck@chromium.org, jwerner@chromium.org, kishon@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org, xzy.xu@rock-chips.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, william.wu@rock-chips.com, frank.wang@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 2016/6/7 10:59, Frank Wang wrote:
> Hi Heiko & Mark,
>
> On 2016/6/6 20:33, Heiko St=C3=BCbner wrote:
>> Am Montag, 6. Juni 2016, 12:27:54 schrieb Mark Rutland:
>>> On Mon, Jun 06, 2016 at 05:20:03PM +0800, Frank Wang wrote:
>>>> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
>>>> ---
>>>>
>>>> Changes in v3:
>>>>   - Added 'clocks' and 'clock-names' optional properties.
>>>>   - Specified 'otg-port' and 'host-port' as the sub-node name.
>>>>
>>>> Changes in v2:
>>>>   - Changed vbus_host optional property from gpio to regulator.
>>>>   - Specified vbus_otg-supply optional property.
>>>>   - Specified otg_id and otg_bvalid property.
>>>>     .../bindings/phy/phy-rockchip-inno-usb2.txt        | 60
>>>>   ++++++++++++++++++++ 1 file changed, 60 insertions(+)
>>>>   create mode 100644
>>>> Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
>>>> b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt=
 new
>>>> file mode 100644
>>>> index 0000000..0b4bbbb
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2=
=2Etxt
>>>> @@ -0,0 +1,60 @@
>>>> +ROCKCHIP USB2.0 PHY WITH INNO IP BLOCK
>>>> +
>>>> +Required properties (phy (parent) node):
>>>> + - compatible : should be one of the listed compatibles:
>>>> +    * "rockchip,rk3366-usb2phy"
>>>> +    * "rockchip,rk3399-usb2phy"
>>>> + - #clock-cells : should be 0.
>>>> + - clock-output-names : specify the 480m output clock name.
>>>> +
>>>> +Optional properties:
>>>> + - clocks : phandle + phy specifier pair, for the input clock of =
phy.
>>>> + - clock-names : input clock name of phy, must be "phyclk".
>>>> + - vbus_host-supply : phandle to a regulator that supplies host v=
bus.
>>>> + - vbus_otg-supply : phandle to a regulator that supplies otg vbu=
s.
>>> Nit: s/_/-/ here.
>> Something I only stumbled over yesterday for the first time on my=20
>> rk3288-
>> popmetal: The phy subnodes seem to be able to use a generic phy-supp=
ly
>> property from inside the phy-core itself, see:
>>
>> https://github.com/mmind/linux-rockchip/commit/93739f521fc65f44524b0=
0c9aaf6db46bca94e02#diff-ddf3e45ebb753d6debf57022003a1a57R597=20
>>
>>
>> for my WIP code for that other board.
>>
>
> Ah, good comments! I will try later, if it is practicable, I shall=20
> correct it into the next patches (patch v4).
>

I am sorry to tell you that seems unworkable, because we have two=20
sub-nodes (phy-ports) in one parent-node (phy),
what is more, the 'phy-supply' property can only put into parent-node, =
I=20
believe it can not be differentiated types of ports.
I mean vbus for host and otg are separately.

>>> Otherwise the rest of this looks generally fine, though I'm confuse=
d as
>>> to how you address the programming interface(s), given none are
>>> described.
>> I think that comes generally down to phy_power_on and phy_power_off=20
>> from the
>> host driver (ehci / dwc2 / whatever) using the generic phy interface=
=2E=20
>> The usb2
>> phys on Rockchip SoCs seem always pretty easy to handle, while the n=
ew
>> additional typeC phy seems to require more work
>>
>
> Yeah, just like that.
>
>>
>>
>>>> +
>>>> +Required nodes : a sub-node is required for each port the phy=20
>>>> provides.
>>>> +         The sub-node name is used to identify host or otg port,
>>>> +         and shall be the following entries:
>>>> +    * "otg-port" : the name of otg port.
>>>> +    * "host-port" : the name of host port.
>>>> +
>>>> +Required properties (port (child) node):
>>>> + - #phy-cells : must be 0. See ./phy-bindings.txt for details.
>>>> + - interrupts : specify an interrupt for each entry in=20
>>>> interrupt-names.
>>>> + - interrupt-names : a list which shall be the following entries:
>>>> +    * "otg_id" : for the otg id interrupt.
>>>> +    * "otg_bvalid" : for the otg vbus interrupt.
>>>> +    * "linestate" : for the host/otg linestate interrupt.
>>>> +
>>>> +Example:
>>>> +
>>>> +grf: syscon@ff770000 {
>>>> +    compatible =3D "rockchip,rk3366-grf", "syscon", "simple-mfd";
>>>> +    #address-cells =3D <1>;
>>>> +    #size-cells =3D <1>;
>>>> +
>>>> +...
>>>> +
>>>> +    u2phy: usb2-phy {
>>>> +        compatible =3D "rockchip,rk3366-usb2phy";
>>>> +        #clock-cells =3D <0>;
>>>> +        clock-output-names =3D "sclk_otgphy0_480m";
>>>> +
>>>> +        u2phy_otg: otg-port {
>>>> +            #phy-cells =3D <0>;
>>>> +            interrupts =3D <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
>>>> +            interrupt-names =3D "otg_id", "otg_bvalid", "linestat=
e";
>>>> +            status =3D "okay";
>>>> +        };
>>>> +
>>>> +        u2phy_host: host-port {
>>>> +            #phy-cells =3D <0>;
>>>> +            interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>>>> +            interrupt-names =3D "linestate";
>>>> +            status =3D "okay";
>>>> +        };
>>>> +    };
>>>> +};
