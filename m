From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2] dt-bindings: mtd: Add sst25vf016b to the list of
 supported chip names
Date: Mon, 20 Nov 2017 09:49:33 +0100
Message-ID: <CAMuHMdWZ=71XvVyzsiPyiAz+0RsCZjmWqqvOKs=bDdSQMpLmnA@mail.gmail.com>
References: <1505118928-3987-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1508853032-25229-1-git-send-email-fabrizio.castro@bp.renesas.com> <658ceb2b-5d2b-9349-f140-27858459e5a8@wedev4u.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <658ceb2b-5d2b-9349-f140-27858459e5a8-yU5RGvR974pGWvitb5QawA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>
Cc: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Cyrille,

On Fri, Nov 17, 2017 at 6:36 PM, Cyrille Pitchen
<cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org> wrote:
> sorry but I won't apply this patch.
>
> New values for the 'compatible' DT properties should only be added for
> memory parts not supporting the JEDEC READ ID (0x9F) command.

I tent to disagree. Documenting part numbers in the DT bindings serves two
purposes:
  1. Documenting which parts are supported,
  2. Allowing checkpatch to validate compatible values in DTS files (see
     below).

Unfortunately the current
Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
is useless for the latter, as the values listed don't contain the vendor
prefixes, still causing warnings like

WARNING: DT compatible string "sst,sst25vf016b" appears un-documented
-- check ./Documentation/devicetree/bindings/
#79: FILE: arch/arm/boot/dts/r8a7743-iwg20m.dtsi:79:
+ compatible =3D "sst,sst25vf016b", "jedec,spi-nor";

So I suggest prepending all part number with the appropriate vendor prefixe=
s
in jedec,spi-nor.txt.

BTW, "sst" (for Silicon Storage Technology) should be added to
Documentation/devicetree/bindings/vendor-prefixes.txt, too, to avoid anothe=
r
warning:

WARNING: DT compatible string vendor "sst" appears un-documented --
check ./Documentation/devicetree/bindings/vendor-prefixes.txt
#79: FILE: arch/arm/boot/dts/r8a7743-iwg20m.dtsi:79:
+ compatible =3D "sst,sst25vf016b", "jedec,spi-nor";

> SST25 memories do support this command hence should use the "jedec,spi-no=
r"
> value alone. For historical reasons, some DT nodes set their 'compatible'
> string to something like "<vendor>,<model>", "jedec,spi-nor".
> It should work as expected in most case however I discourage from doing s=
o
> in new device trees because it may have some side effects especially when
> the m25p80.c driver is used between the spi-nor.c driver and the SPI
> controller driver.

It is considered good practice to always have in DT a compatible value for
the real part number, not just for a generic fallback.
This allows to discriminate using the real part number, in case an anomaly
shows up later.
How else are you gonna handle e.g. a production batch that accidentally
contains a wrong JEDEC ID? And adding the part-specific compatible value
after the discovery won't help, as it won't be present in existing DTSes.

> It's all about setting the 2nd parameter of spi_nor_scan(), the 'name'
> parameter, as NULL when possible. This parameter should be set to a non N=
ULL
> value only for memories not supporting the JEDEC READ ID op code (0x9F).
>
> Best regards,
>
> Cyrille
>
> Le 24/10/2017 =C3=A0 15:50, Fabrizio Castro a =C3=A9crit :
>> There are a few DT files that make use of sst25vf016b in their
>> compatible strings, and the driver supports this chip already.
>> This patch improves the documentation and therefore the result
>> of ./scripts/checkpatch.pl.
>>
>> Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
>> Signed-off-by: Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Acked-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>> ---
>> Thank you Rob, thank you Geert, and sorry for the delay on this one.
>> Here is v2.
>>
>> Changes in v2:
>> * fixed subject prefix
>> * added changelog
>>
>>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/D=
ocumentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>> index 4cab5d8..bf56d77 100644
>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>> @@ -31,6 +31,7 @@ Required properties:
>>                   s25sl12801
>>                   s25fl008k
>>                   s25fl064k
>> +                 sst25vf016b
>>                   sst25vf040b
>>                   sst25wf040b
>>                   m25p40

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
