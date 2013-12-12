From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v2 1/9] arm: dt: zynq: Remove 'clock-ranges' from TTC
 nodes
Date: Thu, 12 Dec 2013 20:07:09 +0100
Message-ID: <52AA095D.4020707@monstr.eu>
References: <1385514296-26702-1-git-send-email-soren.brinkmann@xilinx.com> <1385514296-26702-2-git-send-email-soren.brinkmann@xilinx.com> <52A97979.1030205@monstr.eu> <552285d2-8d57-4509-a014-d97065232376@DB8EHSMHS004.ehs.local>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="so7JksuqHhjCfBKkHf34sCI51cxPQFvDD"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <552285d2-8d57-4509-a014-d97065232376@DB8EHSMHS004.ehs.local>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Michal Simek <michal.simek@xilinx.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--so7JksuqHhjCfBKkHf34sCI51cxPQFvDD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12/12/2013 06:01 PM, S=C3=B6ren Brinkmann wrote:
> Hi Michal,
>=20
> On Thu, Dec 12, 2013 at 09:53:13AM +0100, Michal Simek wrote:
>> On 11/27/2013 02:04 AM, Soren Brinkmann wrote:
>>> The bindings for the TTC changed in commit 'arm: zynq: Use standard
>>> timer binding' (e932900a3279b5dbb6d8f43c7b369003620e137c). That chang=
e
>>> removed possible subnodes from this driver rendering the 'clock-range=
s'
>>> property invalid for this node.
>>>
>>> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
>>> Acked-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>>> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>> ---
>>>  arch/arm/boot/dts/zynq-7000.dtsi | 2 --
>>>  1 file changed, 2 deletions(-)
>>
>> I think this is completely unrelated to cpufreq and should just go
>> directly via arm-soc tree.
>> If yes, I will add 1/9 and 2/9 to zynq/dt branch.
>=20
> I agree. This is just clean up that I found during this work. The secon=
d
> patch could go in as well I think. cpufreq will need the CPU nodes
> later, but I think there is no real reason to not add them now.

ok then. 1/9 and 2/9 applied to zynq/dt branch.

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--so7JksuqHhjCfBKkHf34sCI51cxPQFvDD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlKqCV0ACgkQykllyylKDCFghwCfXr0ypRzJemhq17qm27Qmk9Ig
Ai0An3hX4bFsRTYpuF4AreZcxVj1E2Sg
=NVbt
-----END PGP SIGNATURE-----

--so7JksuqHhjCfBKkHf34sCI51cxPQFvDD--
