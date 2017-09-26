From: Philip Balister <philip@balister.org>
Subject: Re: [PATCH 1/2] arm: dts: Add support for National Instruments
 Project Sulfur SDRs
Date: Tue, 26 Sep 2017 13:58:38 -0400
Message-ID: <dfb517fe-8584-2a1a-22e5-946980cc9644@balister.org>
References: <20170911232223.91894-1-mdf@kernel.org>
 <314acb1f-1f0f-7893-70a8-9379c01112ac@xilinx.com>
 <20170925161136.GA12943@tyrael.ni.corp.natinst.com>
 <6b87e902-3201-6710-4921-d465dea19dcd@xilinx.com>
 <20170926175018.GA14962@tyrael.ni.corp.natinst.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0933380270727756856=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170926175018.GA14962@tyrael.ni.corp.natinst.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Moritz Fischer <mdf@kernel.org>, Michal Simek <michal.simek@xilinx.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, gregkh@linuxfoundation.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0933380270727756856==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Bw7mMvsxrb3vrfh9hljOsKnFnKmOg0b1T"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Bw7mMvsxrb3vrfh9hljOsKnFnKmOg0b1T
Content-Type: multipart/mixed; boundary="GF3UFMjlegPF0TkxsG4m8OvPV2Xd4btJ7";
 protected-headers="v1"
From: Philip Balister <philip@balister.org>
To: Moritz Fischer <mdf@kernel.org>, Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
 gregkh@linuxfoundation.org, davem@davemloft.net,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Message-ID: <dfb517fe-8584-2a1a-22e5-946980cc9644@balister.org>
Subject: Re: [PATCH 1/2] arm: dts: Add support for National Instruments
 Project Sulfur SDRs
References: <20170911232223.91894-1-mdf@kernel.org>
 <314acb1f-1f0f-7893-70a8-9379c01112ac@xilinx.com>
 <20170925161136.GA12943@tyrael.ni.corp.natinst.com>
 <6b87e902-3201-6710-4921-d465dea19dcd@xilinx.com>
 <20170926175018.GA14962@tyrael.ni.corp.natinst.com>
In-Reply-To: <20170926175018.GA14962@tyrael.ni.corp.natinst.com>

--GF3UFMjlegPF0TkxsG4m8OvPV2Xd4btJ7
Content-Type: text/plain; charset=windows-1252
Content-Language: en-MW
Content-Transfer-Encoding: quoted-printable

On 09/26/2017 01:50 PM, Moritz Fischer wrote:
> Michal,
>=20
> On Tue, Sep 26, 2017 at 02:54:48PM +0200, Michal Simek wrote:
>> Hi,
>>
>> On 25.9.2017 18:11, Moritz Fischer wrote:
>>> Hi Michal,
>>>
>>> On Mon, Sep 25, 2017 at 10:19:44AM +0200, Michal Simek wrote:
>>>> Hi Moritz
>>>>
>>>> sorry for delay.
>>>
>>> No problem.
>>>
>>>>
>>>> On 12.9.2017 01:22, Moritz Fischer wrote:
>>>>> Add support for the National Instruments Project Sulfur SDR
>>>>> motherboards Rev 2,3 and 4.
>>>>>
>>>>> Signed-off-by: Moritz Fischer <mdf@kernel.org>
>>>>> ---
>>>>>  arch/arm/boot/dts/Makefile                |   3 +
>>>>>  arch/arm/boot/dts/zynq-ni-sulfur-rev2.dts |  84 ++++++++++++++++++=
+
>>>>>  arch/arm/boot/dts/zynq-ni-sulfur-rev3.dts | 118 ++++++++++++++++++=
++++++++
>>>>>  arch/arm/boot/dts/zynq-ni-sulfur-rev4.dts |  26 ++++++
>>>>>  arch/arm/boot/dts/zynq-ni-sulfur.dtsi     | 133 ++++++++++++++++++=
++++++++++++
>>>>>  5 files changed, 364 insertions(+)
>>>>>  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur-rev2.dts
>>>>>  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur-rev3.dts
>>>>>  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur-rev4.dts
>>>>>  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur.dtsi
>>>>
>>>> Is this publicly available board?
>>>
>>> Will be in Q1 2018 was announced at GRCon'17 ([1]).
>>> Some of the Rev3s are currently deployed in Norway as part of a radar=

>>> system.
>>>
>>>> I am not quite sure we should apply these dts files. There are a lot=
 of
>>>> boards with zynq and there must be any strong argument for applying =
this
>>>> to the tree. For arm32 with even flat tree structure.
>>>
>>> What's the issue with merging them, except for having 3 more files?=20
>>
>> For me this is not a problem because on Linux side it is not increasin=
g
>> build time.
>> I want to see the value for community. All xilinx platforms are
>> evaluation generic purpose boards which are showing how to connect stu=
ff
>> together.
>> On the other hand this is real product.
>=20
> Uh.
>=20
>> I would let arm-soc maintainer to decide if this is fine or not. I
>> definitely don't want to end up in situation that we will have dts for=

>> real products which are not bringing any value for others.
>=20
> Sure, it's the maintainers call.
>=20
> I do intend to have my customers run mainline on it eventually, current=
ly
> I'm a handful of patches away from making that happen. So yes, running
> mainline is a usecase that matters to me.
>=20
> It is one thing to keep bitching about vendor kernels as a community
> continuously, but then if someone goes through the effort and actually
> tries to run mainline, you give them crap like that above.
>=20
> Our products usually come with full schematics [1], firmware, fpga code=
 and all
> available, I don't know what makes them less useful to the community as=
 a
> platform to experiment and develop on than Xilinx eval boards.
>=20
> There's several people that I know of both hobbyists and companies that=

> build systems around these platforms, so I don't know ...

I expect this product to be delivered with full source and a mainline
kernel, so lets make it easy for Moritz to do the right thing here. This
makes long term support of this product much easier.

Acked-by: Philip Balister <philip@opensdr.com>

Philip

>=20
> - Moritz
>=20
> [1] http://files.ettus.com/schematics/
>=20


--GF3UFMjlegPF0TkxsG4m8OvPV2Xd4btJ7--

--Bw7mMvsxrb3vrfh9hljOsKnFnKmOg0b1T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEBTQvNQJFZ+nvGDylwMl3iuvSZ6sFAlnKlVEUHHBoaWxpcEBi
YWxpc3Rlci5vcmcACgkQwMl3iuvSZ6tJhAgAvgl1meXF6GlZRSlKdxV79BdTFUPD
YbNXQFLJJp/oa4MU21eUS7BVs/4t3CnrLh6NtwCI0skJwvT96maPWEX+Fc9ffIMG
BQFNA0TdMBto4lsFSCxWAj9eWjA1V8eB01pyq1riICqZPA7Dmp9fz1TQ3WM24vgZ
d6PYoGToLsMsgW+OWK0nJWrP/ZmxOex6spO4GB8Qw2I2UHVZok1ULkX6l5F3NtaE
a6RtZRN6ubVgIhHkJRpeunuwcBKy3af+5lvESEpKzPpLeteJ6hX35OiiDpgFj1k3
2d+wFlNeSy7U43/3BYq2mCIFTW6tog4gRZTekkn63PSzcdIRS7BCgWPMNw==
=Bzdk
-----END PGP SIGNATURE-----

--Bw7mMvsxrb3vrfh9hljOsKnFnKmOg0b1T--


--===============0933380270727756856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0933380270727756856==--
