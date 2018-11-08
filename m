Return-Path: <SRS0=Rkst=NT=linux.intel.com=felipe.balbi@kernel.org>
From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH 1/3] usb: dwc3: Add reference clock properties
In-Reply-To: <30102591E157244384E984126FC3CB4F639A0ACE@us01wembx1.internal.synopsys.com>
References: <cover.1541208283.git.thinhn@synopsys.com> <ca0957e58d1d7c1ed49b53345a5c4ed9209c0968.1541208283.git.thinhn@synopsys.com> <877ehqv44p.fsf@linux.intel.com> <30102591E157244384E984126FC3CB4F639A080E@us01wembx1.internal.synopsys.com> <871s7xv1et.fsf@linux.intel.com> <30102591E157244384E984126FC3CB4F639A0ACE@us01wembx1.internal.synopsys.com>
Date: Thu, 08 Nov 2018 09:17:03 +0200
Message-ID: <874lcst4wg.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
To: Thinh Nguyen <thinh.nguyen@synopsys.com>Thinh Nguyen <thinh.nguyen@synopsys.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Thinh Nguyen <thinh.nguyen@synopsys.com> writes:
>>>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documen=
tation/devicetree/bindings/usb/dwc3.txt
>>>>> index 636630fb92d7..712b344c3a31 100644
>>>>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>>>>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>>>>> @@ -95,6 +95,24 @@ Optional properties:
>>>>>  			this and tx-thr-num-pkt-prd to a valid, non-zero value
>>>>>  			1-16 (DWC_usb31 programming guide section 1.2.3) to
>>>>>  			enable periodic ESS TX threshold.
>>>>> + - snps,refclk-period-ns: set to program the reference clock period.=
 The valid
>>>>> +   			input periods are as follow:
>>>>> +			+-------------+-----------------+
>>>>> +			| Period (ns) | Freq (MHz)      |
>>>>> +			+-------------+-----------------+
>>>>> +			| 25          | 39.7/40         |
>>>>> +			| 41          | 24.4            |
>>>>> +			| 50          | 20              |
>>>>> +			| 52          | 19.2            |
>>>>> +			| 58          | 17.2            |
>>>>> +			| 62          | 16.1            |
>>>>> +			+-------------+-----------------+
>>>>> + - snps,enable-refclk-lpm: set to enable low power scheduling of iso=
chronous
>>>>> +			transfers by running SOF/ITP counters using the
>>>>> +			reference clock. Only valid for DWC_usb31 peripheral
>>>>> +			controller v1.80a and higher. Both
>>>>> +			"snps,dis_u2_susphy_quirk" and
>>>>> +			"snps,dis_enblslpm_quirk" must not be set.
>>>> sounds like you should rely on clk API here. Then on driver call
>>>> clk_get_rate() to computer whatever you need to compute.
>>>>
>>> There's nothing to compute here. We can simply enable this feature with
>>> "snps, enable-refclk-lpm" and the controller will use the default refclk
>>> settings.
>> Right, right. What I'm saying, though, is that we have a clock API for
>> describing a clock. So why wouldn't we rely on that API for this? I
>> think both of these new properties can be replaced with standard clock
>> API properties:
>>
>> 	clocks =3D <&clk1>, ..., <&lpm_clk>
>>         clock-names =3D "clock1", ...., "lpm";
>>
>> Then dwc3 core could, simply, check if we have a clock named "lpm" and
>> if there is, use NSECS_PER_SEC / clk_get_rate() to get its period and
>> write it to the register that needs the information.
> There's no new clock here. We are using the ref_clk for SOF and ITP
> counter for this feature. Also, clocks are optional on non-DT platforms.
> To use the clock API, then we need to update the driver to allow some
> optional clock such as "ref" clock for non-DT platforms. Do you want to
> do it like this?

I can't think of a problem that would arise from that. Can you? Mark,
Rob, what do you think?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlvj4u8ACgkQzL64meEa
mQZ5GxAA0OurrbXJzDMvTqGt2+WyOO/otx5aDMXAkXA4rZwFy6pP+w/eQtaaUdeV
ymGXWrNj973OAr2JwtI/Y9EyvC1gE9/bogoDnqW90hOU74kczzvm2RDdvz+DSwiG
2d+k3hTTwZHR7C0HG4jp8E61YXVJ3DX7zuafL/uD4SQnmegMUp4pthqYlzEMFNW8
1PkaVhdiK1JnWKb/Tjkcg+DGYG7WaRfBsyPI7s6zyKKAyUe/1oys3VxauUehzPwt
fKPCjekidwapWOauhLBwqi4ZzTyVVzt/jclfzOT3P8/WE1QxfCGqZNM6aiL9aOKa
aN0KAHq/jEIksagJIjeGdJN19DRQnT/iNG4G9tJ9cKkceuuf/8pJcWiN9LPfHAPs
X5JX2hDrZGl03/zCoDxwV5Xq9noLp1RQultsH8pjp72BTgIgaMJ5UcYjgzsVtcV/
+LOhFJegH6jcBQfP8V7cAHsBG7nfQLyE7+7yzq6YfyNxyF+U3uAhxutSYMLntm+g
CSK+mIEiBW1CNysEyG/0K4LCTgsT6d5zb7lMwf2ascBpzW0U0EQv1q9iUz3PZlLd
D4zv0v+kX62wDnqxw24xA/NgptongME34JfuYQ2Of4/Zbxx8MAMZ9klFNTD58Q7H
r7Opnqrtymkn2WKocXBZg48GnJk6hbiN2jPIa0y26Yo7ffCsBZU=
=P7wo
-----END PGP SIGNATURE-----
--=-=-=--
