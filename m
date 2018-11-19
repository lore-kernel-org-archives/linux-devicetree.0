From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77965: Add CAN controller
 nodes
Date: Mon, 19 Nov 2018 10:00:02 +0100
Message-ID: <CAMuHMdUjONJYypV0a5wnxyBx+sUMHzRwZObQ=d7xFG2ZSCM3Ag@mail.gmail.com>
References: <20181118173327.4704-1-marek.vasut+renesas@gmail.com>
 <20181118230250.GA2553@kunai> <6ffce819-4d8e-e54a-ba82-0845c36a6ec4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <6ffce819-4d8e-e54a-ba82-0845c36a6ec4@gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa@the-dreams.de>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Simon Horman <horms+renesas@verge.net.au>, Rob Herring <robh@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Marek,

On Mon, Nov 19, 2018 at 12:46 AM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 11/19/2018 12:02 AM, Wolfram Sang wrote:
> > On Sun, Nov 18, 2018 at 06:33:26PM +0100, Marek Vasut wrote:
> >> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >>
> >> This patch adds CAN{0,1} controller nodes for the R8A77965 SoC.
> >>
> >> Based on several similar patches of the R8A7795 device tree
> >> by Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
> >> and Geert Uytterhoeven <geert+renesas@glider.be>.
> >>
> >> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> >> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> >> Cc: Rob Herring <robh@kernel.org>
> >> Cc: Simon Horman <horms+renesas@verge.net.au>
> >> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >> Cc: linux-renesas-soc@vger.kernel.org
> >> Cc: linux-arm-kernel@lists.infradead.org
> >
> > Were you able to do some testing using EXIO connectors? Would be nice to
> > know what was tested.
>
> Not on the M3N, since I don't see it broken out on the EXIO ; is it
> really there ? It'd be easy to test on M3NSK with KF, but I don't have
> either KF or M3NSK.

Please have a look at EXIO Connector D, pins 13/14/15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
