From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 01/21] of: Add cpu node iterator for_each_of_cpu_node()
Date: Thu, 6 Sep 2018 10:45:14 +0200
Message-ID: <CAMuHMdVQxpkzMMu1-4Bkph=YsXQKFeEHK4WccEzSzHvX=1CH6Q@mail.gmail.com>
References: <20180905193738.19325-1-robh@kernel.org> <20180905193738.19325-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905193738.19325-2-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 5, 2018 at 9:38 PM Rob Herring <robh@kernel.org> wrote:
> Iterating thru cpu nodes is a common pattern. Create a common iterator
> which can find child nodes either by node name or device_type == cpu.
> Using the former will allow for eventually dropping device_type
> properties which are deprecated for FDT.
>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
