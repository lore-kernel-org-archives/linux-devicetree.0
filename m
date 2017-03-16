From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 1/3] devicetree: add vendor prefix for Khadas
Date: Thu, 16 Mar 2017 22:14:46 +0100
Message-ID: <CAFBinCAp4G4-Ch7Vunn4mEi-6iWi7UfhA3Uryy9FAhFvwBuyPg@mail.gmail.com>
References: <20170304215126.7020-1-martin.blumenstingl@googlemail.com>
 <20170304215126.7020-2-martin.blumenstingl@googlemail.com>
 <20170315195737.vckgpw6qad4d4zjm@rob-hp-laptop> <61778a7a-3d96-8de3-fd4f-f18aa0938a68@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <61778a7a-3d96-8de3-fd4f-f18aa0938a68-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, gouwa-GEqbEQZgqepWk0Htik3J/w@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 16, 2017 at 7:00 AM, Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org> wro=
te:
> Am 15.03.2017 um 20:57 schrieb Rob Herring:
>> On Sat, Mar 04, 2017 at 10:51:24PM +0100, Martin Blumenstingl wrote:
>>> Khadas is a new sub-brand of Shenzhen Wesion Technology CO.,LTD. They
>>> are developing Amlogic and Rockchip based "DIY boxes" (single board
>>> computers): http://khadas.com/
>>> They are best know for their latest product: the Khadas VIM (an Amlogic
>>> GXL S905X based SBC).
>>>
>>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>>> ---
>>>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>>  1 file changed, 1 insertion(+)
>>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> Shouldn't the entry reflect what is in the commit message rather than
> just repeat the prefix? I.e., something like "Khadas by Shenzhen Wesion
> Technology Co., Ltd." (which I believe is the official spelling and
> spacing of these abbreviations also for the commit message).
I took the spelling for "Shenzhen Wesion Technology CO.,LTD." from
their website: [0]

> An Acked-by from the CC'ed vendor would also be desirable. :)
I asked Gouwa, one of the people behind the Khadas VIM boards for
clarification some time ago:
"Khadas is a new brand power by Shenzhen Wesion Technology, 'Khadas'
is brand, 'VIM' is product serial name, like 'Apple + iPhone'"
I think I used the vendor-prefixes "pine64" and "radxa" as reference
(see [1]) when I wrote the patch - and none of the existing entries
seems to follow the "brand by parent company" schema.

@Gouwa, Rob: could you please share your opinion on what the official
"vendor" name for the "khadas" prefix should be?


Regards,
Martin


[0] http://szwesion.com/contact/
[1] http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/=
vendor-prefixes.txt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
