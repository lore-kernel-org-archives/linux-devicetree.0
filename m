From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 05/21] ARM: shmobile: use for_each_of_cpu_node iterator
Date: Thu, 6 Sep 2018 10:52:23 +0200
Message-ID: <CAMuHMdVaxahVjR2NmfYmt8ELaaDoZdfL3WeDJ8oxS8JxOsjPxw@mail.gmail.com>
References: <20180905193738.19325-1-robh@kernel.org> <20180905193738.19325-6-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905193738.19325-6-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 5, 2018 at 9:38 PM Rob Herring <robh@kernel.org> wrote:
> Use the for_each_of_cpu_node iterator to iterate over cpu nodes. This
> has the side effect of defaulting to iterating using "cpu" node names in
> preference to the deprecated (for FDT) device_type == "cpu".
>
> Cc: Simon Horman <horms@verge.net.au>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
