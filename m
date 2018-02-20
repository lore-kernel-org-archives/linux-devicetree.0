From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 05/19] pinctrl: sh-pfc: Initial R-Car M3-N support
Date: Tue, 20 Feb 2018 19:35:49 +0100
Message-ID: <CAMuHMdUo+q2V-jpvguW75dbSxoGvihR1yxZSb3AUPrQ22L2xBQ@mail.gmail.com>
References: <1519139541-18783-1-git-send-email-jacopo+renesas@jmondi.org>
 <1519139541-18783-6-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1519139541-18783-6-git-send-email-jacopo+renesas@jmondi.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

On Tue, Feb 20, 2018 at 4:12 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add initial PFC support for R-Car M3-N (r8a77965) SoC.
> No groups or functions defined, just pin and registers enumeration.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
>
> ---
> v1 -> v2:
>
> Applied the following patches for r8a7796 on r8a77965:
>
> commit 0f4713d71f22d3b0ec3de6ae4a126cceecdea82b
> Author: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Date:   Thu Nov 16 23:59:21 2017 +0900
> pinctrl: sh-pfc: r8a7796: Rename RTS{0,1,3,4}# pin function definitions
>
> commit fbd81e345c9393b96e8ad252eef390f8c6f9cf60
> Author: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Date:   Thu Nov 16 12:17:18 2017 +0900
> pinctrl: sh-pfc: r8a7796: Fix to delete A20..A25 pins function definitions

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
and queueing in sh-pfc-for-v4.17, with the following recent fixes for
r8a7796 that are also applicable to r8a77965 folded in:

    pinctrl: sh-pfc: r8a7796: Fix IPSR and MOD_SEL register pin
assignment for NDFC pins group
    pinctrl: sh-pfc: r8a7796: Fix MOD_SEL register pin assignment for
SSI pins group

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
