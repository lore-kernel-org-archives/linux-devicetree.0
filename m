From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v2 07/11] Documentation: devicetree: Fix Xilinx VDMA specification
Date: Fri, 25 Jul 2014 11:40:02 +0200
Message-ID: <435f86ce-9588-48c7-b01a-5dd97ea64b13@BL2FFO11FD021.protection.gbl>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de>
 <1406242820-20140-8-git-send-email-afaerber@suse.de>
 <53D20C19.5000306@monstr.eu> <53D21983.8060901@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="crfIIdUJAMkCKXOuqAXsVFWHuMsk0AgKa"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53D21983.8060901@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, monstr@monstr.eu, Srikanth T <sthokal@xilinx.com>
Cc: Vinod Koul <vinod.koul@intel.com>, Michal Simek <michal.simek@xilinx.com>, Andreas Olofsson <andreas@adapteva.com>, Matteo Vit <matteo.vit@starwaredesign.com>, Sean Rickerd <srickerd@suse.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

--crfIIdUJAMkCKXOuqAXsVFWHuMsk0AgKa
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On 07/25/2014 10:46 AM, Andreas F=C3=A4rber wrote:
> Hi Michal,
>=20
> Am 25.07.2014 09:49, schrieb Michal Simek:
>> On 07/25/2014 01:00 AM, Andreas F=C3=A4rber wrote:
>>> The specification requires xlnx,data-width, but example and driver us=
e
>>> xlnx,datawidth. Change the specification to match the implementation.=

>>>
>>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>> ---
>>>  v2: New
>>> =20
>>>  Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma=
=2Etxt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
>>> index 1405ed0..e4c4d47 100644
>>> --- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
>>> +++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
>>> @@ -25,7 +25,7 @@ Required child node properties:
>>>  - compatible: It should be either "xlnx,axi-vdma-mm2s-channel" or
>>>  	"xlnx,axi-vdma-s2mm-channel".
>>>  - interrupts: Should contain per channel VDMA interrupts.
>>> -- xlnx,data-width: Should contain the stream data width, take values=

>>> +- xlnx,datawidth: Should contain the stream data width, take values
>>>  	{32,64...1024}.
>=20
> BTW I just notice that this values specification is ambiguous as to
> whether 96 is a valid value or only powers of 2 like 128. Maybe you wan=
t
> to clarify that in a follow-up patch?

really appreciate your help for improving this.
Srikanth T: Can you please look at it?

Thanks,
Michal




--crfIIdUJAMkCKXOuqAXsVFWHuMsk0AgKa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlPSJfIACgkQykllyylKDCEYNgCaAvAKKSYq0TbbxLfazbxuSlSC
iuQAn0jWNOa+wTu1Hi4lkzG6GfghYsEo
=qjv8
-----END PGP SIGNATURE-----

--crfIIdUJAMkCKXOuqAXsVFWHuMsk0AgKa--
