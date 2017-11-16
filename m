From: Giulio Benetti <giulio.benetti-W14uJ/fiAyBY2hyreNRi6g@public.gmane.org>
Subject: Re: Cedrus driver
Date: Thu, 16 Nov 2017 11:37:30 +0100
Message-ID: <693e8786-af83-9d77-0fd4-50fa1f6a135f@micronovasrl.com>
References: <1510059543-7064-1-git-send-email-giulio.benetti@micronovasrl.com>
 <1b12fa21-bfe6-9ba7-ae1d-8131ac6f4668@micronovasrl.com>
 <6fcdc0d9-d0f8-785a-bb00-b1b41c684e59@imkreisrum.de>
Reply-To: giulio.benetti-W14uJ/fiAyBY2hyreNRi6g@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV5B5VKVYCRB3GUWXIAKGQEDKKRSBI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <6fcdc0d9-d0f8-785a-bb00-b1b41c684e59-IaPFKHZio8oZId6A0yLOdQ@public.gmane.org>
Content-Language: it
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andreas Baierl <list-IaPFKHZio8oZId6A0yLOdQ@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Il 16/11/2017 11:31, Andreas Baierl ha scritto:
> Am 16.11.2017 um 11:13 schrieb Giulio Benetti:
>> Hello,
>>
> Hello,
>> I'm wondering why cedrus=20
>> https://github.com/FlorentRevest/linux-sunxi-cedrus has never been=20
>> merged with linux-sunxi sunxi-next.
>>
> Because it is not ready to be merged. It depends on the v4l2 request=20
> API, which was not merged and which is re-worked atm.
> Also, sunxi-cedrus itself is not in a finished state and is not as=20
> feature-complete to be merged. Anyway it might be something for=20
> staging... Has there been a [RFC] on the mailing list at all?

Where can I find a list of TODOs to get it ready to be merged?

>> I see it seems to be dead, no commit in 1 year.
> Yes, because the author did this during an internship, which ended ...=20
> Afaik nobody picked up his work yet.
>> I would like to respawn it and contribute to sunxi-next,
> Feel free to work on it...

Hope to be able, but I'm going to try.

>> since we need video acceleration on A20 and A33.
>>
> ack.

By the way, when you answer to google group, is it right that all CC I=20
inserted are not inserted too?
Because this causes mess with mailing lists (seems to me).

>=20
> Regards
> rellla
>> Best regards
>>
>=20


--=20
Giulio Benetti
R&D Manager &
Advanced Research

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale =E2=82=AC 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
