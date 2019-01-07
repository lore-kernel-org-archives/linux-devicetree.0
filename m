Return-Path: <SRS0=iARg=PP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:30847 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfAGTeL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 7 Jan 2019 14:34:11 -0500
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] ARM: dts: omap3-gta04: Fix graph_port warning
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20190107183419.GG5544@atomide.com>
Date: Mon, 7 Jan 2019 20:34:07 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <DE542A85-9B46-4AA4-B4E8-8880D23355EC@goldelico.com>
References: <20190107160512.9480-1-tony@atomide.com> <ED6668F3-73A7-49A1-A7C7-E54381841222@goldelico.com> <CAL_Jsq+RQMjeH+YTphrXBQRdpUse1rSvPGdJiqcoRQWMPT+-ZQ@mail.gmail.com> <20190107183419.GG5544@atomide.com>
Sender: devicetree-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Rob Herring <robh@kernel.org>, linux-omap <linux-omap@vger.kernel.org>, =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>


> Am 07.01.2019 um 19:34 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * Rob Herring <robh@kernel.org> [190107 18:32]:
>> On Mon, Jan 7, 2019 at 10:21 AM H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>>=20
>>> Hi Tony,
>>>=20
>>>> Am 07.01.2019 um 17:05 schrieb Tony Lindgren <tony@atomide.com>:
>>>>=20
>>>> We're currently getting a warning with make dtbs:
>>>>=20
>>>> arch/arm/boot/dts/omap3-gta04.dtsi:720.7-727.4: Warning =
(graph_port):
>>>> /ocp@68000000/dss@48050000/encoder@48050c0 0/port: graph node unit
>>>> address error, expected "0"
>>>=20
>>> yes, dtc has become more critical nowadays...
>>>=20
>>> To me it looks like redundant information, but it is how it is.
>>=20
>> If there's only one port, then it is redundant and you should drop =
reg
>> instead.

If I remember correctly it was required by older omapdrm code (which
did scan for a reg property) but that may have changed. Therefore I've
added Tomi to this discussion.


>> There should be a warning for that too. That one is probably
>> off by default as that's more subjective and noisy.
>=20
> OK dropping this patch. Nikolaus, care to post a better
> version since you can test it?
>=20
> Regards,
>=20
> Tony
