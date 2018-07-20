From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] phy: qcom-qmp: Fix dts bindings to reflect reality
Date: Fri, 20 Jul 2018 11:26:55 -0600
Message-ID: <CAL_JsqKZUB3P_Z_pRG-Udx0wgWtSjzgF=Rc3t8Xf2n2uZkV3Qw@mail.gmail.com>
References: <20180706233142.166296-1-dianders@chromium.org>
 <20180720141059.GA3064@rob-hp-laptop> <CAD=FV=WzjZBYV+yjekC-GGgjyWNbdGX=ZwesQMQhiYHZLyzhzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=WzjZBYV+yjekC-GGgjyWNbdGX=ZwesQMQhiYHZLyzhzA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Manu Gautam <mgautam@codeaurora.org>, Varadarajan Narayanan <varada@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 20, 2018 at 9:13 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Rob,
>
> On Fri, Jul 20, 2018 at 7:10 AM, Rob Herring <robh@kernel.org> wrote:
> > On Fri, Jul 06, 2018 at 04:31:42PM -0700, Douglas Anderson wrote:
> >> A few patches have landed for the qcom-qmp PHY that affect how you
> >> would write a device tree node.  ...yet the bindings weren't updated.
> >> Let's remedy the situation and make the bindings refelect reality.
> >
> > "dt-bindings: phy: ..." for the subject.
>
> Sorry.  Every subsystem has different conventions for this so I
> usually just do a "git log" on the file and make my best guess.  I'll
> try to remember this for next time though.

NP. I'd like to add this info to MAINTAINERS or maybe a git commit
hook could figure this out automagically.

> In this case, though, it looks like this already landed.  I see this
> patch in Kishon's next branch.
>
>
> >> Fixes: efb05a50c956 ("phy: qcom-qmp: Add support for QMP V3 USB3 PHY")
> >> Fixes: ac0d239936bd ("phy: qcom-qmp: Add support for runtime PM")
> >> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >> ---
> >>
> >>  .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 14 ++++++++++++--
> >>  1 file changed, 12 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> >> index 266a1bb8bb6e..0c7629e88bf3 100644
> >> --- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> >> +++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> >> @@ -12,7 +12,14 @@ Required properties:
> >>              "qcom,sdm845-qmp-usb3-phy" for USB3 QMP V3 phy on sdm845,
> >>              "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on sdm845.
> >>
> >> - - reg: offset and length of register set for PHY's common serdes block.
> >> + - reg:
> >> +   - For "qcom,sdm845-qmp-usb3-phy":
> >> +     - index 0: address and length of register set for PHY's common serdes
> >> +       block.
> >> +     - named register "dp_com" (using reg-names): address and length of the
> >> +       DP_COM control block.
> >
> > You need to list reg-names and what are the names for the other 2
> > regions?
>
> Here's the code works.  You can tell me how you want this expressed in
> the bindings:
>
> * In all cases the driver maps its main memory range (for the common
> serdes block) without specifying any name.  This is equivalent to
> asking for index 0.
>
> * For "qcom,sdm845-qmp-usb3-phy" the driver requests a second memory
> range by name using the name "dp_com".
>
> ...basically the driver is inconsistent between using names and
> indices and I was trying to document that fact.

That's fine as long as the indices are fixed.

>
> I guess options:
>
> 1. I could reword this so it's clearer (open to suggestions)
>
> 2. I could add something to the bindings saying that the first reg
> name should be "reg-base" or something.  Then the question is whether
> we should go to the code and start enforcing that.  If we do choose to
> enforce it then it's technically breaking compatibility (though I
> doubt there is any real dts in the wild).  If we don't choose to
> enforce it then why did we bother saying what it should be named?

I think you need to state index 1 is dp_com (and only for
"qcom,sdm845-qmp-usb3-phy") and a name for index 0. 'reg-base' doesn't
seem great, but I don't have another suggestion.

For the driver, it's not the driver's job to enforce any of this.

Rob
