Return-Path: <SRS0=YBUU=NU=linux.intel.com=felipe.balbi@kernel.org>
From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH 1/3] usb: dwc3: Add reference clock properties
In-Reply-To: <30102591E157244384E984126FC3CB4F639A114E@us01wembx1.internal.synopsys.com>
References: <cover.1541208283.git.thinhn@synopsys.com> <ca0957e58d1d7c1ed49b53345a5c4ed9209c0968.1541208283.git.thinhn@synopsys.com> <877ehqv44p.fsf@linux.intel.com> <30102591E157244384E984126FC3CB4F639A080E@us01wembx1.internal.synopsys.com> <871s7xv1et.fsf@linux.intel.com> <30102591E157244384E984126FC3CB4F639A0ACE@us01wembx1.internal.synopsys.com> <874lcst4wg.fsf@linux.intel.com> <30102591E157244384E984126FC3CB4F639A0FB0@us01wembx1.internal.synopsys.com> <87muqisoxg.fsf@linux.intel.com> <30102591E157244384E984126FC3CB4F639A114E@us01wembx1.internal.synopsys.com>
Date: Fri, 09 Nov 2018 10:54:45 +0200
Message-ID: <87k1lmska2.fsf@linux.intel.com>
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
>>>> Thinh Nguyen <thinh.nguyen@synopsys.com> writes:
>>>>>>>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Doc=
umentation/devicetree/bindings/usb/dwc3.txt
>>>>>>>>> index 636630fb92d7..712b344c3a31 100644
>>>>>>>>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>>>>>>>>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>>>>>>>>> @@ -95,6 +95,24 @@ Optional properties:
>>>>>>>>>  			this and tx-thr-num-pkt-prd to a valid, non-zero value
>>>>>>>>>  			1-16 (DWC_usb31 programming guide section 1.2.3) to
>>>>>>>>>  			enable periodic ESS TX threshold.
>>>>>>>>> + - snps,refclk-period-ns: set to program the reference clock per=
iod. The valid
>>>>>>>>> +   			input periods are as follow:
>>>>>>>>> +			+-------------+-----------------+
>>>>>>>>> +			| Period (ns) | Freq (MHz)      |
>>>>>>>>> +			+-------------+-----------------+
>>>>>>>>> +			| 25          | 39.7/40         |
>>>>>>>>> +			| 41          | 24.4            |
>>>>>>>>> +			| 50          | 20              |
>>>>>>>>> +			| 52          | 19.2            |
>>>>>>>>> +			| 58          | 17.2            |
>>>>>>>>> +			| 62          | 16.1            |
>>>>>>>>> +			+-------------+-----------------+
>>>>>>>>> + - snps,enable-refclk-lpm: set to enable low power scheduling of=
 isochronous
>>>>>>>>> +			transfers by running SOF/ITP counters using the
>>>>>>>>> +			reference clock. Only valid for DWC_usb31 peripheral
>>>>>>>>> +			controller v1.80a and higher. Both
>>>>>>>>> +			"snps,dis_u2_susphy_quirk" and
>>>>>>>>> +			"snps,dis_enblslpm_quirk" must not be set.
>>>>>>>> sounds like you should rely on clk API here. Then on driver call
>>>>>>>> clk_get_rate() to computer whatever you need to compute.
>>>>>>>>
>>>>>>> There's nothing to compute here. We can simply enable this feature =
with
>>>>>>> "snps, enable-refclk-lpm" and the controller will use the default r=
efclk
>>>>>>> settings.
>>>>>> Right, right. What I'm saying, though, is that we have a clock API f=
or
>>>>>> describing a clock. So why wouldn't we rely on that API for this? I
>>>>>> think both of these new properties can be replaced with standard clo=
ck
>>>>>> API properties:
>>>>>>
>>>>>> 	clocks =3D <&clk1>, ..., <&lpm_clk>
>>>>>>         clock-names =3D "clock1", ...., "lpm";
>>>>>>
>>>>>> Then dwc3 core could, simply, check if we have a clock named "lpm" a=
nd
>>>>>> if there is, use NSECS_PER_SEC / clk_get_rate() to get its period and
>>>>>> write it to the register that needs the information.
>>>>> There's no new clock here. We are using the ref_clk for SOF and ITP
>>>>> counter for this feature. Also, clocks are optional on non-DT platfor=
ms.
>>>>> To use the clock API, then we need to update the driver to allow some
>>>>> optional clock such as "ref" clock for non-DT platforms. Do you want =
to
>>>>> do it like this?
>>>> I can't think of a problem that would arise from that. Can you? Mark,
>>>> Rob, what do you think?
>>>>
>>> No problem. That can be done. This will remove the
>>> "snps,refclk-period-ns" property. But we should have
>>> "snps,enable-refclk-lpm" to enable this feature.
>> not really. Just check if you have a clock named lpm. If you do, then
>> you enable the feature.
>>
> But this clock name should be "ref".  The new name "lpm" would make it
> seem like it's a different clock.

now I understand. There's no special LPM clock, this is just the regular
old reference clock being used for LPM. I agree with you, only
refclk-period-ns will be replaced.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlvlS1UACgkQzL64meEa
mQaJ9w//bNYQZVwnIJ0lrf+mujgqu0LevqyDQc1r7pwxYu/i0zgIxj7RW9cqcIX9
w/6PwXa4XaAx+9vvGRLrvuRVFjwPPRulGz9hWDl8S8iXgv5Wx4rzqd+5fmRz3OkC
BMjKtGSJrLu9kb2+fQ6qYdkA1Ddm6Z5SqTaT3iX4OeGmNpYPV6v6HjfnUW7/1MB5
+WQnC+/iECfLQMnH6A2nvbbQhentUcImss8x9awkNhG24QoE4VVpJYxUODaGxJv0
+QZ6j/EJMF9yg+ENhK0y1GuaGkPMLhI371lU8Nmvjry6Ak+3dN2zRF00svs680Fq
z+Rg5FW/pTiwwNkZBPAZso3jyWXBxc1ZrG6s1xN6K8LayHODsli79cpz0r3xka3i
hYERCFqBIMUUaLfMG62AxIOP0wwlR+KSC1V+Y6dQlupypaHZJomDUIiCuYZYqcPW
9vtnJxryr45jQacf7XFdscNWsdFLS9e+WILmdPJ+3XmeMZooqmm4VPLhWzQmRs2k
W/2TcKwPEY0zhpZTSoNPcJnyCgz6PaQqHFhmx8KHiAPseeVMNEahEu9C0//HgPig
ITn0M/kMDtsnyYmtkiJc5naTLKd5OyNpZ9geFdrwqWd2K5MMJ54GL+hCOC0rCwb0
RHIFZWOjIgT32c9/miVplgk6GapPJOSRtuxlnJqkuA0dFtWP7IE=
=zAVZ
-----END PGP SIGNATURE-----
--=-=-=--
