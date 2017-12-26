From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/5] ARM: dts: Add support for emtrion emCON-MX6 series
Date: Tue, 26 Dec 2017 11:16:34 -0600
Message-ID: <CAL_JsqKKwDmq953x+0SnZ_u4T5kXyQza9rnEOzyyomSTmf7Hqw@mail.gmail.com>
References: <95F51F4B902CAC40AF459205F6322F01B7FDFECC3C@BMK019S01.emtrion.local>
 <20171222104028.GC18255@piout.net> <b41bc779-28e8-5a87-6f66-f5874dba8d1e@suse.de>
 <20171222105642.GD18255@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171222105642.GD18255-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>, =?UTF-8?B?VMO8cmssIEphbg==?= <Jan.Tuerk-BU0Y/NROKIiELgA04lAiVw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, SZ Lin <sz.lin-D4fb9hXD9d4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 22, 2017 at 4:56 AM, Alexandre Belloni
<alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> + Philippe
>
> On 22/12/2017 at 11:43:33 +0100, Andreas Färber wrote:
>> >> I'll change it for v3 of this patch however it will end up like this:
>> >> //SPDX-License...
>> >
>> > That should be /* SPDX-License */, // is for c files.
>>
>> Got any reference for that? Since we're using the C preprocessor before
>> feeding them to dtc, we can use the same // style for both, builds fine.
>>
>> Only for my private DT overlay files that I use directly with dtc I
>> couldn't adopt that style.

We are well past the point of being able to build most dts files with just dtc.

> The doc states:
>
> If a specific tool cannot handle the standard comment style, then the
> appropriate comment mechanism which the tool accepts shall be used. This
> is the reason for having the "/\* \*/" style comment in C header
> files.
>
> I interpreted that as dtc doesn't handle // comments, use /**/

It's been so long, I'd forgotten that. Perhaps we should fix dtc to
handle // comments.

>
> But I agree it also states:
> .dts{i}:          // SPDX-License-Identifier: <SPDX License Expression>

Or we could still change this. The guidelines aren't merged yet.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
