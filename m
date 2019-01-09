Return-Path: <SRS0=TUFM=PR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:18066 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726831AbfAIRmb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 9 Jan 2019 12:42:31 -0500
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] ARM: dts: omap3-gta04: Fix graph_port warning
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20190109170119.GR5544@atomide.com>
Date: Wed, 9 Jan 2019 18:42:27 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <751B822B-ED91-4558-AAEF-2D88B89A645E@goldelico.com>
References: <20190107160512.9480-1-tony@atomide.com> <ED6668F3-73A7-49A1-A7C7-E54381841222@goldelico.com> <CAL_Jsq+RQMjeH+YTphrXBQRdpUse1rSvPGdJiqcoRQWMPT+-ZQ@mail.gmail.com> <20190107183419.GG5544@atomide.com> <DE542A85-9B46-4AA4-B4E8-8880D23355EC@goldelico.com> <46dce758-2339-c4ef-891b-5cf4522fb7df@ti.com> <20190108155606.GM5544@atomide.com> <4F877B6F-2AED-4891-9676-5AB69B01C1AD@goldelico.com> <20190109170119.GR5544@atomide.com>
Sender: devicetree-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Rob Herring <robh@kernel.org>, linux-omap <linux-omap@vger.kernel.org>, =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Tony,

> Am 09.01.2019 um 18:01 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * H. Nikolaus Schaller <hns@goldelico.com> [190109 16:47]:
>> Ho Tony, Tomi,
>>=20
>>> Am 08.01.2019 um 16:56 schrieb Tony Lindgren <tony@atomide.com>:
>>>=20
>>> * Tomi Valkeinen <tomi.valkeinen@ti.com> [190108 07:57]:
>>>> On 07/01/19 21:34, H. Nikolaus Schaller wrote:
>>>>=20
>>>>>>> If there's only one port, then it is redundant and you should =
drop reg
>>>>>>> instead.
>>>>>=20
>>>>> If I remember correctly it was required by older omapdrm code =
(which
>>>>> did scan for a reg property) but that may have changed. Therefore =
I've
>>>>> added Tomi to this discussion.
>>>>=20
>>>> I don't think so. The code looks for 'reg', but if it's not there, =
then
>>>> it's considered 0.
>>>=20
>>> FYI, the binding doc for the graph bindings is at
>>> Documentation/devicetree/bindings/graph.txt if there is
>>> any questions on how things should work.
>>=20
>> I interpret it that "port@number" is only needed if there are
>> multiple ports and there should not be any "@" or "reg" for the
>> single port case. Although it seems not to be explicitly
>> forbidden.
>>=20
>> The &dss port doesn't have it either.
>>=20
>> So let's remove the reg =3D <0>;
>>=20
>> It also seems that
>>=20
>> 	#address-cells =3D <1>;
>> 	#size-cells =3D <0>;
>>=20
>> is not required in this case and can also be removed.
>>=20
>> I've tested and it works with v5.0-rc1.
>>=20
>> There is an edited patch [1] but IMHO you as the original
>> author should post it.
>=20
> Looks good to me. But since you already modified it, all
> you need to do is add your Signed-off-by after mine and
> mail it out :)

Well, the main job is mailing it out (collecting the destination
addresses)...

> That is if you want to keep me as the
> original author I guess for the description.
>=20
> Otherwise we have to go through one more round of emails
> where I post it you ack it and so on as I can't test it.

Anyways, I send it asap.

BR,
Nikolaus

>=20
> Regards,
>=20
> Tony
>=20
>> [1]: =
http://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dcommit;h=3De46369390f62=
ce7176e91dfa443185e4b097ef4b
