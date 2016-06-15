From: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v5 1/2] Documentation: bindings: add DT documentation for
 Rockchip USB2PHY
Date: Wed, 15 Jun 2016 09:24:28 +0800
Message-ID: <9fa6e288-a6c5-eee7-8cb3-ef52b6a9e6f7@rock-chips.com>
References: <1465783810-18756-1-git-send-email-frank.wang@rock-chips.com>
 <1465783810-18756-2-git-send-email-frank.wang@rock-chips.com>
 <22577234.U1lnbZuDkj@diego> <3008400.RaKLTh6Yt6@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <3008400.RaKLTh6Yt6@diego>
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
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 2016/6/14 21:28, Heiko St=FCbner wrote:
> Am Montag, 13. Juni 2016, 10:38:39 schrieb Heiko St=FCbner:
>> Am Montag, 13. Juni 2016, 10:10:09 schrieb Frank Wang:
>>> Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> looks really cool now, thanks for addressing all the review comments
>>
>> Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> You've only added the very common "reg" property, so I guess it should be=
 just
> fine to keep Rob's Ack on the binding in that case.

OK, I will keep Rob's Ack in the next patch.

> I noticed one thing below though.
> As you'll probably need to do another version (see comments to patch2), y=
ou
> could change that as well in both here and in the second patch - see belo=
w:

Well, I will correct them and send out with a new version later.

>>> ---
>>>
>>> Changes in v5:
>>>   - Added 'reg' property to identify the different phy-blocks.
>>>
>>> Changes in v4:
>>>   - Used 'phy-supply' instead of 'vbus_*-supply'.
>>>
>>> Changes in v3:
>>>   - Added 'clocks' and 'clock-names' optional properties.
>>>   - Specified 'otg-port' and 'host-port' as the sub-node name.
>>>
>>> Changes in v2:
>>>   - Changed vbus_host optional property from gpio to regulator.
>>>   - Specified vbus_otg-supply optional property.
>>>   - Specified otg_id and otg_bvalid property.
>>>   =

>>>   .../bindings/phy/phy-rockchip-inno-usb2.txt        |   64
>>>
>>> ++++++++++++++++++++ 1 file changed, 64 insertions(+)
>>>
>>>   create mode 100644
>>>
>>> Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
>>> b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt new
>>> file
>>> mode 100644
>>> index 0000000..48bb5de
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
>>> @@ -0,0 +1,64 @@
>>> +ROCKCHIP USB2.0 PHY WITH INNO IP BLOCK
>>> +
>>> +Required properties (phy (parent) node):
>>> + - compatible : should be one of the listed compatibles:
>>> +	* "rockchip,rk3366-usb2phy"
>>> +	* "rockchip,rk3399-usb2phy"
>>> + - reg : the address offset of grf for usb-phy configuration.
>>> + - #clock-cells : should be 0.
>>> + - clock-output-names : specify the 480m output clock name.
>>> +
>>> +Optional properties:
>>> + - clocks : phandle + phy specifier pair, for the input clock of phy.
>>> + - clock-names : input clock name of phy, must be "phyclk".
>>> +
>>> +Required nodes : a sub-node is required for each port the phy provides.
>>> +		 The sub-node name is used to identify host or otg port,
>>> +		 and shall be the following entries:
>>> +	* "otg-port" : the name of otg port.
>>> +	* "host-port" : the name of host port.
>>> +
>>> +Required properties (port (child) node):
>>> + - #phy-cells : must be 0. See ./phy-bindings.txt for details.
>>> + - interrupts : specify an interrupt for each entry in interrupt-names.
>>> + - interrupt-names : a list which shall be the following entries:
>>> +	* "otg_id" : for the otg id interrupt.
>>> +	* "otg_bvalid" : for the otg vbus interrupt.
> please use "-" not underscores in dt-bindings, so "otg-id", "otg-bvalid".
>
>
>>> +	* "linestate" : for the host/otg linestate interrupt.
>>> +
>>> +Optional properties:
>>> + - phy-supply : phandle to a regulator that provides power to VBUS.
>>> +		See ./phy-bindings.txt for details.
>>> +
>>> +Example:
>>> +
>>> +grf: syscon@ff770000 {
>>> +	compatible =3D "rockchip,rk3366-grf", "syscon", "simple-mfd";
>>> +	#address-cells =3D <1>;
>>> +	#size-cells =3D <1>;
>>> +
>>> +...
>>> +
>>> +	u2phy: usb2-phy@700 {
>>> +		compatible =3D "rockchip,rk3366-usb2phy";
>>> +		reg =3D <0x700 0x2c>;
>>> +		#clock-cells =3D <0>;
>>> +		clock-output-names =3D "sclk_otgphy0_480m";
>>> +
>>> +		u2phy_otg: otg-port {
>>> +			#phy-cells =3D <0>;
>>> +			interrupts =3D <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
>>> +			interrupt-names =3D "otg_id", "otg_bvalid", "linestate";
> again "-" not "_".
>
>
>>> +			status =3D "okay";
>>> +		};
>>> +
>>> +		u2phy_host: host-port {
>>> +			#phy-cells =3D <0>;
>>> +			interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>>> +			interrupt-names =3D "linestate";
>>> +			status =3D "okay";
>>> +		};
>>> +	};
>>> +};
>

BR.
Frank
