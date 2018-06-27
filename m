Return-Path: <SRS0=bntt=JN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:28311 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932280AbeF0JaK (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 27 Jun 2018 05:30:10 -0400
From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH v2] arm64: dts: msm8996: Use dwc3-qcom glue driver for USB
In-Reply-To: <CADb+VZKtAspuvO64FVEBHUbcB0Nr57jWpBmpS5GfCE+QKD4CcA@mail.gmail.com>
References: <20180531104710.23965-1-mgautam@codeaurora.org> <d98cd884-f25d-ee2e-58cf-400993e0d213@codeaurora.org> <CADGp=Qc8EEHEHiUZA2W9x67Micy-af5xND6Mb-0f+387TvMGeQ@mail.gmail.com> <c13e4dae-aba3-727a-9242-a968af450794@codeaurora.org> <CADGp=QdjwY=9C26NtehXLk5V=k7f1fqorzQcx98Gtc4jK0hc+A@mail.gmail.com> <CADb+VZKtAspuvO64FVEBHUbcB0Nr57jWpBmpS5GfCE+QKD4CcA@mail.gmail.com>
Date: Wed, 27 Jun 2018 12:27:30 +0300
Message-ID: <87r2ksshod.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: devicetree-owner@vger.kernel.org
To: Pierre LE MAGOUROU <plemagourou@softbankrobotics.com>, Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Julien Massot <jmassot@softbankrobotics.com>, Manu Gautam <mgautam@codeaurora.org>, andy.gross@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, dianders@chromium.org, linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, bjorn.andersson@linaro.org
List-ID: <devicetree@vger.kernel.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

Pierre LE MAGOUROU <plemagourou@softbankrobotics.com> writes:
>> > I have a branch that's based on 4.17. You can pick that.
>> > https://github.com/vivekgautam1/linux/commits/v4.17/db820c
>> >
>>
>> Thanks a lot,
>> I will test this branch.
>>
>>
> I just tested USB gadget with this branch on the db820c.
>
> If I activate a USB composite gadget device with EEM function, I can see
> the 'usb0' Ethernet interfaces on the device and on the host and I can pi=
ng
> the db820c from the host.
> When I create a USB composite gadget device with UAC2 function, I can see
> the audio cards on host and device but cannot play or record any sound.
>
> While looking at dwc3 traces with Ftrace, I noticed that the dwc3 driver =
is
> stuck on wait_event_lock_irq() in dwc3_gadget_ep_dequeue() function when I
> use UAC2 gadget.

can you share tracepoint data?

> *This email and any attachment thereto are confidential and intended=20
> solely for the use of the individual or entity to whom they are addressed.
>
> If you are not the intended recipient, please be advised that disclosing,=
=20
> copying, distributing or taking any action in reliance on the contents of=
=20
> this email is strictly prohibited. In such case, please immediately advis=
e=20
> the sender, and delete all copies and attachment from your system.
> This=20
> email shall not be construed and is not tantamount to an offer, an=20
> acceptance of offer, or an agreement by SoftBank Robotics Europe on any=20
> discussion or contractual document whatsoever. No employee or agent is=20
> authorized to represent or bind SoftBank Robotics Europe to third parties=
=20
> by email, or act on behalf of SoftBank Robotics Europe by email, without=
=20
> express written confirmation by SoftBank Robotics Europe=E2=80=99 duly au=
thorized=20
> representatives.

you need to talk to your company's IT about removing this footer. This
makes the life of those maintaining mailing list archives rather
difficult.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlszWIIACgkQzL64meEa
mQYUXBAAzYdjszPQ1PP6pXpaC6kZKr35hrHO4oI7ytF4ZvaOEkYprUwsaEdk6iHY
HFauRjCitudESGqmpwRW3t4Pdi7I/VfukwI58HUDKPRAGVt82WJ+sCXyXuqsR6eD
AFEuch5ihdkgNP1g+4NkFbu6Mfb2XrarxuOF/1rtiQuQsPWIsk5dmQrLV/IoDB3M
M+blrTnxwuoXL6UczC1pglAq7gO27swp+wdUCvoYNJ2o27DoSBhrsCj4q3eP5eez
xM7pviHCaZSrOGeB0fQ3PpZGox/99hKqH9zv1zDUDoKrfsXzZLpWGEacS2kYkOGJ
fht08Km0OtBb81C9+48Vg3kSDA4rhXwgVtsJgQ4m4Ew/d5b1aQtqS2qeKXaAWDmh
hcAO7lk90s0JwijkPhtckGt8+YpE2TQfa97PQZOSZPSYh0KHrDSh4Agl+AibDhAj
DC2I/eGElFVrCMnwqE/F18J+M79TIOM3EGxgf6eed6g21wjpUWe03JrU/C1CmE9t
uYDZNCoDlCGQ16/DaqIwAMarTG7fR9W8ta35scElnY0Ah1L1EzRUYndTFys2i6ij
KEPczpKxpwOZa0Fy/P/rHn9xoUiTeX2l5TUEBWJMekSoAiDE8MlzQQJHa4lXZCn8
xP2caUasTRKQz80hLrNv92Jsuiye2Bxpclua4QqHZ1FGUyK/K6o=
=wIaA
-----END PGP SIGNATURE-----
--=-=-=--
