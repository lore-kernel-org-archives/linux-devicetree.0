From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: devicetree: bindings: Add Qualcomm SMD based
 RPM DT binding
Date: Tue, 12 May 2015 11:35:55 -0700
Message-ID: <20150512183555.GB23554@sonymobile.com>
References: <1428962282-32430-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1428962282-32430-2-git-send-email-bjorn.andersson@sonymobile.com>
 <5552435E.4040407@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5552435E.4040407-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue 12 May 11:15 PDT 2015, Stephen Boyd wrote:

> On 04/13/15 14:58, Bjorn Andersson wrote:
> > +
> > +== Regulators
> > +
> > +Regulator nodes are identified by their compatible:
> > +
> > +- compatible:
> > +	Usage: required
> > +	Value type: <string>
> > +	Definition: must be one of:
> > +		    "qcom,rpm-pm8841-regulators"
> > +		    "qcom,rpm-pm8941-regulators"
> > +
> > +- vdd_s1-supply:
> > +- vdd_s2-supply:
> > +- vdd_s3-supply:
> > +- vdd_s4-supply:
> > +- vdd_s5-supply:
> > +- vdd_s6-supply:
> > +- vdd_s7-supply:
> > +- vdd_s8-supply:
> > +	Usage: optional (pm8841 only)
> > +	Value type: <phandle>
> > +	Definition: reference to regulator supplying the input pin, as
> > +		    described in the data sheet
> > +
> > +- vdd_s1-supply:
> > +- vdd_s2-supply:
> > +- vdd_s3-supply:
> > +- vdd_l1_l3-supply:
> > +- vdd_l2_lvs1_2_3-supply:
> > +- vdd_l1_l3-supply:
> > +- vdd_l4_l11-supply:
> > +- vdd_l5_l7-supply:
> > +- vdd_l6_l12_l14_l15-supply:
> > +- vdd_l5_l7-supply:
> > +- vdd_l8_l16_l18_l19-supply:
> > +- vdd_l9_l10_l17_l22-supply:
> > +- vdd_l9_l10_l17_l22-supply:
> > +- vdd_l4_l11-supply:
> > +- vdd_l6_l12_l14_l15-supply:
> > +- vdd_l13_l20_l23_l24-supply:
> > +- vdd_l6_l12_l14_l15-supply:
> > +- vdd_l6_l12_l14_l15-supply:
> > +- vdd_l8_l16_l18_l19-supply:
> > +- vdd_l9_l10_l17_l22-supply:
> > +- vdd_l8_l16_l18_l19-supply:
> > +- vdd_l8_l16_l18_l19-supply:
> > +- vdd_l13_l20_l23_l24-supply:
> > +- vdd_l21-supply:
> > +- vdd_l9_l10_l17_l22-supply:
> > +- vdd_l13_l20_l23_l24-supply:
> > +- vdd_l13_l20_l23_l24-supply:
> > +- vdd_l2_lvs1_2_3-supply:
> > +- vdd_l2_lvs1_2_3-supply:
> > +- vdd_l2_lvs1_2_3-supply:
> > +- vin_5vs-supply:
> > +- vin_5vs-supply:
> 
> Can you remove the duplicates here please?
> 

Yes of course, sorry about missing the "!uniq" pass...

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
