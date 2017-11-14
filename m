From: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8916: add bindings for i2c1,
 i2c3, i2c5
Date: Tue, 14 Nov 2017 18:13:42 -0500
Message-ID: <20171114231342.vh7xy3xbsyyb5wfn@workotop.localdomain>
References: <20171101175335.22123-1-damien.riegel@savoirfairelinux.com>
 <20171101175335.22123-5-damien.riegel@savoirfairelinux.com>
 <20171109170016.GC28761@minitux>
 <20171109171456.6t3nhig6t4bnkc77@workotop.localdomain>
 <20171111075612.GA1236@tuxbook>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171111075612.GA1236@tuxbook>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 10, 2017 at 11:56:12PM -0800, Bjorn Andersson wrote:
> On Thu 09 Nov 09:14 PST 2017, Damien Riegel wrote:
> 
> > Hi Bjorn,
> > 
> > 
> > On Thu, Nov 09, 2017 at 09:00:16AM -0800, Bjorn Andersson wrote:
> > > On Wed 01 Nov 10:53 PDT 2017, Damien Riegel wrote:
> > > 
> > > I think it's better to use the word "nodes" (add nodes...)
> > 
> > Will reword that.
> > 
> > > 
> > > > Signed-off-by: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 72 ++++++++++++++++++++++++++++++
> > > >  arch/arm64/boot/dts/qcom/msm8916.dtsi      | 45 +++++++++++++++++++
> > > >  2 files changed, 117 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
> > > > index c67ad8ed8b60..1cec5b30ed6e 100644
> > > > --- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
> > > > @@ -270,6 +270,30 @@
> > > >  		};
> > > >  	};
> > > >  
> > > > +	i2c1_default: i2c1_default {
> > > > +		pinmux {
> > > > +			function = "blsp_i2c1";
> > > > +			pins = "gpio2", "gpio3";
> > > > +		};
> > > > +		pinconf {
> > > > +			pins = "gpio2", "gpio3";
> > > > +			drive-strength = <16>;
> > > > +			bias-disable;
> > > > +		};
> > > 
> > > pinconf is typically board specific, so please leave these out from the
> > > base dtsi.
> > 
> > I don't mind dropping that, but pinconf for i2c{2,4,6} is already in
> > msm8916-pins.dtsi, so we should either drop them all, or add pinconf for
> > i2c{1,3,5} for consistency.
> 
> You're right, this needs to be consistent. So I would like us to update
> the existing nodes,
> 
> > And if I read the pinctrl driver correctly,
> > I2C cannot be routed to other pins, the only properties that users may
> > want to modify are drive-strength and bias. Let me know which option you
> > prefer.
> > 
> 
> I discussed the matter with my colleagues and we concluded that we want
> to keep the muxing in the platform.dtsi and move the specification of
> the electrical properties (pinconf) to the board.dts(i).
> 
> We did discuss having some "default values" in the platform file, but
> pushing these down to the board file gives an indication to others that
> these values are board specific.

Okay that makes sense. I'll work on a patchset to do that.

Regards,
-- 
Damien
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
