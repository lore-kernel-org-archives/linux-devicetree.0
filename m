From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v5 2/4] devicetree: bindings: Document Krait CPU/L1 EDAC
Date: Tue, 11 Mar 2014 14:03:50 -0700
Message-ID: <20140311210350.GF9985@codeaurora.org>
References: <20140116180505.GA30925@codeaurora.org>
 <20140116183326.GG25540@e102568-lin.cambridge.arm.com>
 <20140116192617.GA13785@codeaurora.org>
 <20140117102109.GA22544@e102568-lin.cambridge.arm.com>
 <20140219002043.GE14769@codeaurora.org>
 <20140225111655.GA6855@e102568-lin.cambridge.arm.com>
 <E34E6789-03BC-452C-9053-82CA1D027861@codeaurora.org>
 <20140226120103.GA25326@e102568-lin.cambridge.arm.com>
 <20140307230856.GE9985@codeaurora.org>
 <20140311180150.GD25796@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140311180150.GD25796-7AyDDHkRsp3ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/11, Lorenzo Pieralisi wrote:
> On Fri, Mar 07, 2014 at 11:08:56PM +0000, Stephen Boyd wrote:
> > 
> > Or should we be expressing the L1 cache as well? Something like:
> > 
> >         cpus {  
> >                 #address-cells = <1>;
> >                 #size-cells = <0>;
> > 
> >                 cpu@0 { 
> >                         compatible = "qcom,krait";
> >                         device_type = "cpu";
> >                         reg = <0>;
> >                         next-level-cache = <&L1_0>;
> > 
> > 			L1_0: l1-cache {
> > 				compatible = "arm,arch-cache";
> > 				interrupts = <1 14 0x304>;
> > 				next-level-cache = <&L2>;
> > 			}
> >                 };
> > 
> >                 cpu@1 { 
> >                         compatible = "qcom,krait";
> >                         device_type = "cpu";
> >                         reg = <1>;
> >                         next-level-cache = <&L1_1>;
> > 
> > 			L1_1: l1-cache {
> > 				compatible = "arm,arch-cache";
> > 				interrupts = <1 14 0x304>;
> > 				next-level-cache = <&L2>;
> > 			}
> >                 };
> > 
> >                 L2: l2-cache {
> >                         compatible = "arm,arch-cache";
> >                         interrupts = <0 2 0x4>;
> > 		};
> > 	};
> > 
> > (I'm also wondering if the 3rd cell of the interrupt binding
> > should only indicate the CPU that the interrupt property is
> > inside?)
> 
> I am not aware of interrupts associated with vanilla :) "arm,arch-cache"
> objects, so I think that should be handled as a "qcom,krait" specific property
> (in the cpu node), or you should add another cache binding (compatible) for
> that.
> 
> As you might have noticed (idle states thread) I am keen on defining objects
> for L1 caches explicitly, that patch still requires an ACK though (and
> you need to update it since you cannot add an interrupt property for all
> "arm,arch-cache" objects. I am sorry for being a pain, but I do not
> think that's correct from a HW description standpoint).
> 

Ok. s/arm,arch-cache/qcom,arch-cache/ then. I imagine it is easy
enough to add some bits in the cache binding once it's accepted.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
