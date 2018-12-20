Return-Path: <SRS0=vR3B=O5=linux.intel.com=felipe.balbi@kernel.org>
From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v2 3/4] usb: dwc3: Add property snps,enable-refclk-sof
In-Reply-To: <20181218164128.GA14552@bogus>
References: <cover.1544235317.git.thinhn@synopsys.com> <a156d9779fe56ea7b5cc628c90b52d0162b5ae68.1544235317.git.thinhn@synopsys.com> <20181218164128.GA14552@bogus>
Date: Thu, 20 Dec 2018 08:52:27 +0200
Message-ID: <87sgysu1uc.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
To: Rob Herring <robh@kernel.org>, Thinh Nguyen <thinh.nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Rob Herring <robh@kernel.org> writes:
> On Fri, Dec 07, 2018 at 06:27:43PM -0800, Thinh Nguyen wrote:
>> This patch adds a property to enable the controller to track the
>> frame number based on the reference clock.
>>=20
>> When operating in USB 2.0 mode, the peripheral controller uses the USB2
>> PHY clocks to track the frame number. This prevents the controller from
>> suspending the USB2 PHY when the device goes into low power. Version
>> 1.80a of the DWC_usb31 peripheral controller introduces a way to track
>> frame number based on the reference clock instead. This feature allows
>> the controller to suspend the USB2 PHY when the device goes into low
>> power. This improves power saving for devices that have isochronous
>> endpoints.
>>=20
>> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
>> ---
>> Changes in v2:
>> - Revise property description
>> - Rename property from snps,enable-refclk-lpm to snps,enable-refclk-sof
>>=20
>>  Documentation/devicetree/bindings/usb/dwc3.txt | 3 +++
>>  1 file changed, 3 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentat=
ion/devicetree/bindings/usb/dwc3.txt
>> index b7e67edff9b2..01b948fff0eb 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>> @@ -101,6 +101,9 @@ Optional properties:
>>  			enable periodic ESS TX threshold.
>>   - snps,refclk-period-ns: if set, this value informs the controller of =
the
>>  			reference clock period in nanoseconds.
>> + - snps,enable-refclk-sof: set to enable reference clock based frame nu=
mber
>> +			tracking while in low power, allowing the controller to
>> +			suspend the PHY during low power states.
>
> This should be implied by the compatible string.

Two problems with this:

1) Won't work for PCI-based systems

2) If we start having many users of this we will end up with:

	if (of_device_is_compatible("a") ||
        	of_device_is_compatible("b") ||
        	of_device_is_compatible("c") ||
                of_device_is_compatible("d") ||
                ...)
		foo();

Conversely, if we just pass a flag, this branch will never change. We
won't need changes to the kernel because a new platform needing refclk
based frame number tracking is, now, supported upstream.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlwbPCsACgkQzL64meEa
mQbbMg/9ESq/ApzpRKV/Hg/DzIbkvhF3UuCi0bt2SHxg57nO3Ti+gXWlHCENruCp
0nUmwsMJYavU49x9m+aIKq+SHZ/rq09JA8f+nnZI/ZNc7eI7bzOgtnTwnSMlLXa8
FPCINMD77HE2JFF0+R27fBRsNctcDbe079GLtQYNGBsaGJgN/IsnqIp1PORvuMMm
8f8dPsvjvShxow/4PfHSb+QmM99g70igAw5pOb6EBm2xoiQJSe/XYgONRHf054Av
ockO3G5HtfXMIWcSslwsneCuvM/iEUS9Zag18RyL/sXjpYEzThjswFJEv1o3Qc4/
GCOGFrk7fKX1h1eXpAjtnX8La29jl2N0VeDW7Q4pBkDRp1i9QsxxnskNOC8kkIJL
XkDQH7SIwXaZep45SPHFbvfiKPTbtrV11Jmgh+2YX09HJb0Ii+38c7LvaF1z1K6Y
2FtoR0u/4EhUr1Vt5hxar7VBos1w6NIY4r0uHNnxBsoQyB13arcHNzr/6kdvd0Bo
QWHD1Z9WZZssco84t7g+oMnPL3JylqudgX6Kqgw4FYcJNgaqrOhBseEAbm/vw3qe
mbEZrW9Hl7FGMGHLqgUeIZ7IIGxQlpdBh0Gz+RR3QnUO4yqvNT1ynaxSxzYtDJNL
zVjdfkOBeZP17JVEZdZPfEsCKP94bsNUgiaB50aYNoiV9XGM5h0=
=gCRy
-----END PGP SIGNATURE-----
--=-=-=--
