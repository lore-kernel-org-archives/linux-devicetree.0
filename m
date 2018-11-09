Return-Path: <SRS0=YBUU=NU=linux.intel.com=felipe.balbi@kernel.org>
From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH 1/3] usb: dwc3: Add reference clock properties
In-Reply-To: <30102591E157244384E984126FC3CB4F639A0FB0@us01wembx1.internal.synopsys.com>
References: <cover.1541208283.git.thinhn@synopsys.com> <ca0957e58d1d7c1ed49b53345a5c4ed9209c0968.1541208283.git.thinhn@synopsys.com> <877ehqv44p.fsf@linux.intel.com> <30102591E157244384E984126FC3CB4F639A080E@us01wembx1.internal.synopsys.com> <871s7xv1et.fsf@linux.intel.com> <30102591E157244384E984126FC3CB4F639A0ACE@us01wembx1.internal.synopsys.com> <874lcst4wg.fsf@linux.intel.com> <30102591E157244384E984126FC3CB4F639A0FB0@us01wembx1.internal.synopsys.com>
Date: Fri, 09 Nov 2018 09:14:19 +0200
Message-ID: <87muqisoxg.fsf@linux.intel.com>
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
>> Thinh Nguyen <thinh.nguyen@synopsys.com> writes:
>>>>>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Docum=
entation/devicetree/bindings/usb/dwc3.txt
>>>>>>> index 636630fb92d7..712b344c3a31 100644
>>>>>>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>>>>>>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>>>>>>> @@ -95,6 +95,24 @@ Optional properties:
>>>>>>>  			this and tx-thr-num-pkt-prd to a valid, non-zero value
>>>>>>>  			1-16 (DWC_usb31 programming guide section 1.2.3) to
>>>>>>>  			enable periodic ESS TX threshold.
>>>>>>> + - snps,refclk-period-ns: set to program the reference clock perio=
d. The valid
>>>>>>> +   			input periods are as follow:
>>>>>>> +			+-------------+-----------------+
>>>>>>> +			| Period (ns) | Freq (MHz)      |
>>>>>>> +			+-------------+-----------------+
>>>>>>> +			| 25          | 39.7/40         |
>>>>>>> +			| 41          | 24.4            |
>>>>>>> +			| 50          | 20              |
>>>>>>> +			| 52          | 19.2            |
>>>>>>> +			| 58          | 17.2            |
>>>>>>> +			| 62          | 16.1            |
>>>>>>> +			+-------------+-----------------+
>>>>>>> + - snps,enable-refclk-lpm: set to enable low power scheduling of i=
sochronous
>>>>>>> +			transfers by running SOF/ITP counters using the
>>>>>>> +			reference clock. Only valid for DWC_usb31 peripheral
>>>>>>> +			controller v1.80a and higher. Both
>>>>>>> +			"snps,dis_u2_susphy_quirk" and
>>>>>>> +			"snps,dis_enblslpm_quirk" must not be set.
>>>>>> sounds like you should rely on clk API here. Then on driver call
>>>>>> clk_get_rate() to computer whatever you need to compute.
>>>>>>
>>>>> There's nothing to compute here. We can simply enable this feature wi=
th
>>>>> "snps, enable-refclk-lpm" and the controller will use the default ref=
clk
>>>>> settings.
>>>> Right, right. What I'm saying, though, is that we have a clock API for
>>>> describing a clock. So why wouldn't we rely on that API for this? I
>>>> think both of these new properties can be replaced with standard clock
>>>> API properties:
>>>>
>>>> 	clocks =3D <&clk1>, ..., <&lpm_clk>
>>>>         clock-names =3D "clock1", ...., "lpm";
>>>>
>>>> Then dwc3 core could, simply, check if we have a clock named "lpm" and
>>>> if there is, use NSECS_PER_SEC / clk_get_rate() to get its period and
>>>> write it to the register that needs the information.
>>> There's no new clock here. We are using the ref_clk for SOF and ITP
>>> counter for this feature. Also, clocks are optional on non-DT platforms.
>>> To use the clock API, then we need to update the driver to allow some
>>> optional clock such as "ref" clock for non-DT platforms. Do you want to
>>> do it like this?
>> I can't think of a problem that would arise from that. Can you? Mark,
>> Rob, what do you think?
>>
> No problem. That can be done. This will remove the
> "snps,refclk-period-ns" property. But we should have
> "snps,enable-refclk-lpm" to enable this feature.

not really. Just check if you have a clock named lpm. If you do, then
you enable the feature.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlvlM8sACgkQzL64meEa
mQY6Yw//TI4Vfb2oz3sSf/CO3dIjjnv4gJ0gbNvvUZVOfkWYIzuzWPT37qBT/EiP
k/RckKR9omsCVDd1Tolf0EFwHiJ2fMGTmIWXjhs3GnjeovzsTEPxa6czRxQsApN1
8KD0CONhp0A0LLZSnA+R6FJXRkYNpUUS1NT0XJ8wQHNqzQuU3nnyTWu38B9TmW9f
D+m53HTcvM2TyJ7R4VZLmMM4TWdk4GunqddJODq2fsE4vNn0hLeW9j9+pvh0s58o
YljqgW4gAT3iZrBka6UZB1/p+PpmNL0TYsm9DkyI+z27skqE49Jn8wtpfoKyMPbd
pxXtU3QFkdr05TkfCp18ioB05TYwAfyXKJ1RNEbqsJUxPcrYMrBftJGfcD1UfKbb
IfmTuqOD2kQdjxLPrPg13nC/X/j2+I95ZKgnv8+MTkXc4FVxHhyK2OIUD6PclpFS
WWrhJglDpLAGbcbRbzpAO3lSOuZoxD1opZ1s31VpSGkl2eyCEYNfUShkWFWZTRDj
Li1z/ReF5jpuLYzRtDMF7MJv5xPm0JXp5UGHsTksqXTB0xNbLjyrBJU+Hunq/Ndg
+dEfRSm4W2lt4nrvoZ/25reaUupVB7yCn0ekXGko84+u7X43qj2KhHnKtaf/7pw2
wI6r3P8nOvr1WKp9uKLtWFcnsKluxc4uVXb+3t8Uso/lXHF10mQ=
=Frei
-----END PGP SIGNATURE-----
--=-=-=--
