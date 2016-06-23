From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 01/13] ARM: shmobile: r8a7792: add clock index macros
Date: Thu, 23 Jun 2016 09:46:39 +0200
Message-ID: <CAMuHMdW2X7AjnQBRSdO9i9_7p8WoMpXMZmL23g5890doNsQRtg@mail.gmail.com>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <2280165.siMXMbFrFe@wasted.cogentembedded.com> <20160601005246.GF20527@verge.net.au>
 <b9619ed2-1ebf-0991-ca90-f9dbe6d1d4f6@cogentembedded.com> <20160622223330.GA15843@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160622223330.GA15843-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 23, 2016 at 12:33 AM, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org> wrote:
> On Wed, Jun 22, 2016 at 10:52:04PM +0300, Sergei Shtylyov wrote:
>>    I've just downloaded and opened rev2.00 manual, and still, there's no
>> CPG registers other than FRQCRB on V2H.
>>
>> >It does, however, provide RCAN and ADSP which are supported by the CPG
>> >driver. You may wish to add them now for completeness though from my point
>> >of view they could also be added later when they are used.
>>
>>    My copy of the manual says there's no ADSP on V2H, and thus no ADSP clock.
>
> I was looking at Figure 7.1c. Perhaps it is inaccurate.

Probably, the ADSP is missing for V2H in all other sections of the datasheet:
  - There's no ADSP clock in Table 7.2c,
  - ADSPCKCR does not exist according to Table 7.10,
  - There are no ADSP MSSR bits, interrupts, or micro-TLBs,
  - The audio and ADSP modules do not exist.

Of course that's the datasheet, there may still be actual hardware listening
when you try to talk to it ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
