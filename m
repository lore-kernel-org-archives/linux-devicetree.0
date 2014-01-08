From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 3/9] devicetree: bindings: Document qcom,saw2 node
Date: Wed, 8 Jan 2014 15:21:54 +0000
Message-ID: <20140108152154.GE11753@e106331-lin.cambridge.arm.com>
References: <1387845593-10050-1-git-send-email-sboyd@codeaurora.org>
 <1387845593-10050-4-git-send-email-sboyd@codeaurora.org>
 <20140108143626.GB11753@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140108143626.GB11753@e106331-lin.cambridge.arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, David Brown <davidb@codeaurora.org>, Rohit Vaswani <rvaswani@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 08, 2014 at 02:36:26PM +0000, Mark Rutland wrote:
> On Tue, Dec 24, 2013 at 12:39:47AM +0000, Stephen Boyd wrote:
> > The saw2 binding describes the SPM/AVS wrapper hardware used to
> > control the regulator supplying voltage to the Krait CPUs.
> > 
> > Cc: <devicetree@vger.kernel.org>
> > Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> > ---
> >  .../devicetree/bindings/arm/msm/qcom,saw2.txt      | 35 ++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt b/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
> > new file mode 100644
> > index 0000000..1505fb8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
> > @@ -0,0 +1,35 @@
> > +SPM AVS Wrapper 2 (SAW2)
> > +
> > +The SAW2 is a wrapper around the Subsystem Power Manager (SPM) and the
> > +Adaptive Voltage Scaling (AVS) hardware. The SPM is a programmable
> > +micro-controller that transitions a piece of hardware (like a processor or
> > +subsystem) into and out of low power modes via a direct connection to
> > +the PMIC. It can also be wired up to interact with other processors in the
> > +system, notifying them when a low power state is entered or exited.
> > +
> > +PROPERTIES
> > +
> > +- compatible:
> > +	Usage: required
> > +	Value type: <string>
> > +	Definition: shall contain "qcom,saw2". A more specific value should be
> > +		    one of:
> > +			 "qcom,saw2-v1"
> > +			 "qcom,saw2-v1.1"
> > +			 "qcom,saw2-v2"
> > +			 "qcom,saw2-v2.1"
> > +
> > +- reg:
> > +	Usage: required
> > +	Value type: <prop-encoded-array>
> > +	Definition: the first element specifies the base address and size of
> > +		    the register region. An optional second element specifies
> > +		    the base address and size of the alias register region.
> > +
> > +
> > +Example:
> > +
> > +	regulator@2099000 {
> > +		compatible = "qcom,saw2";
> > +		reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
> > +	};
> 
> I have the same general worry as with the ACC regarding the implicit
> relationship between CPUs and the registers controlling them, but I
> assume that's fine for current implementations, and the binding's so
> simple there's nothing preventing future extension.

Having looked at the dts files I see each CPU has its own SAW phandle,
so the above comments are irrelevant.

Thanks,
Mark.
