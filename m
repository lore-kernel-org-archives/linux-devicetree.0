Return-Path: <SRS0=/AVO=NC=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ve1eur01on0043.outbound.protection.outlook.com ([104.47.1.43]:51792
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727218AbeJWBSE (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 22 Oct 2018 21:18:04 -0400
From: York Sun <york.sun@nxp.com>
Subject: Re: re-licensing of bindings/chosen.txt
Date: Mon, 22 Oct 2018 16:58:41 +0000
Message-ID: <DB7PR04MB429865C654766E957039F20B9AF40@DB7PR04MB4298.eurprd04.prod.outlook.com>
References: <CAL_Jsq+Mab+6fwGMyC+aBiGQ3+EtYL2XxSqb-pSP1-BDhTbEBg@mail.gmail.com>
 <CAL_Jsq++N9RXU5VjdQpjCB7ijrbfBe5KKy-hYjuE-75ApUQROg@mail.gmail.com>
 <CAL_Jsq+QKQjShb9TO_Db2R5w2X_NheSZHNKwprB3qNQDshpW0A@mail.gmail.com>
 <e7e39bb58cb65d5fff23af4a9cd9c038d7a2bc60.camel@buserror.net>
 <DB7PR04MB42984B28138AF236FFEF72B79AF40@DB7PR04MB4298.eurprd04.prod.outlook.com>
 <CAL_Jsq+aGRAwrkLUBHEi8TBAWJ8nz5piEfma1EvxhBh5oyXuQw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Scott Wood <oss@buserror.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?iso-8859-1?Q?Jonathan_Neusch=E4fer?= <j.neuschaefer@gmx.net>, James Morse <james.morse@arm.com>, Leif Lindholm <leif.lindholm@linaro.org>, Kees Cook <keescook@chromium.org>, Leo Li <leoyang.li@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On 10/22/18 09:04, Rob Herring wrote:=0A=
> On Mon, Oct 22, 2018 at 10:09 AM York Sun <york.sun@nxp.com> wrote:=0A=
>>=0A=
>> On 10/22/18 06:37, Scott Wood wrote:=0A=
>>> On Mon, 2018-10-22 at 08:25 -0500, Rob Herring wrote:=0A=
>>>> On Wed, Oct 10, 2018 at 7:30 AM Rob Herring <robh@kernel.org> wrote:=
=0A=
>>>>>=0A=
>>>>> Fixing Scott's email.=0A=
>>>>=0A=
>>>> Scott, Just missing your okay on this.=0A=
>>>=0A=
>>> I'm fine with it personally, but I no longer work for NXP so I can't sp=
eak for=0A=
>>> them.  I've CCed a couple people who still work there.=0A=
>>>=0A=
>>=0A=
>> Rob,=0A=
>>=0A=
>> I didn't follow devicetree change lately. Which chosen.txt were you=0A=
>> talking about? Was it the one under Linux kernel Documentation?=0A=
> =0A=
> Yes, specifically these lines:=0A=
> =0A=
> 567cf94dc7801 (Scott Wood          2015-10-06 22:48:19 -0500  70)=0A=
> 567cf94dc7801 (Scott Wood          2015-10-06 22:48:19 -0500  71)=0A=
> linux,booted-from-kexec=0A=
> 567cf94dc7801 (Scott Wood          2015-10-06 22:48:19 -0500  72)=0A=
> -----------------------=0A=
> 567cf94dc7801 (Scott Wood          2015-10-06 22:48:19 -0500  73)=0A=
> 567cf94dc7801 (Scott Wood          2015-10-06 22:48:19 -0500  74) This=0A=
> property is set (currently only on PowerPC, and only needed on=0A=
> 567cf94dc7801 (Scott Wood          2015-10-06 22:48:19 -0500  75)=0A=
> book3e) by some versions of kexec-tools to tell the new kernel that it=0A=
> 567cf94dc7801 (Scott Wood          2015-10-06 22:48:19 -0500  76) is=0A=
> being booted by kexec, as the booting environment may differ (e.g.=0A=
> 567cf94dc7801 (Scott Wood          2015-10-06 22:48:19 -0500  77) a=0A=
> different secondary CPU release mechanism)=0A=
> =0A=
=0A=
Rob,=0A=
=0A=
We are OK for the dual license.=0A=
Copyright 2015 Freescale Semiconductor, Inc.=0A=
=0A=
York=0A=
