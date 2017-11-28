From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [bbb-overlays] Fixing overlay configfs for v4.15-rc1
Date: Tue, 28 Nov 2017 09:57:56 +0100
Message-ID: <CAMuHMdXf5BJR6rMEjyomKEJTx+fEV2c4XoPN-_tf91Zs_Eajdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Pantelis,

Thanks to the rework of the overlay code in v4.15-rc1, the current overlay
configfs code no longer applies cleanly (that's what I call an understatement
;-).

I have rebased my topic/overlays and topic/renesas-overlays branches on top
of v4.15-rc1.  Feel free to have a look, it seems to work.

The old versions (for v4.14) are still available in topic/overlays-v4.14
resp. topic/renesas-overlays-v4.14.

All topic branches mentioned above can be found in my repo at:
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
