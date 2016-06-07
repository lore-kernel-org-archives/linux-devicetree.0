From: Frank Wang <frank.wang@rock-chips.com>
Subject: Re: [PATCH v3 1/2] Documentation: bindings: add DT documentation for
 Rockchip USB2PHY
Date: Tue, 7 Jun 2016 16:23:26 +0800
Message-ID: <54dd6b6d-29a3-0a85-5d69-9d940da5b9b1@rock-chips.com>
References: <1465204804-31161-1-git-send-email-frank.wang@rock-chips.com>
 <1465204804-31161-2-git-send-email-frank.wang@rock-chips.com>
 <20160606112754.GE6831@leverpostej> <7083100.uVXA4CkAgE@diego>
 <2b3e9b0b-f17e-063b-6eb0-2390bd87901b@rock-chips.com>
 <9a34e448-2b4d-4797-2e6b-c7a36c03b597@rock-chips.com>
 <57567B88.7000607@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57567B88.7000607@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Mark Rutland <mark.rutland@arm.com>
Cc: dianders@chromium.org, linux@roeck-us.net, groeck@chromium.org, jwerner@chromium.org, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org, xzy.xu@rock-chips.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, william.wu@rock-chips.com, frank.wang@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi Kishon & Heiko,

On 2016/6/7 15:45, Kishon Vijay Abraham I wrote:
> Hi,
>
> On Tuesday 07 June 2016 09:01 AM, Frank Wang wrote:
>> Hi Heiko,
>>
>> On 2016/6/7 10:59, Frank Wang wrote:
>>> Hi Heiko & Mark,
>>>
>>> On 2016/6/6 20:33, Heiko St=C3=BCbner wrote:
>>>> Am Montag, 6. Juni 2016, 12:27:54 schrieb Mark Rutland:
>>>>> On Mon, Jun 06, 2016 at 05:20:03PM +0800, Frank Wang wrote:
>>>>>> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
>>>>>> ---
>>>>>>
>>>>>> Changes in v3:
>>>>>>    - Added 'clocks' and 'clock-names' optional properties.
>>>>>>    - Specified 'otg-port' and 'host-port' as the sub-node name.
>>>>>>
>>>>>> Changes in v2:
>>>>>>    - Changed vbus_host optional property from gpio to regulator.
>>>>>>    - Specified vbus_otg-supply optional property.
>>>>>>    - Specified otg_id and otg_bvalid property.
>>>>>>      .../bindings/phy/phy-rockchip-inno-usb2.txt        | 60
>>>>>>    ++++++++++++++++++++ 1 file changed, 60 insertions(+)
>>>>>>    create mode 100644
>>>>>> Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt=
>
>>>>>> diff --git
>>>>>> a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.t=
xt
>>>>>> b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.t=
xt new
>>>>>> file mode 100644
>>>>>> index 0000000..0b4bbbb
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-us=
b2.txt
>>>>>> @@ -0,0 +1,60 @@
>>>>>> +ROCKCHIP USB2.0 PHY WITH INNO IP BLOCK
>>>>>> +
>>>>>> +Required properties (phy (parent) node):
>>>>>> + - compatible : should be one of the listed compatibles:
>>>>>> +    * "rockchip,rk3366-usb2phy"
>>>>>> +    * "rockchip,rk3399-usb2phy"
>>>>>> + - #clock-cells : should be 0.
>>>>>> + - clock-output-names : specify the 480m output clock name.
>>>>>> +
>>>>>> +Optional properties:
>>>>>> + - clocks : phandle + phy specifier pair, for the input clock o=
f phy.
>>>>>> + - clock-names : input clock name of phy, must be "phyclk".
>>>>>> + - vbus_host-supply : phandle to a regulator that supplies host=
 vbus.
>>>>>> + - vbus_otg-supply : phandle to a regulator that supplies otg v=
bus.
>>>>> Nit: s/_/-/ here.
>>>> Something I only stumbled over yesterday for the first time on my =
rk3288-
>>>> popmetal: The phy subnodes seem to be able to use a generic phy-su=
pply
>>>> property from inside the phy-core itself, see:
>>>>
>>>> https://github.com/mmind/linux-rockchip/commit/93739f521fc65f44524=
b00c9aaf6db46bca94e02#diff-ddf3e45ebb753d6debf57022003a1a57R597
>>>>
>>>>
>>>> for my WIP code for that other board.
>>>>
>>> Ah, good comments! I will try later, if it is practicable, I shall =
correct it
>>> into the next patches (patch v4).
>>>
>> I am sorry to tell you that seems unworkable, because we have two su=
b-nodes
>> (phy-ports) in one parent-node (phy),
>> what is more, the 'phy-supply' property can only put into parent-nod=
e, I
>> believe it can not be differentiated types of ports.
> 'phy-supply' is a property of the phy node and not the 'phy-provider'=
 node. So
> IMO this should work. What problem do you see?

Sorry, I think I must have made a wrong phandle of phy-port name in=20
*.dts before.
Yes, It works now, thanks for your reminding.

@Heiko,
I have just received your another mail, thanks again for your detail=20
explanation.

I will correct it in the next patches (patch v4).

BR.
=46rank
