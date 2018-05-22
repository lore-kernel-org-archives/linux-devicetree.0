From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 8/9] ARM: dts: alt: Drop MTD partitioning from DT
Date: Tue, 22 May 2018 16:45:32 +0200
Message-ID: <CAMuHMdWb1NtxFNPUk1O4+fR+5pZtLXi8Un361Yg2SZZt_J_RFQ@mail.gmail.com>
References: <20180522120257.13232-1-marek.vasut+renesas@gmail.com>
 <20180522120257.13232-8-marek.vasut+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180522120257.13232-8-marek.vasut+renesas@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa@the-dreams.de>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simon Horman <horms+renesas@verge.net.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, May 22, 2018 at 2:02 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> Drop the MTD partitioning from DT, since it does not describe HW
> and to give way to a more flexible kernel command line partition
> passing.
>
> To retain the original partitioning, assure you have enabled
> CONFIG_MTD_CMDLINE_PARTS in your kernel config and add the
> following to your kernel command line:
>
>   mtdparts=spi0.0:256k@0(loader),256k(system),-(user)

Drop @0?

> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
