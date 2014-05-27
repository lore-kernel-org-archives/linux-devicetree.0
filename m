From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 2/9] ARM: shmobile: r8a7790: add dma defines for sys
 and audio dmacs
Date: Tue, 27 May 2014 10:08:45 +0200
Message-ID: <CAMuHMdX7YzDq4HT6A3a2jgUQ1DNx=oEA0f1SCfN45uusbwk40g@mail.gmail.com>
References: <1397511312-4845-1-git-send-email-ben.dooks@codethink.co.uk>
	<1397511312-4845-3-git-send-email-ben.dooks@codethink.co.uk>
	<CAMuHMdUsRSGuGgnAgjKtOWmx3C_PWUxAU=2XTvPE1M9o13S1uA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdUsRSGuGgnAgjKtOWmx3C_PWUxAU=2XTvPE1M9o13S1uA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Linux-sh list <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, magnus.damm-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ben,

On Tue, May 13, 2014 at 12:46 PM, Geert Uytterhoeven
<geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
>> +#define R8A7790_DMA_MSIOF0_TX  (0x81)
>> +#define R8A7790_DMA_MSIOF0_RX  (0x82)
>> +#define R8A7790_DMA_MSIOF1_TX  (0x85)
>> +#define R8A7790_DMA_MSIOF1_RX  (0x86)
>
> These are the only ones that se different for r8a7791 (0x51 etc.
> compared to 0x81).
> Wondering whether someone mixed up decimal and hexadecimal...

Confirmed. They should be 0x51, 0x52, 0x55, 0x56.

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
