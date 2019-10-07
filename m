From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: sdm845: Add unit name to soc node
Date: Mon, 7 Oct 2019 12:57:30 -0500
Message-ID: <CAL_JsqJpAqdFQKQLjh0szD2HY23bkFSg2fioDi2VxYvZcs6wsQ@mail.gmail.com>
References: <20190724044906.12007-1-vkoul@kernel.org> <20190724044906.12007-2-vkoul@kernel.org>
 <CANcMJZBWsfwWmHbGCG+KG4n1kpmytw_8O4uA8HEVv8ysBxiQgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANcMJZBWsfwWmHbGCG+KG4n1kpmytw_8O4uA8HEVv8ysBxiQgw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Amit Pundir <amit.pundir@linaro.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 7, 2019 at 12:44 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Tue, Jul 23, 2019 at 9:51 PM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > We get a warning about missing unit name for soc node, so add it.
> >
> > arch/arm64/boot/dts/qcom/sdm845.dtsi:623.11-2814.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
> >
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index 601cfb078bd5..e81f4a6d08ce 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -620,7 +620,7 @@
> >                 method = "smc";
> >         };
> >
> > -       soc: soc {
> > +       soc: soc@0 {
> >                 #address-cells = <2>;
> >                 #size-cells = <2>;
> >                 ranges = <0 0 0 0 0x10 0>;
>
> So Amit Pundir noted that this patch is causing 5.4-rc to no longer
> boot on db845 w/ AOSP, due to it changing the userland sysfs paths
> from "/devices/platform/soc/1a00000.mdss" to
> "/devices/platform/soc@0/1a00000.mdss"
>
> Is there a better solution here that might not break userspace?

Other than doing the right thing of not relying on
/sys/devices/platform/* paths, implement per target/file DTC_FLAGS
similar to CFLAGS. There is another want for this in order to enable
dtc symbols for overlays on a per board basis.


Rob
