From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 2/4] ARM: dts: r8a7745: Add PWM SoC support
Date: Wed, 20 Dec 2017 10:10:24 +0100
Message-ID: <20171220091023.vp4zss33w2tc2ppe@verge.net.au>
References: <1513620411-17478-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1513620411-17478-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdUi953N1J+vfJWJo0GMKO4tBZV9HnX7haG0fvyNHfOvOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUi953N1J+vfJWJo0GMKO4tBZV9HnX7haG0fvyNHfOvOA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Mark Rutland <mark.rutland@arm.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Biju Das <biju.das@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 19, 2017 at 12:25:54PM +0100, Geert Uytterhoeven wrote:
> On Mon, Dec 18, 2017 at 7:06 PM, Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
> > Add the definitions for pwm[0123456] to the SoC .dtsi.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > --- a/arch/arm/boot/dts/r8a7745.dtsi
> > +++ b/arch/arm/boot/dts/r8a7745.dtsi
> > @@ -968,6 +968,83 @@
> >                         status = "disabled";
> >                 };
> >
> > +               pwm0: pwm@e6e30000 {
> > +                       compatible = "renesas,pwm-r8a7745",
> > +                                    "renesas,pwm-rcar";
> 
> I think this can fit on one line.

No need. I have fixed this when applying the patch.
