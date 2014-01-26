From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/8] pci-rcar-gen2: add initial device tree documentation
Date: Sun, 26 Jan 2014 20:09:39 +0100
Message-ID: <CAMuHMdVo80pmYG+MC8d4-_Lxod0j2reAEEFM4sC7Z2vCbEioMw@mail.gmail.com>
References: <1390754945-28142-1-git-send-email-ben.dooks@codethink.co.uk>
	<1390754945-28142-3-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1390754945-28142-3-git-send-email-ben.dooks@codethink.co.uk>
Sender: linux-sh-owner@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, Linux-sh list <linux-sh@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, horms+renesas@verge.net.au
List-Id: devicetree@vger.kernel.org

On Sun, Jan 26, 2014 at 5:48 PM, Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> + - reg : A list of physical regions to access the device. The first is
> +         the operational registers for the OHCI/EHCI controller and the
> +        second region is for the bridge configuration and control registers.

You may want to add "reg-names" to use named regions, as there
is more than one region.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
