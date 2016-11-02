From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND/PATCH v6 3/3] clk: qcom: Add A53 clock driver
Date: Wed, 2 Nov 2016 13:59:11 -0700
Message-ID: <20161102205910.GQ25787@tuxbot>
References: <20161019132816.31073-4-georgi.djakov@linaro.org>
 <20161028015438.GG16026@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161028015438.GG16026-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu 27 Oct 18:54 PDT 2016, Stephen Boyd wrote:

> On 10/19, Georgi Djakov wrote:
> > Add a driver for the A53 Clock Controller. It is a hardware block that
> > implements a combined mux and half integer divider functionality. It can
> > choose between a fixed-rate clock or the dedicated A53 PLL. The source
> > and the divider can be set both at the same time.
> > 
> > This is required for enabling CPU frequency scaling on platforms like
> > MSM8916.
> > 
> 
> Please Cc DT reviewers.
> 
> > Signed-off-by: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  .../devicetree/bindings/clock/qcom,a53cc.txt       |  22 +++
> >  drivers/clk/qcom/Kconfig                           |   8 ++
> >  drivers/clk/qcom/Makefile                          |   1 +
> >  drivers/clk/qcom/a53cc.c                           | 155 +++++++++++++++++++++
> >  4 files changed, 186 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53cc.txt
> >  create mode 100644 drivers/clk/qcom/a53cc.c
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,a53cc.txt b/Documentation/devicetree/bindings/clock/qcom,a53cc.txt
> > new file mode 100644
> > index 000000000000..a025f062f177
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/qcom,a53cc.txt
> > @@ -0,0 +1,22 @@
> > +Qualcomm A53 CPU Clock Controller Binding
> > +------------------------------------------------
> > +The A53 CPU Clock Controller is hardware, which provides a combined
> > +mux and divider functionality for the CPU clocks. It can choose between
> > +a fixed rate clock and the dedicated A53 PLL.
> > +
> > +Required properties :
> > +- compatible : shall contain:
> > +
> > +			"qcom,a53cc"
> > +
> > +- reg : shall contain base register location and length
> > +	of the APCS region
> > +- #clock-cells : shall contain 1
> > +
> > +Example:
> > +
> > +	apcs: syscon@b011000 {
> > +		compatible = "qcom,a53cc", "syscon";
> 
> Why is it a syscon? Is that part used?
> 

I use the register at offset 8 for interrupting the other subsystems, so
this must be available as something I can poke.

Which makes me think that this should be described as a "simple-mfd" and
"syscon" with the a53cc node as a child - grabbing the regmap of the
syscon parent, rather then ioremapping the same region again.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
