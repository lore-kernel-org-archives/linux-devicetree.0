From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v2 1/4] ARM: bcm2835: sync firmware properties with downstream
Date: Thu, 18 Jan 2018 12:50:55 -0800
Message-ID: <87vafy7uxc.fsf@anholt.net>
References: <cover.1515698418.git.baruch@tkos.co.il> <e68675d54955c754ebe8ffc2491585fde5b396bc.1515698418.git.baruch@tkos.co.il> <1991337128.42939.1515837465503@email.1und1.de> <CACRpkdZ_g3-jR-7pOnS9MwpHprfEz8acB9SWcMLyoOVcB0iLvA@mail.gmail.com> <20180116104904.fsebsozoa4xysbz7@tarshish> <632b9d56-78cf-1e8e-8cd2-30edd2de70c0@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <632b9d56-78cf-1e8e-8cd2-30edd2de70c0@i2se.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>, Baruch Siach <baruch@tkos.co.il>, Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-gpio@vger.kernel.org, Michael Zoran <mzoran@crowfest.net>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, Dave Stevenson <dave.stevenson@raspberrypi.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <stefan.wahren@i2se.com> writes:

> Hi Baruch,
>
> Am 16.01.2018 um 11:49 schrieb Baruch Siach:
>> Hi Linus,
>>
>> On Tue, Jan 16, 2018 at 10:57:32AM +0100, Linus Walleij wrote:
>>> On Sat, Jan 13, 2018 at 10:57 AM, Stefan Wahren <stefan.wahren@i2se.com=
> wrote:
>>>>> Baruch Siach <baruch@tkos.co.il> hat am 11. Januar 2018 um 20:44 gesc=
hrieben:
>>>>>
>>>>> Add latest firmware property tags from the latest Raspberry Pi downst=
ream
>>>>> kernel. This is needed for the GPIO tags, so we can control the GPIO
>>>>> multiplexor lines.
>>>>>
>>>>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>>>> Acked-by: Stefan Wahren <stefan.wahren@i2se.com>
>>>>
>>>> Maybe this is obvious, but patch #3 depends on this change so no cherr=
y-picking allowed.
>>> I will save this for after the merge window as it feels now.
>>>
>>> But as far as I have the right ACKs I can put it in the GPIO tree.
>>>
>>> Baruch: can you resend the series with all ACKs and push me
>>> to apply it all in the GPIO tree if you're fine with this approach?
>> I plan to send another revision of this series later today to address St=
efan's
>> comments on this one. Once Stefan and/or Eric ack the entire series, I'm=
 fine
>> with you taking it through the GPIO tree if it is OK with the BCM2835
>> maintainers.
>>
>> baruch
>>
>
> we also need an ACK from the devicetree maintainers. So please send a=20
> copy of the binding patch V3 to Rob Herring and Marc Rutland.

I'll be happy to see patch 1-3 go through the GPIO tree, and we'd take
#4 in the 2835 tree.  The only risk I see is if we need patch 1 for some
other change in this cycle -- seems unlikely, but if Linus applied the
series starting from a rc1 tag and merged it in, then we'll also be able
to merge that patch over to any other branch we need without duplicating
it in git history.

Once you get this resent with the DT folks Cced, hopefully it'll be
pretty quick.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlphCK8ACgkQtdYpNtH8
nujiIQ/+MkwB2hhq6MgcF3fVDYX5DkmVUuCrKnsfc0bB0FQDwbhQqpVmnyscf/NT
P/qbosACB+UIRrsgIqAnD0rWXmo7mv3TDOnYfYNxZUbd8XGjIDQe3yYBY2T5txxw
rRE5Q6PMkgAfkZsucLYrH82GBuhTEAs40oZoSoxiniAGxNOUZd682nixZFvTadrE
VwjpwHdxp2Wdhsna0cdEZZ0M++GBEwSHpgu/DIBM8PPfuETCx2+JifwNA8Xddhi8
36mdgagqqKm9uvaqNBXIDbh4OZn0+y/xRrdKjRqynWeCHDpWPQIRR/MdhRhZRNUF
TsdnM0Y2Q2GPpPqPbg9MTsqXqz5q6boLdIo+zhArB9FDGPnBjRVxdb+83whlw9Cq
QR9wAJIgXUxPsTp56acXik7A7N3kai2sz0WvDDuMZNG7x82Hew2y8NcRKXP3/KXO
Rp2rROBxNvTwKj2LeRy3boeaXSIUsXL9FhYnFS+P+TDMOhzxb2E2q7yxc22g2fga
dgH/7IbyvzgWWYoeYLOAIjt6WlRTkcHi1Syi+6xvwRzZRzcvmuUs8iQZryMtOyrz
AEnG3NlEbMb45DtqUqdVlfie6MyD6OQ1cbDzxIJOWjt+oer3TgkNgSYAqIKDiVXO
D8CFDTXKgNckbBth2F1YPvqwe1jkWpzkPBwhFejNUYtJ72oeagY=
=PVvU
-----END PGP SIGNATURE-----
--=-=-=--
