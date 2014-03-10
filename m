From: Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 6/6] documentation: bindings: document PMIC8921/8058
 RTC
Date: Mon, 10 Mar 2014 17:11:32 -0500
Message-ID: <20140310221132.GN18529@joshc.qualcomm.com>
References: <1394477089-3996-1-git-send-email-joshc@codeaurora.org>
 <1394477089-3996-7-git-send-email-joshc@codeaurora.org>
 <CAL_JsqJe7M6i0RKWVPHbvyHbHscMtZmW-xbJuaJTePqYRKWrUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJe7M6i0RKWVPHbvyHbHscMtZmW-xbJuaJTePqYRKWrUg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 10, 2014 at 04:22:51PM -0500, Rob Herring wrote:
> On Mon, Mar 10, 2014 at 1:44 PM, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> > This RTC is found on the Qualcomm 8921 and 8058 PMICs.
> >
> > Signed-off-by: Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > ---
> >  .../devicetree/bindings/rtc/qcom,pm8xxx-rtc.txt     | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/rtc/qcom,pm8xxx-rtc.txt
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/qcom,pm8xxx-rtc.txt b/Documentation/devicetree/bindings/rtc/qcom,pm8xxx-rtc.txt
> > new file mode 100644
> > index 0000000..3eaa582
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/qcom,pm8xxx-rtc.txt
> > @@ -0,0 +1,21 @@
> > +* Real-Time Clock for Qualcomm 8058/8921 PMICs
> > +
> > +Required properties:
> > +- compatible: should be one of the following.
> > +    * "qcom,pm8058-rtc"
> > +    * "qcom,pm8921-rtc"
> > +- reg: base address of the register region
> 
> Wait a second. This is all part of an MFD device. I think this whole
> binding does not make sense on it's own. The DT should describe the
> PMIC, not necessarily some sub-component of it. Perhaps there are sub
> nodes of the PMIC node, but that would be all part of the PMIC
> binding. Having sub drivers for an MFD is really a Linux problem that
> doesn't belong in DT.

Okay, this makes sense, I can move this documentation to
Documentation/bindings/mfd/qcom,pm8xxx.txt where the PMIC binding
currently is.

Note that this does introduce a dependency on Lee Jones' mfd tree, where
DT support for the parent pm8921 driver is pending for 3.15.

Andrew, how would you prefer I proceed?  Would you like me to respin
this patch?  The whole series?  An incremental patch?

Thanks,
  Josh

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
