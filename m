From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v2 5/5] usb: dwc3: rockchip: add devicetree bindings documentation
Date: Wed, 25 May 2016 11:04:12 +0300
Message-ID: <871t4qsgw3.fsf@linux.intel.com>
References: <1463133155-20047-1-git-send-email-william.wu@rock-chips.com> <87a8jfu7h4.fsf@linux.intel.com> <57455A81.5080101@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57455A81.5080101@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Wu <william.wu@rock-chips.com>, gregkh@linuxfoundation.org, heiko@sntech.de, Rob Herring <robh+dt@kernel.org>
Cc: linux-rockchip@lists.infradead.org, briannorris@google.com, dianders@google.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, frank.wang@rock-chips.com, eddie.cai@rock-chips.com, John.Youn@synopsys.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

William Wu <william.wu@rock-chips.com> writes:
> Hi Felipe,
>
> On 05/24/2016 05:32 PM, Felipe Balbi wrote:
>> Hi,
>>
>> William Wu <william.wu@rock-chips.com> writes:
>>> This patch documents the device tree documentation required for
>>> Rockchip USB3.0 core wrapper consist of USB3.0 IP from Synopsys.
>>>
>>> It could operate in device mode (SS, HS, FS) and host
>>> mode (SS, HS, FS, LS).
>>>
>>> Signed-off-by: William Wu <william.wu@rock-chips.com>
>>> ---
>>> Changes in v2:
>>> - add rockchip,dwc3.txt to Documentation/devicetree/bindings/ (Felipe, =
Brian)
>>>
>>>   .../devicetree/bindings/usb/rockchip,dwc3.txt      | 45 +++++++++++++=
+++++++++
>>>   1 file changed, 45 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/usb/rockchip,dwc=
3.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt b/=
Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
>>> new file mode 100644
>>> index 0000000..10303d9
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
>>> @@ -0,0 +1,45 @@
>>> +Rockchip SuperSpeed DWC3 USB SoC controller
>>> +
>>> +Required properties:
>>> +- compatible:	should contain "rockchip,dwc3"
>>> +- clocks:		A list of phandle + clock-specifier pairs for the
>>> +				clocks listed in clock-names
>>> +- clock-names:	Should contain the following:
>>> +  "clk_usb3otg0_ref"	Controller reference clk
>>> +  "clk_usb3otg0_suspend"Controller suspend clk, can use 24 MHz or 32 K=
Hz
>>> +  "aclk_usb3"		Master/Core clock, have to be >=3D 62.5 MHz for SS oper=
ation
>>> +
>>> +
>>> +Optional clocks:
>>> +  "aclk_usb3otg0"	Aclk for specific usb controller clock.
>>> +  "aclk_usb3_rksoc_axi_perf"  USB AXI perf clock.  Not present on all =
platforms.
>>> +  "aclk_usb3_grf"	USB grf clock.  Not present on all platforms.
>>> +
>>> +Required child node:
>>> +A child node must exist to represent the core DWC3 IP block. The name =
of
>>> +the node is not important. The content of the node is defined in dwc3.=
txt.
>>> +
>>> +Phy documentation is provided in the following places:
>>> +
>>> +Example device nodes:
>>> +
>>> +	usbdrd3_0: usb@fe800000 {
>>> +
>> no reg property?
> For now, we don't need reg property here. Because we only need to do
> enable some clocks and populate its children in=20
> drivers/usb/dwc3/dwc3-of-simple.c.
> And it's similar to arch/arm/boot/dts/exynos5420.dtsi usbdrd3_0 node.
>> 		compatible =3D "rockchip,dwc3";
>>> +		clocks =3D <&cru SCLK_USB3OTG0_REF>, <&cru SCLK_USB3OTG0_SUSPEND>,
>>> +			 <&cru ACLK_USB3>, <&cru ACLK_USB3OTG0>,
>>> +			 <&cru ACLK_USB3_RKSOC_AXI_PERF>, <&cru ACLK_USB3_GRF>;
>>> +		clock-names =3D "clk_usb3otg0_ref", "clk_usb3otg0_suspend",
>>> +			      "aclk_usb3", "aclk_usb3otg0",
>>> +			      "aclk_usb3_rksoc_axi_perf", "aclk_usb3_grf";
>>> +		#address-cells =3D <2>;
>>> +		#size-cells =3D <2>;
>>> +		ranges;
>>> +		status =3D "disabled";
>>> +		usbdrd_dwc3_0: dwc3 {
>> no address here?
> I think here don't  necessarily need address. The child node dwc3 can=20
> inherit address from the parent node.
> And with this dtsi patch, the dev path show as follows:
> /sys/devices/platform/usb@fe800000/fe800000.dwc3
>
> Is it need for coding style or other reason?

I don't think your arguments match what devicetree folks want to see in
DT. Let's ask them. Rob, care to look at this one?

>
>>
>>> +			compatible =3D "snps,dwc3";
>>> +			reg =3D <0x0 0xfe800000 0x0 0x100000>;
>>> +			interrupts =3D <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
>>> +			dr_mode =3D "otg";
>>> +			status =3D "disabled";
>>> +		};
>>> +	};
>>> --=20
>>> 1.9.1
>>>
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXRVx8AAoJEIaOsuA1yqREN9wP/0awYr61ZnqctAEzuByZTJMg
uKywFlgAH7dANbe+UwVyId38cSs2i813k/hT5BujWpElMqtISD1xKWYXWlfK/vhD
vQSHJwt6ksexqiqBzD4JLAlBchXZCc5eAtbcOGW8C91YDNjbte+U2/5eCkgo+yWB
VZx1MpHHmG7dkH+2fTiPKiitoNHvZUBBjIG4+yetixysuh/UTtjhrZsQIBPhVoSr
Flx//vrzCJQUqmiZRZ2+un6J+BjdzbbRXwfHbcL175deuScMztHRDdC/OuH9RjSx
tn2X+azIS7pDQqcceAjDJJRIm2q47UFa5kV5fpibKcQv9auq7NYQCVOL+5YrBx2Z
8jPa3q7C7OkcSTYVD73qPI4DB9Hhy6RRXBzEgLAIzfAAa6VvMk/QQvQ+9kqs0xgA
V/OhwmLIiLLGsPkga0J1fOPIkhLxYUTtqN+2kjMWARzKe3hDnRvmy5PD3CmI6FVq
JcLdsSKmPfDN2KVIUC9TCxUCHnuoMiG2LT60SPZldmcVC64yCdEqe+6BYnJPabeA
IBvjEZ5e5HEkj1zEC0uFFE0zXAnmsofltOYkIMl/VgmOqmAh2TT5RCHwN1WOWBek
/jTSoEUzuavxHmVjt/4S/8mD9osEWHDH6FQE/qlQV0i41i6R21Cl+J48o9RC4psv
wajHn2rbmpJ2W5XmJCW5
=k6Iq
-----END PGP SIGNATURE-----
--=-=-=--
