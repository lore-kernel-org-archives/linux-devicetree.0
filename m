Return-Path: <SRS0=vR3B=O5=linux.intel.com=felipe.balbi@kernel.org>
From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v2 1/4] usb: dwc3: Add property snps,refclk-period-ns
In-Reply-To: <30102591E157244384E984126FC3CB4F639AB64F@us01wembx1.internal.synopsys.com>
References: <cover.1544235317.git.thinhn@synopsys.com> <83adc98adc1760a0fad87d81d171e1dac783e7e5.1544235317.git.thinhn@synopsys.com> <20181218163858.GA12336@bogus> <30102591E157244384E984126FC3CB4F639AB1BC@us01wembx1.internal.synopsys.com> <CAL_JsqKiRHwRYXqJmADpRXp8zpqrPTPtgbmG8aB-2=_SW358Fw@mail.gmail.com> <30102591E157244384E984126FC3CB4F639AB64F@us01wembx1.internal.synopsys.com>
Date: Thu, 20 Dec 2018 08:48:09 +0200
Message-ID: <87va3ou21i.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
To: Thinh Nguyen <thinh.nguyen@synopsys.com>, Rob Herring <robh@kernel.org>Thinh Nguyen <thinh.nguyen@synopsys.com>
Cc: Linux USB List <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Thinh Nguyen <thinh.nguyen@synopsys.com> writes:
>>> On 12/18/2018 8:39 AM, Rob Herring wrote:
>>>> On Fri, Dec 07, 2018 at 06:27:30PM -0800, Thinh Nguyen wrote:
>>>>> This patch introduces property "snps,refclk-period-ns" to inform the
>>>>> controller of the reference clock period. If the reference clock peri=
od
>>>>> is different from the default Core Consultant setting, then this
>>>>> property can be set to the reference clock period.
>>>>>
>>>>> This property does not control the reference clock rate. The controll=
er
>>>>> uses this value to perform internal timing calculations that are based
>>>>> on the reference clock.
>>>>>
>>>>> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
>>>>> ---
>>>>> Changes in v2:
>>>>> - Split from "usb: dwc3: Add reference clock properties"
>>>>> - Revise commit message and property description
>>>>>
>>>>>  Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
>>>>>  1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documen=
tation/devicetree/bindings/usb/dwc3.txt
>>>>> index 8e5265e9f658..b7e67edff9b2 100644
>>>>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>>>>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>>>>> @@ -99,6 +99,8 @@ Optional properties:
>>>>>                      this and tx-thr-num-pkt-prd to a valid, non-zero=
 value
>>>>>                      1-16 (DWC_usb31 programming guide section 1.2.3)=
 to
>>>>>                      enable periodic ESS TX threshold.
>>>>> + - snps,refclk-period-ns: if set, this value informs the controller =
of the
>>>>> +                    reference clock period in nanoseconds.
>>>> Shouldn't you be able to retrieve the refclk frequency and then
>>>> calculate the period?
>>> The thing is we cannot determine the ref_clk frequency for some devices
>>> that don't specify their clocks. So I think we should have an option to
>>> inform the controller of the ref_clk period for those devices.
>> Specifying the clock should be mandatory (if you want/need this
>> feature). It just requires a fixed-clock node at a minimum.
>
> Depending on the design of the controller, the ref_clk frequency is not
> something that the OS can read/control. So we cannot make it mandatory
> for every device to have a clock node.

We can make it mandatory to everyone who wants to use the feature. It's
no different than making snps,refclk-period-ns mandatory to everyone who
wants to use the feature you're introducing.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlwbOykACgkQzL64meEa
mQZ5WBAA3Sr5UbFbyuR9SK4zso2Tae4ixAEaMxx2ne9N79rEF33J79zB4fIgku9U
QZ0daLGfWcLGMvVIuj1lPZGSJsyGtmymQyp6bgRT9laT1VfNoswrDmPdxexgAg4V
VlcLBB2mdvYC/lzMfn2ntwV3qsF7PrSkRuBJyEQnKL58pIug3afzMjSUnuhoFbrL
SHjfmNddlZZa7bCZx8VhZi7gcE/wLVpcCzYTSH/FICusuzKLp2ZfrY0FtEgX6Uvf
5ljxUol23JH89BFgnN6FlcI2ynvjU63ZrVkXGDUkDGXxf2wj6caC+nXT1tsHpybY
agq/c/f8FX/NYJdIYU7FWhsrJr7ATGP1l96l2tiLGzzzVN0NeBAM6jPFxGhU7NL/
KwqomKdYN6dS3k/L9hz0UkXzgyhnAL9iXyDx4BCuOkM0LpOFXL9kNNMk2Sm9x1sz
LPiXggdsLDLAaLFr+7UbcFjnd1yDenzwDOzfVCi2CfYRYv1cIHgHJVDhDVnE8nhU
8uqgd85yN5V05PISyV+6urVlI+uHPqLp6lBM6dgaKmGMjTE5Iaa/zVcuNQiYTwdj
K/X+XTr9fZuiCrMnhEd/RaqfVhbC/1L6ETjH+CkRgTtmyrT7Lre2DA0eD4Nnx2j8
WZPpSFWT1rR40Qm2/v6Tv3OUs5RlLbRdI7miiFCMwBdPXNz8uNw=
=wvqT
-----END PGP SIGNATURE-----
--=-=-=--
