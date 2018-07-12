From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v6 3/7] dt: qcom: 8996: thermal: Move to DT initialisation
Date: Thu, 12 Jul 2018 10:33:43 +0530
Message-ID: <CAP245DUrfURnyWs_zts9ks85SxMMdzLUfzQ2Wq4wcan0aaB+wQ@mail.gmail.com>
References: <cover.1531135999.git.amit.kucheria@linaro.org>
 <ee06e59ae84a9b9013480c58bd4678e44d201a42.1531135999.git.amit.kucheria@linaro.org>
 <CAD=FV=X3B3wKv3jNLM8f9YvdRNkp6CNF1JmE+bMTBnR4CMvyww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAD=FV=X3B3wKv3jNLM8f9YvdRNkp6CNF1JmE+bMTBnR4CMvyww@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, smohanad@codeaurora.org, Eduardo Valentin <edubezval@gmail.com>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, Lists LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 12, 2018 at 12:09 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Jul 9, 2018 at 4:43 AM, Amit Kucheria <amit.kucheria@linaro.org> wrote:
> > We also split up the regmap address space into two, one for the TM
> > registers, the other for the SROT registers. This was required to deal with
> > different address offsets for the TM and SROT registers across different
> > SoC families.
>
> The splitting into two regions is actually optional and that should
> probably be mentioned in the commit message.

On the contrary, after this refactor, all new platforms with the
v2.x.y TSENS IP should use two regions. The only reason for patch 2 is
that we're stuck with supporting old 8996/8916 DTs. I'd prefer to
phase out support for the old DTs if possible. I don't want to
encourage any new bindings with a single address space.

> > Since tsens-common.c/init_common() currently only registers one address
> > space, the order is important (TM before SROT). This is OK since the code
> > doesn't really use the SROT functionality yet.
>
> Nowhere in the commit message does this say you're also adding a 2nd
> block of thermal sensors.  It seems like you should say that
> somewhere.
>
> ...and it should also be obvious in ${SUBJECT}.

Fixed.

> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8996.dtsi | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > index 8c7f9ca..6c8a857 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > @@ -461,7 +461,17 @@
> >
> >                 tsens0: thermal-sensor@4a8000 {
> >                         compatible = "qcom,msm8996-tsens";
> > -                       reg = <0x4a8000 0x2000>;
> > +                       reg = <0x4a9000 0x1000>, /* TM */
> > +                             <0x4a8000 0x1000>; /* SROT */
>
> Note that the unit address is supposed to match the first "reg"
> address, so either these should be reversed or you should update your
> node name.  AKA your node name should be this now:
>
> tsens0: thermal-sensor@4a9000

Fixed.

>
> > +                       #qcom,sensors = <13>;
>
> As per my responses to other patches, " #qcom,sensors" is undocumented
> and doesn't appear to be read by the driver.

This feature was merged earlier. See commit 6d7c70d1cd6526 (thermal:
qcom: tsens: Allow number of sensors to come from DT)

Regards,
Amit
