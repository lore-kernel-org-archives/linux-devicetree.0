From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4 2/4] dt-bindings: Add Renesas R-Car FDP1 bindings
Date: Mon, 24 Oct 2016 12:01:06 +0200
Message-ID: <CAMuHMdW9RhsvR8cDLWgGjqw+KzHC8A2L0S2JO1ymksaosv-iqg@mail.gmail.com>
References: <1477299818-31935-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1477299818-31935-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdUGy0+bv-t=8HXeQf0BpoMJMNP85cd2tubQzD4Zj8X9Gw@mail.gmail.com> <1923730.zaykC4sXJR@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1923730.zaykC4sXJR@avalon>
Sender: linux-media-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Kieran Bingham <kieran@ksquared.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Mon, Oct 24, 2016 at 11:46 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Monday 24 Oct 2016 11:14:11 Geert Uytterhoeven wrote:
>> On Mon, Oct 24, 2016 at 11:03 AM, Laurent Pinchart wrote:
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/media/renesas,fdp1.txt

>> > +Optional properties:
>> > + - power-domains : power-domain property defined with a power domain
>> > specifier
>>                       "power domain"?
>>
>> > +                            to respective power domain.
>>
>> Still, too many power domains in one sentence?
>
> How about
>
>  - power-domains : reference to the power domain that the FDP1 belongs to, if
>    any.

Much better. Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
