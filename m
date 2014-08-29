From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 3/3] ARM: zynq: DT: Add Ethernet phys
Date: Fri, 29 Aug 2014 16:08:20 +0200
Message-ID: <660fe929-1f16-4e22-8bd3-0388cd363978@BY2FFO11FD038.protection.gbl>
References: <1408550219-19825-1-git-send-email-soren.brinkmann@xilinx.com>
 <1408550219-19825-3-git-send-email-soren.brinkmann@xilinx.com>
 <5a7b6f57-b6c0-4fb3-af0d-d403277c0207@BN1AFFO11FD045.protection.gbl>
 <53F5D8D9.7040604@suse.de>
 <f166a186-301c-4288-97cf-71f8173c07e7@BN1AFFO11FD010.protection.gbl>
 <CAGVrzcYWN83tznwvw1M9V_mwWgobs2kwtRvEj4stqE=XGC10fg@mail.gmail.com>
 <20140825174610.GA13737@obsidianresearch.com> <53FB9AC4.8010704@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1153701453166835591=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <53FB9AC4.8010704@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Michal Simek <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kumar Gala <galak@codeaurora.org>, =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

--===============1153701453166835591==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="xLnAcoo3VaKN49h7d53tfL1kjlAHttQxp"

--xLnAcoo3VaKN49h7d53tfL1kjlAHttQxp
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 08/25/2014 10:21 PM, Florian Fainelli wrote:
> On 08/25/2014 10:46 AM, Jason Gunthorpe wrote:
>> On Fri, Aug 22, 2014 at 01:47:09PM -0700, Florian Fainelli wrote:
>>
>>>>  - the ID based strings seem to be not needed since, IIUC, the core
>>>>    reads the ID from the PHY and uses it, so I just left it out not
>>>>    trying to figure out how to obtain the correct ID
>>>
>>> It is not needed, but it is one way to specify a PHY device if you do=

>>> not know what compatible string to use instead.
>>
>> No, it is a way to specify a PHY device if the kernel can't auto probe=

>> the Phy ID.
>>
>> Last I checked, the kernel doesn't support plain text compatible
>> strings for phys - everything is driven on the phy id, either auto
>> probed or specified in the DT.
>=20
> That's right. Some PHY drivers might be relying on specific compatible
> strings though, but not the core PHY library that probes and maps a
> driver to a PHY node.
>=20
>>
>>>>  - the marvell compatible strings are used in our vendor tree. They
>>>>    aren't used anywhere but in our vendor tree. I though keeping the=
m is
>>>>    nice since it identifies the PHY fully. And in case that level of=

>>>>    detail is needed at some point it is already there.
>>>
>>> And this is the recommended way to do it in case we ever need to key =
a
>>> software decision based on the hardware.
>>
>> All compatible strings need to be documented.
>>
>> .. and they need to encode more information than you get from the phy
>> id - die revsision, package option, functional options, voltage
>> codes. Etc.
>>
>> .. and they actually need to be *right*
>=20
> Agreed.
>=20
>>
>> An example: The kernel reports 88E1318S for all four chips in that
>> family, AFAIK you have to read the package marking to figure out which=

>> you have (it is the same die, with options switched on/off at
>> packaging time). People have already posted patches trying to
>> helpfully add a 'marvell,88E1318S' compatible string based on kernel
>> output. Except it is wrong, it isn't actually the '8S version in the
>> HW.
>>
>> Even worse, Marvell has a whole series of socket compatible phys. Just=

>> because the board the DT author looked at has a '318, doesn't mean
>> that every board ever made will. We've actually already been switching=

>> between the 318 and 318S for production depending on which has part
>> availability.
>>
>> Basically: don't try to override self-discoverable hardware in DT
>> without a really good reason.
>=20
> I think that's a very good point, at the very least let's use a
> compatible string that contains the full 32-bits PHY OUI.

I think resolution is:
1. Do not use marvell,88e1518 because it is not listed anywhere
2. Do not add ethernet-phy-idAAAA.BBBB because it breaks autodetection
if there is different phy on the board and we shouldn't restrict us in th=
is.
In spite of autodetection takes some time.
3. "ethernet-phy-ieee802.3-c22" is optional that's why doesn't need to be=
 added
4. Any listed compatible string has to be parsed which takes time

That's why I think make sense not to use any compatible string.
This should give us all flexibility which we want to have.

Thanks,
Michal



--xLnAcoo3VaKN49h7d53tfL1kjlAHttQxp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlQAiVQACgkQykllyylKDCGxBgCcDzjvNhuw8WDR5+4w8+xvG4Ia
uM4An2yveCgBvqR23TtepTWQXQh520xj
=rFdc
-----END PGP SIGNATURE-----

--xLnAcoo3VaKN49h7d53tfL1kjlAHttQxp--


--===============1153701453166835591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1153701453166835591==--
