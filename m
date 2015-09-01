From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [PATCH 1/4] dt-binding: gpio: Add Qualcomm SMSM device tree
 documentation
Date: Tue, 1 Sep 2015 14:50:29 -0700
Message-ID: <20150901215029.GK13472@usrtlx11787.corpusers.net>
References: <1440697078-4106-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1440697078-4106-2-git-send-email-bjorn.andersson@sonymobile.com>
 <55E55F70.5050703@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55E55F70.5050703-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue 01 Sep 01:18 PDT 2015, Stanimir Varbanov wrote:

> On 08/27/2015 08:37 PM, Bjorn Andersson wrote:
> > This documents a device tree binding for exposing the Qualcomm Shared
> > Memory State Machine as a set of gpio- and interrupt-controllers.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> > ---
> >  .../devicetree/bindings/gpio/qcom,smsm.txt         | 114 +++++++++++++++++++++
> 
> <snip>
> 
> > += EXAMPLE
> > +The following example shows the SMEM setup for controlling properties of the
> > +wireless processor, defined from the 8974 apps processor's point-of-view. It
> > +encompasses one outbound entry and the outgoing interrupt for the wireless
> > +processor.
> > +
> > +smsm {
> > +	compatible = "qcom,smsm";
> > +
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	qcom,ipc-3 = <&apcs 8 19>;
> 
> Can we use something more descriptive here, for example
> 
> qcom,ipc-rpm = <&apcs 8 19>;

Not really, because in the view of smsm we don't now which host the rpm
would represent. But most likely 3 would mean WCNSS, per the enum in
caf.

> 
> and replace these magic numbers with defines?
> 

I don't know what those defines would be named, what you have here is
bit 19 in the 8th byte - straight from the register documentation.

> > +
> > +	apps_smsm: apps@0 {
> > +		reg = <0>;
> > +
> > +		gpio-controller;
> > +		#gpio-cells = <2>;
> > +	};
> > +
> > +	wcnss_smsm: wcnss@7 {
> > +		reg = <7>;
> > +		interrupts = <0 144 1>;
> > +
> > +		interrupt-controller;
> > +		#interrupt-cells = <2>;
> > +	};
> > +};

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
