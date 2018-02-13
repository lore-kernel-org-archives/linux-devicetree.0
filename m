From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v9 2/3] arm: dts: add Nuvoton NPCM750 device tree
Date: Tue, 13 Feb 2018 09:30:56 +0100
Message-ID: <CAK8P3a0SJTAkv7_QtDW1sDWFDYHw8tFWZqO6EMwpZ_5KPbhq3Q@mail.gmail.com>
References: <20180205235757.246758-1-brendanhiggins@google.com> <20180205235757.246758-3-brendanhiggins@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180205235757.246758-3-brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Julien Thierry <julien.thierry-5wv7dgnIgG8@public.gmane.org>, Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, OpenBMC Maillist <openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 6, 2018 at 12:57 AM, Brendan Higgins
<brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
> Add a common device tree for all Nuvoton NPCM750 BMCs and a board
> specific device tree for the NPCM750 (Poleg) evaluation board.
>
> Signed-off-by: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Avi Fishman <avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Tested-by: Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Tested-by: Avi Fishman <avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
...
> +               enable-method = "nuvoton,npcm7xx-smp";

I see this has already been reviewed quite a bit, but I'm curious
about the 'npcm7xx'
part here. Shouldn't that be a real chip name rather than a wildcard?

       Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
