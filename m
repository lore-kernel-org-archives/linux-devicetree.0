From: Felipe Balbi <balbi@kernel.org>
Subject: RE: [PATCH] usb: dwc3: core: Add quirk for enabling AutoRetry feature in the controller
Date: Thu, 26 Jul 2018 14:14:09 +0300
Message-ID: <877eli1c72.fsf@linux.intel.com>
References: <1532168920-3269-1-git-send-email-anurag.kumar.vulisha@xilinx.com> <20180725200325.GA21007@rob-hp-laptop> <MWHPR02MB2816DDEAE84716F88B08EB46A72B0@MWHPR02MB2816.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <MWHPR02MB2816DDEAE84716F88B08EB46A72B0@MWHPR02MB2816.namprd02.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anurag Kumar Vulisha <anuragku@xilinx.com>, Rob Herring <robh@kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "v.anuragkumar@gmail.com" <v.anuragkumar@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


hi,

Anurag Kumar Vulisha <anuragku@xilinx.com> writes:
> Hi Rob,
>
> Thanks for your comments, please see my comments inline
>
>>-----Original Message-----
>>From: Rob Herring [mailto:robh@kernel.org]
>>Sent: Thursday, July 26, 2018 1:33 AM
>>To: Anurag Kumar Vulisha <anuragku@xilinx.com>
>>Cc: gregkh@linuxfoundation.org; mark.rutland@arm.com; balbi@kernel.org;
>>v.anuragkumar@gmail.com; linux-usb@vger.kernel.org; devicetree@vger.kerne=
l.org;
>>linux-kernel@vger.kernel.org
>>Subject: Re: [PATCH] usb: dwc3: core: Add quirk for enabling AutoRetry fe=
ature in the
>>controller
>>
>>On Sat, Jul 21, 2018 at 03:58:40PM +0530, Anurag Kumar Vulisha wrote:
>>> By default when core sees any transaction error(CRC or overflow)
>>> it replies with terminating retry ACK (Retry=3D1 and Nump =3D=3D 0).
>>> Enabling this Auto Retry feature in controller, on seeing any
>>> transaction errors makes the core to send an non-terminating ACK
>>> transaction packet (that is, ACK TP with Retry=3D1 and Nump !=3D 0).
>>> Doing so will give controller a chance to recover from the error
>>> condition.
>>>
>>> Signed-off-by: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
>>> ---
>>>  Documentation/devicetree/bindings/usb/dwc3.txt |  5 +++++
>>>  drivers/usb/dwc3/core.c                        | 16 ++++++++++++++++
>>>  drivers/usb/dwc3/core.h                        |  6 ++++++
>>>  3 files changed, 27 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt
>>b/Documentation/devicetree/bindings/usb/dwc3.txt
>>> index 7f13ebe..2ba2bc2 100644
>>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>>> @@ -94,6 +94,11 @@ Optional properties:
>>>  			this and tx-thr-num-pkt-prd to a valid, non-zero value
>>>  			1-16 (DWC_usb31 programming guide section 1.2.3) to
>>>  			enable periodic ESS TX threshold.
>>> + - snps,enable_auto_retry: Set to enable Auto retry Feature to make the
>>
>>s/_/-/
> Sorry, I am not able to understand what needs to fixed here. Please help =
me in
> understanding, so that I can fix it in v2.

replace _ with -

>>> +			controller operating in Host mode on seeing transaction
>>> +			errors(CRC errors or internal overrun scenerios) on IN
>>> +			transfers to reply to the device with a non-terminating
>>> +			retry ACK (i.e, an ACK TP with Retry=3D1 & Nump !=3D 0)
>>
>>Seems like the property is unnecessary. When would you not want this
>>retry behavior? Why not just enable unconditionally in the driver?
>>
> There is no harm in adding this fix always but I think this Retry
> feature should be added depending on the user and type of the
> application. For example, applying this feature in a streaming
> application where isochronous transfers are used might end up in

read the docs. Auto Retry in only for non-isochronous IN endpoints. You
don't need any quirk for this. Just enable it unconditionally. Actually,
you wanna make sure the core can run in Host mode before setting this,
but that's it. No need for a quirk.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAltZrQEACgkQzL64meEa
mQZwtw/9HYBSUy/EQHw0y2JadXUWbjKRD4DwbHHteudftN7ytcGWlKbb9ymhKMSX
KhUk3NkEkXxlB13G4KCBKUaaowKkgWRDjZwK4viXGKiI6mp1gl5vI8vh6xtEtUHD
YdZv8kU0qJ78bRCKbcP8t0xdr9zjCN5YbzkIPolIYhjDDvVeWhm2bTY7IzcfDxwJ
Xtkc/Vox72M62Zk2fHiaRPRai/xDE5NDuzwFJYCIwKMX2PmhB7s+Hd7eNOJLtMga
x7DdITFdHoR9eRa4FlMpWpzVSK/oSmNIYAMX30moqiS5TQJ3pD1SE0hFbHYH7MKk
D7OqIS6ATrE2Jbt+aj58OupLp1rWOGAtMev47luzz4EEn2YNOGwkvch8yBaLGNL7
f4xQsigwZZdeBUW2waxMQwYNYsJykZFYPi/ndGE6+Kckrl6OMdNXhGM6AO/Sydkd
I398o1nAZIZMWTal7qq/KNOCR41Kr6X+zyBCKBy7vywQ9PY6zhu2ds5jc1pLGXOz
TkZ1dRpolI0lGVfET1Kp+5SLDzR/2v06VaUVdmRdx2YNMmsQsH/RsCVbgIbPLpFx
wMqbZgX5kVT15QmsEm6KpDkTqlCCj3D3kClCfJG5XJakTNUMbyyIPtglEpi59pO2
uekMGftXUMZ/CLblBTOsVt3IR41e5vEFOtNykyo7Puos/ywUMm0=
=T4BK
-----END PGP SIGNATURE-----
--=-=-=--
