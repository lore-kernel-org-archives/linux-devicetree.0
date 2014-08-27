From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [RFC 2/7] bcm47xx-nvram: add new broadcom nvram driver with dt
 support
Date: Wed, 27 Aug 2014 11:20:43 -0700
Message-ID: <53FE217B.7000401@gmail.com>
References: <1408915485-8078-1-git-send-email-hauke@hauke-m.de> <1408915485-8078-4-git-send-email-hauke@hauke-m.de> <CACna6rwJBDpg9VS4h5hfP4wtGRVwAdRUq5mELeA0OFWWzH9jsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <CACna6rwJBDpg9VS4h5hfP4wtGRVwAdRUq5mELeA0OFWWzH9jsA@mail.gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>
Cc: devicetree@vger.kernel.org, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
List-Id: devicetree@vger.kernel.org

On 08/26/2014 10:54 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
> On 24 August 2014 23:24, Hauke Mehrtens <hauke@hauke-m.de> wrote:
>> +On NorthStar ARM SoCs the NAND flash is available at 0x1c000000 and=
 the
>> +NOR flash is at 0x1e000000
>> +
>> +Example:
>> +
>> +nvram0: nvram@0 {
>> +       compatible =3D "brcm,bcm47xx-nvram";
>> +       reg =3D <0x1c000000 0x01000000>;
>> +};
>=20
> Could we avoid that? Type of flash can easily be checked in the code.
> All we need to do is to read BCMA_IOST register of BCMA_CORE_NS_ROM
> core.

So there is a boot status register you can read to tell what type of
flash you booted from, but does that also give you the resource ranges
for these type of flashes? Presumably they will be mapped into differen=
t
addresses (at least bcm63xx is like that), that information needs to be
listed somewhere.
--
=46lorian
