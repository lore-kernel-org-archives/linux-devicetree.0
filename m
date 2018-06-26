MIME-Version: 1.0
Date: Tue, 26 Jun 2018 08:47:05 -0600
References: <20180625063840.30173-1-vkoul@kernel.org>
	<20180625063840.30173-2-vkoul@kernel.org>
	<20180625172707.GA24068@rob-hp-laptop>
	<20180626035110.GD2404@vkoul-mobl>
In-Reply-To: <20180626035110.GD2404@vkoul-mobl>
Message-ID: <CAL_JsqLsUyWCE3sR0Xe+WkTz0JGXSX9pmCvvu8Vc7HACxJLU0Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: power: reset: Add qcom pon binding
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Vinod <vkoul@kernel.org>
Cc: linux-input@vger.kernel.org, "open list:THERMAL" <linux-pm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jun 25, 2018 at 9:51 PM Vinod <vkoul@kernel.org> wrote:
>
> On 25-06-18, 11:27, Rob Herring wrote:
> > On Mon, Jun 25, 2018 at 12:08:36PM +0530, Vinod Koul wrote:
> > > The Power On driver for Qcom PM 8xxx is a MFD supporting pwrkey and
> > > resin along with the Android reboot-mode.
> > > Add the binding describing this.
> > >
> > > Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> > >  .../devicetree/bindings/power/reset/qcom,pon.txt   | 45 ++++++++++++++++++++++
> > >  1 file changed, 45 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/power/reset/qcom,pon.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.txt b/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
> > > new file mode 100644
> > > index 000000000000..0dc24c9b93d5
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
> > > @@ -0,0 +1,45 @@
> > > +Qualcomm PON Driver
> >
> > Bindings are for h/w, not drivers...
>
> Thanks, will fix
>
> > > +The Power On driver for Qualcomm PM8xxx is MFD supporting pwrkey and
> > > +resin along with the Android reboot-mode.
> > > +
> > > +This DT node has pwrkey and resin as sub nodes.
> > > +
> > > +Required Properties:
> > > +-compatible: "qcom,pm8916-pon"
> > > +-reg: Specifies the physical address of the pon register
> > > +
> > > +Optional subnodes:
> > > +-prwrkey: Specifies the subnode pwrkey and should follow the
> >
> > typo
>
>
> Hmmm which one?

s/prwrkey/pwrkey/

>
> > > + qcom,pm8xxx-pwrkey.txt description.
> > > +-resin: Specifies the subnode resin and should follow the
> > > + qcom,pm8xxx-pwrkey.txt description.
> > > +
> > > +The rest of the properties should follow the generic reboot-mode description
> > > +found in reboot-mode.txt
> > > +
> > > +Example:
> > > +
> > > +   pon@800 {
> > > +           compatible = "qcom,pm8916-pon";
> > > +
> > > +           reg = <0x800>;
> > > +           mode-bootloader = <0x2>;
> > > +           mode-recovery = <0x1>;
> > > +
> > > +           pwrkey {
> > > +                   compatible = "qcom,pm8941-pwrkey";
> > > +                   interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
> > > +                   debounce = <15625>;
> > > +                   bias-pull-up;
> > > +                   linux,code = <KEY_POWER>;
> > > +           };
> > > +
> > > +           resin {
> > > +                   compatible = "qcom,pm8941-resin";
> >
> > Not documented.
>
> qcom,pm8xxx-pwrkey.txt documents this. Subnode documentation is not
> provided here

Is it new because it is not in any tree I see.

Rob
