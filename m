From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: phy-qcom-qmp: Fix register underspecification
Date: Tue, 23 Oct 2018 09:30:00 -0700
Message-ID: <CAE=gft4t7jY89sJ8aJysdiJxq64Gp0ABC04jmOQEq9=yCckBhw@mail.gmail.com>
References: <20181018210933.113592-1-evgreen@chromium.org> <20181018210933.113592-2-evgreen@chromium.org>
 <20181023002903.GA16854@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181023002903.GA16854@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org
Cc: mark.rutland@arm.com, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, kishon@ti.com, Doug Anderson <dianders@chromium.org>, Manu Gautam <mgautam@codeaurora.org>, cang@codeaurora.org, vivek.gautam@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, swboyd@chromium.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 22, 2018 at 5:29 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Oct 18, 2018 at 02:09:29PM -0700, Evan Green wrote:
> > This change adds register regions for the second lane of dual-lane nodes.
> > This additional specification is needed so that the driver can stop
> > reaching beyond the tx and rx register allocations to get at the
> > second lane registers in a dual-lane PHY.
> >
> > While in there, document #clock-cells as optional for PHYs that don't
> > provide a pipe clock. Also, document the pcs_misc register region, which
> > was being quietly supplied and used.
> >
> > Signed-off-by: Evan Green <evgreen@chromium.org>
> >
> > ---
> > This applies atop linux-next 20181018 with the addition of Doug's
> > changes [1] and [2].
> >
> > [1] https://lore.kernel.org/lkml/20181012213632.252346-1-dianders@chromium.org/
> > [2] https://lore.kernel.org/lkml/20181012213926.253765-1-dianders@chromium.org/
> >
> >  .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 73 +++++++++++++++++++---
> >  1 file changed, 65 insertions(+), 8 deletions(-)
>
> One nit below, otherwise:
>
> Reviewed-by: Rob Herring <robh@kernel.org>
>
> >
> > diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> > index fbc198d5dd39..297a7c753fc8 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> > +++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> > @@ -25,7 +25,7 @@ Required properties:
> > +
> > +     phy@88eb000 {
> > +             compatible = "qcom,sdm845-qmp-usb3-uni-phy";
> > +             reg = <0x88eb000 0x18c>;
> > +             status = "disabled";
>
> Don't show status in examples.

I'll fix it. Thanks Rob.
