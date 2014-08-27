From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 2/7] bcm47xx-nvram: add new broadcom nvram driver with dt support
Date: Wed, 27 Aug 2014 20:43:40 +0200
Message-ID: <CACna6ryXtFwJxBhEoJe+2mZWut24egtgXzzybxQ=rtPn9+X+2g@mail.gmail.com>
References: <1408915485-8078-1-git-send-email-hauke@hauke-m.de>
	<1408915485-8078-4-git-send-email-hauke@hauke-m.de>
	<CACna6rwJBDpg9VS4h5hfP4wtGRVwAdRUq5mELeA0OFWWzH9jsA@mail.gmail.com>
	<53FE217B.7000401@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53FE217B.7000401-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org" <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 27 August 2014 20:20, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 08/26/2014 10:54 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
>> Could we avoid that? Type of flash can easily be checked in the code=
=2E
>> All we need to do is to read BCMA_IOST register of BCMA_CORE_NS_ROM
>> core.
>
> So there is a boot status register you can read to tell what type of
> flash you booted from, but does that also give you the resource range=
s
> for these type of flashes? Presumably they will be mapped into differ=
ent
> addresses (at least bcm63xx is like that), that information needs to =
be
> listed somewhere.

Take a look at find_nvram in nvram_rw.c. It scans the whole region
which is up to 0x02000000 (SI_FLASH2_SZ) size.

In case of NAND limit is slightly different (nfl_boot_size function):
1) On ARM it's 0x800000 or 0x2600000
2) On MIPS it's 0x200000

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
