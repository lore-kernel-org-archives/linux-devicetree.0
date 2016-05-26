From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Subject: Re: [PATCH 02/11] drivers: clk: st: Add clock propagation for audio clocks
Date: Thu, 26 May 2016 11:49:46 +0200
Message-ID: <CAG374jDTCJfZB+PuAnggjXhbcd3NjJqrESpe_EnMniCAeoph9A@mail.gmail.com>
References: <1463560892-7209-1-git-send-email-gabriel.fernandez@linaro.org>
 <1463560892-7209-3-git-send-email-gabriel.fernandez@linaro.org> <20160525172409.GA27913@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160525172409.GA27913@rob-hp-laptop>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Olivier Bideau <olivier.bideau@st.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Pankaj Dev <pankaj.dev@st.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-ke>
List-Id: devicetree@vger.kernel.org

On 25 May 2016 at 19:24, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, May 18, 2016 at 10:41:23AM +0200, Gabriel Fernandez wrote:
> > This patch allows fine tuning of the quads FS for audio clocks
> > accuracy.
> >
> > Signed-off-by: Olivier Bideau <olivier.bideau@st.com>
> > Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
> > ---
> >  .../devicetree/bindings/clock/st/st,flexgen.txt    |  1 +
> >  drivers/clk/st/clk-flexgen.c                       | 24 ++++++++++++++++++++++
> >  2 files changed, 25 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/st/st,flexgen.txt b/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
> > index b7ee5c7..15b33c7 100644
> > --- a/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
> > +++ b/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
> > @@ -60,6 +60,7 @@ This binding uses the common clock binding[2].
> >  Required properties:
> >  - compatible : shall be:
> >    "st,flexgen"
> > +  "st,stih407-clkgend0", "st,flexgen" (enable clock propagation on parent)
>
> What do "d0" and "d2" refer to?
>
> This seems to indicate you have too much clock detail in the DT (with
> individual clocks described) or not enough with genericish compatible
> strings. What happens for the mext clock you need to adjust the flags
> on? You should be able to make these adjustments without DT updates.
> Perhaps you need a wider fixing of clock compatible strings.
>
> Rob

Sorry i sent my response in html...

Hi Rob,

Thanks for reviewing.

Can i remove
"
st,stih407-clkgend0" & "
st,stih407-clkgend2" compatible strings and add proprieties instead ?
I only need to activate 2 features and then we can keep generic
compatible strings.

e.g.

clk_s_d2_flexgen: clk-s-d2-flexgen {
#clock-cells = <1>;
compatible = "st,flexgen";
        ...
       st-sync-mode;
        st-update
-parent-rate;
};

for d0_flexgen i will enable only st-sync-mode;

Best Regards
