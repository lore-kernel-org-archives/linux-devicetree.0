Return-Path: <SRS0=eKhM=NS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:50139 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726194AbeKGQGX (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 7 Nov 2018 11:06:23 -0500
From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH 1/3] usb: dwc3: Add reference clock properties
In-Reply-To: <30102591E157244384E984126FC3CB4F639A080E@us01wembx1.internal.synopsys.com>
References: <cover.1541208283.git.thinhn@synopsys.com> <ca0957e58d1d7c1ed49b53345a5c4ed9209c0968.1541208283.git.thinhn@synopsys.com> <877ehqv44p.fsf@linux.intel.com> <30102591E157244384E984126FC3CB4F639A080E@us01wembx1.internal.synopsys.com>
Date: Wed, 07 Nov 2018 08:37:14 +0200
Message-ID: <871s7xv1et.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: devicetree-owner@vger.kernel.org
To: Thinh Nguyen <thinh.nguyen@synopsys.com>Thinh Nguyen <thinh.nguyen@synopsys.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Thinh Nguyen <thinh.nguyen@synopsys.com> writes:
>> Thinh Nguyen <thinh.nguyen@synopsys.com> writes:
>>> Add two new device properties to program the reference clock period and
>>> to enable low power management using the reference clock. This allows a
>>> higher demand to go in low power for Audio Device Class devices. This
>>> feature is currently only valid for DWC_usb31 peripheral controller
>>> v1.80a and higher.
>>>
>>> Set "snps,refclk-period-ns" to program the reference clock period. The
>>> valid input periods are as follow:
>>>  +-------------+-----------------+
>>>  | Period (ns) | Freq (MHz)      |
>>>  +-------------+-----------------+
>>>  | 25          | 39.7/40         |
>>>  | 41          | 24.4            |
>>>  | 50          | 20              |
>>>  | 52          | 19.2            |
>>>  | 58          | 17.2            |
>>>  | 62          | 16.1            |
>>>  +-------------+-----------------+
>>>
>>> Set "snps,refclk-lpm" to enable low power scheduling of isochronous
>>> transfers by running SOF/ITP counters using the reference clock. Both
>>> "snps,dis_u2_susphy_quirk" and "snps,dis_enblslpm_quirk" must not be
>>> set for this feature to be enabled.
>>>
>>> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
>>> ---
>>>  Documentation/devicetree/bindings/usb/dwc3.txt | 18 ++++++++++++++++++
>>>  1 file changed, 18 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documenta=
tion/devicetree/bindings/usb/dwc3.txt
>>> index 636630fb92d7..712b344c3a31 100644
>>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>>> @@ -95,6 +95,24 @@ Optional properties:
>>>  			this and tx-thr-num-pkt-prd to a valid, non-zero value
>>>  			1-16 (DWC_usb31 programming guide section 1.2.3) to
>>>  			enable periodic ESS TX threshold.
>>> + - snps,refclk-period-ns: set to program the reference clock period. T=
he valid
>>> +   			input periods are as follow:
>>> +			+-------------+-----------------+
>>> +			| Period (ns) | Freq (MHz)      |
>>> +			+-------------+-----------------+
>>> +			| 25          | 39.7/40         |
>>> +			| 41          | 24.4            |
>>> +			| 50          | 20              |
>>> +			| 52          | 19.2            |
>>> +			| 58          | 17.2            |
>>> +			| 62          | 16.1            |
>>> +			+-------------+-----------------+
>>> + - snps,enable-refclk-lpm: set to enable low power scheduling of isoch=
ronous
>>> +			transfers by running SOF/ITP counters using the
>>> +			reference clock. Only valid for DWC_usb31 peripheral
>>> +			controller v1.80a and higher. Both
>>> +			"snps,dis_u2_susphy_quirk" and
>>> +			"snps,dis_enblslpm_quirk" must not be set.
>> sounds like you should rely on clk API here. Then on driver call
>> clk_get_rate() to computer whatever you need to compute.
>>
> There's nothing to compute here. We can simply enable this feature with
> "snps, enable-refclk-lpm" and the controller will use the default refclk
> settings.

Right, right. What I'm saying, though, is that we have a clock API for
describing a clock. So why wouldn't we rely on that API for this? I
think both of these new properties can be replaced with standard clock
API properties:

	clocks =3D <&clk1>, ..., <&lpm_clk>
        clock-names =3D "clock1", ...., "lpm";

Then dwc3 core could, simply, check if we have a clock named "lpm" and
if there is, use NSECS_PER_SEC / clk_get_rate() to get its period and
write it to the register that needs the information.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlviiBwACgkQzL64meEa
mQbJBg//QQxoI7NGbe3MVib+VYUb/JkyMOI2OnnNgwOgYMpcrbcQbYaNids8VTY6
ytODWNe2NvRPsS5rYcrKptogCA8/j5XJAxXshbGtmDlFY8QrYtecPU5GWxOlvMCe
yH70mvGyinjhrwVDVxjL6hph4aYLiFDn3eK5eNq+pvTASXf74XVLEAchTmZ9+O2L
qiyZKCOAXfT6/hIU4cuuShGKmqwELQ575+uZIrQdLn2ru54a/PowGvBcv5cJWDef
gm5+QashdsbU40pifHRfWqNDrdqWg503MG5TNhf8ZMLUc9/T1KRlD3OUqR2pDgU5
M1qmu8vbIM4r3Yz9QHzrNvm5x1bPHmheod02824Ysk467/ydjv0AvfG6x8dMmZnL
YcWzY1T7EYukhdLXGaweCZ51J1xkrS4NE7M4zjwWoSwYXgKSt28wLqqSjSwYdW2X
9R0JeyOVl6Y8OA2lcI3CzcqNRhjFpeYI6FN+D0JxWDLXlUiF/iYEMj3z5rvhWAfi
yzub6NQKfNlkR/bP+0Bc1eeUupoq/d2sAk8mbjXDwJ1M3npB92VldRC7cHafaR1h
Gj21wpOXhrl8bpMO07318sKR+UAfH4B7Fw4r3OJ4FMfVN20plZmYO3nJUIsCD/xQ
wHoHVRfy4ts1kE9VRdgGW2/T2pf3VkepQhB4fJAeas/eVs3yFcw=
=e6B1
-----END PGP SIGNATURE-----
--=-=-=--
