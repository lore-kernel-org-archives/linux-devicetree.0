From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v6 7/7] arm64: dts: sdm845: Add tsens nodes
Date: Thu, 12 Jul 2018 11:06:04 +0530
Message-ID: <CAP245DV1sYDFHekvVmYq-4vuorO6zSQTz8gPHwfCEPzPyVKPTw@mail.gmail.com>
References: <cover.1531135999.git.amit.kucheria@linaro.org>
 <65c39c405076627bd43ec94c211c6998191b9f16.1531136000.git.amit.kucheria@linaro.org>
 <CAD=FV=XpfJyd8hUT45+J=EVY1Bs28Mk7m2TBJy8J=HO63n2_qw@mail.gmail.com>
 <20180711215129.GT129942@google.com>
 <CAD=FV=VCxpaF1t5Q-5Vv+9VH1igWoER59OMJmXZdEj3V6fOZwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAD=FV=VCxpaF1t5Q-5Vv+9VH1igWoER59OMJmXZdEj3V6fOZwQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Doug Anderson <dianders@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, David Brown <david.brown@linaro.org>, mka@chromium.org, Lists LAKML <linux-arm-kernel@lists.infradead.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Andy Gross <andy.gross@linaro.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, smohanad@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 12, 2018 at 3:30 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi Matthias,
>
> On Wed, Jul 11, 2018 at 2:51 PM, Matthias Kaehlcke <mka@chromium.org> wrote:
> > On Wed, Jul 11, 2018 at 11:44:13AM -0700, Doug Anderson wrote:
> >> Hi,
> >>
> >> On Mon, Jul 9, 2018 at 4:43 AM, Amit Kucheria <amit.kucheria@linaro.org> wrote:
> >> > SDM845 has two tsens blocks, one with 13 sensors and the other with 8
> >> > sensors. It uses version 2 of the TSENS IP, so use the fallback property to
> >> > allow more common code.
> >> >
> >> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> >> > ---
> >> >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 16 ++++++++++++++++
> >> >  1 file changed, 16 insertions(+)
> >> >
> >> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> >> > index cdaabeb..ba2899c 100644
> >> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> >> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> >> > @@ -221,6 +221,22 @@
> >> >                         #interrupt-cells = <2>;
> >> >                 };
> >> >
> >> > +               tsens0: tsens@c263000 {
> >>
> >> As per my comments in the bindings, nit that this should probably be
> >> "thermal-sensor" not "tsens", AKA:
> >>
> >> tsens0: thermal-sensor@c263000 {

Fixed.

> >> > +                       compatible = "qcom,sdm845-tsens", "qcom,tsens-v2";
> >> > +                       reg = <0xc263000 0x1ff>, /* TM */
> >> > +                             <0xc222000 0x1ff>; /* SROT */
> >> > +                       #qcom,sensors = <13>;
> >>
> >> As per my comment in the bindings and the code, I'm confused about the
> >> whole "#qcom,sensors" bit.  It's not documented and doesn't seem
> >> hooked up in the code either.
> >>
> >> ...but if people have tested this, perhaps I'm confused.  How can
> >> things work if num_sensors is 0???
> >
> > The mystery is resolved by:
> >
> > commit 6d7c70d1cd6526dc79e3d3b3faae1c40c1681168
> > Author: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Date:   Mon May 7 16:53:39 2018 -0700
> >
> >     thermal: qcom: tsens: Allow number of sensors to come from DT
> >
> >     For platforms that has multiple copies of the TSENS hardware block it's
> >     necessary to be able to specify the number of sensors per block in DeviceTree.
> >
> >     Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >     Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>
> >     Reviewed-by: Rob Herring <robh@kernel.org>
> >     Signed-off-by: Eduardo Valentin <edubezval@gmail.com>
> >
> >
> > I bumped into this during testing ;-)

I think this was merged in 4.17, so you didn't see it in your tree :-)

> Ah, now it makes sense to me!  Serves me right for assuming it would
> be in the same series and not checking if it was something that had
> already landed.  Thanks.  Please ignore the parts of my comments
> related to the "#qcom,sensors" property.  I guess Rob must have
> thought that the "#" in the name was fine and he's the one in charge
> not me.

Thanks for your review, Doug. I'll test this and post a v7 today. I'd
really like to get this accepted for 4.19 so I can post interrupt
support and some more cleanups.

Regards,
Amit
