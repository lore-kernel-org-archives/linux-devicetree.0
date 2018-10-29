From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH linux-next v1 2/4] clk: renesas: Add binding document for
 AVB Counter Clock
Date: Mon, 29 Oct 2018 08:14:18 -0500
Message-ID: <CAL_Jsq+7VF2awqLeott3XTvNU6BgNit+Os+q4LfwDgYGdeA6KA@mail.gmail.com>
References: <20181025072349.15173-1-jiada_wang@mentor.com> <20181025072349.15173-3-jiada_wang@mentor.com>
 <20181025214925.GA5197@bogus> <d6053012-85b1-3fbf-c35b-c5c5816e9fa8@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d6053012-85b1-3fbf-c35b-c5c5816e9fa8@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiada Wang <jiada_wang@mentor.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 25, 2018 at 9:32 PM Jiada Wang <jiada_wang@mentor.com> wrote:
>
> Hi Rob
>
>
> On 2018/10/26 6:49, Rob Herring wrote:
> > On Thu, Oct 25, 2018 at 04:23:47PM +0900, jiada_wang@mentor.com wrote:
> >> From: Jiada Wang <jiada_wang@mentor.com>
> >>
> >> Add device tree bindings for avb counter clock for Renesas
> >> R-Car Socs.
> >>
> >> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> >> ---
> >>   .../bindings/clock/renesas,avb-clk.txt        | 19 +++++++++++++++++=
++
> >>   1 file changed, 19 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/clock/renesas,a=
vb-clk.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/renesas,avb-clk.t=
xt b/Documentation/devicetree/bindings/clock/renesas,avb-clk.txt
> >> new file mode 100644
> >> index 000000000000..03bf50b5830c
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/clock/renesas,avb-clk.txt
> >> @@ -0,0 +1,19 @@
> >> +* Renesas AVB Counter Clock
> >> +
> >> +The AVB Counter Clocks are provided by avb_counter8 Clock Generator,
> >> +avb_counter8 has dividers which operates with S0D1=CF=95 clock and ha=
s
> >> +8 output clocks.
> >> +
> >> +Required Properties:
> >> +  - compatible: Must be "renesas,clk-avb"
> > Should be SoC specific?
> yes, avb counter clock is SoC specific, I will move avb clock node to
> Soc .dtsi in next version

The compatible string should be SoC specific too then.

Rob
