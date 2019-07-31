From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: DTC check_duplicate_node_names (was: Re: [PATCH] arm64: dts: renesas:
 r8a77990: ebisu: Fix backlight regulator numbering)
Date: Wed, 31 Jul 2019 09:56:33 +0200
Message-ID: <CAMuHMdWajtaDGFFkd-GiyR_V8fnpRcn=Uuf8UQuJdcYSigivQQ@mail.gmail.com>
References: <20190109140045.17449-1-marek.vasut@gmail.com>
 <CAMuHMdX3bP_WCYNRRMmVRPwV52e72NOZMtW8cf29Fo+E9_CvcQ@mail.gmail.com>
 <20190109165822.tmj7qbho46f7clvg@verge.net.au> <1690279.yngTTxF0vm@avalon>
 <0d08d3c1-94ec-dcbe-ad3d-b079ab2ad17e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <0d08d3c1-94ec-dcbe-ad3d-b079ab2ad17e@gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Simon Horman <horms@verge.net.au>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Frank Rowand <frowand.list@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Marek,

Bringing this to the attention of the DTC people...

On Thu, Jan 10, 2019 at 3:38 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 1/10/19 1:59 PM, Laurent Pinchart wrote:
> > On Wednesday, 9 January 2019 18:58:23 EET Simon Horman wrote:
> >> On Wed, Jan 09, 2019 at 04:26:25PM +0100, Geert Uytterhoeven wrote:
> >>> On Wed, Jan 9, 2019 at 3:01 PM <marek.vasut@gmail.com> wrote:
> >>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>>>
> >>>> There are two regulator1 nodes in the Ebisu DTS right now, one 3.3V for
> >>>> the eMMC and one 12V for the backlight. This causes one to be
> >>>> overwritten
> >>>> by the other, ultimatelly resulting in inoperable eMMC, which depends on
> >>>> the former. Fix this by renumbering the backlight regulator to
> >>>> regulator2.
> >>>>
> >>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>>> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >>>> Cc: Simon Horman <horms+renesas@verge.net.au>
> >>>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >>>> Cc: linux-renesas-soc@vger.kernel.org
> >>>> Reported-by: Simon Horman <horms+renesas@verge.net.au>
> >>>> Fixes: 9d16c4a10e07 ("arm64: dts: renesas: r8a77990: ebisu: Add
> >>>> backlight")
> >>>
> >>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>>
> >>>> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> >>>> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> >>>> @@ -191,7 +191,7 @@
> >>>>
> >>>>                 clock-frequency = <24576000>;
> >>>>
> >>>>         };
> >>>>
> >>>> -       reg_12p0v: regulator1 {
> >>>> +       reg_12p0v: regulator2 {
> >>>>
> >>>>                 compatible = "regulator-fixed";
> >>>>                 regulator-name = "D12.0V";
> >>>>                 regulator-min-microvolt = <12000000>;
> >>>
> >>> Perhaps the node name should get a more descriptive suffix
> >>> (e.g. "regulator-12p0v"), like is already done for some of the other
> >>> regulators?
> >>
> >> I think I would prefer that addressed in a follow-up patch.
> >
> > Agreed, but it would still be a very good idea. I think we need to standardize
> > names for regulators, otherwise this is bound to happen again in the future.

And so it did (patch sent for the same bug in r8a77995-draak.dts).

> Isn't the YAML DT schema validator supposed to catch those problems ?
> I'd even expect DTC to be able to catch such duplicate nodes and warn
> about them.

DTC indeed has check_duplicate_node_names.
However, it only works for the base DTS, not for any later modifications in
the board DTS.

I.e. the original dup-nodename.dts in the DTC testsuite triggers an error,
but the modified version below doesn't.

--- a/tests/dup-nodename.dts
+++ b/tests/dup-nodename.dts
@@ -1,8 +1,11 @@
 /dts-v1/;

+/ {
+};
+
 / {
        node {
        };
        node {
        };
 };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
