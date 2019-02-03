From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 0/9] Ingenic JZ4780 NAND patchset v2
Date: Sun, 03 Feb 2019 10:01:36 -0300
Message-ID: <1549198896.1950.0@crapouillou.net>
References: <20190202231926.2444-1-paul@crapouillou.net>
        <20190203082032.6e37c523@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190203082032.6e37c523@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, Mathieu Malaterre <malat@debian.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

Le dim. 3 f=E9vr. 2019 =E0 4:20, Boris Brezillon <bbrezillon@kernel.org>=20
a =E9crit :
> On Sat,  2 Feb 2019 20:19:17 -0300
> Paul Cercueil <paul@crapouillou.net> wrote:
>=20
>>  Hi,
>>=20
>>  As requested by Boris, I added a patch to move all the Ingenic NAND
>>  drivers to their own directory.
>>=20
>>  In this V2 I added support for the JZ4740 SoC. The combo of the
>>  jz4780-nemc, jz4780-nand and jz4740-bch now obsolete the old and=20
>> dusty
>>  jz4740-nand driver.
>=20
> Any plan to get the old driver removed? I guess you want to migrate=20
> the
> boards to DT first.

Yes, that's the plan - migrate the qi_lb60 board first then drop the old
driver.

>>=20
>>  To support the only upstream JZ4740-based board we have, the Ben
>>  Nanonote, I added an option to specify the OOB layout of that device
>>  from a device property string.
>>=20
>>  Finally, I dropped the last two patches that moved the platform NAND
>>  code to devicetree; I will upstream them as part of a different
>>  patchset.
>>=20
>>  Cheers,
>>  -Paul
>>=20
>=20
=
