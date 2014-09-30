From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [PATCH v7 3/3] regulator: qcom-rpm: Regulator driver for the
 Qualcomm RPM
Date: Tue, 30 Sep 2014 08:33:54 -0700
Message-ID: <20140930153353.GO28481@sonymobile.com>
References: <1411428329-23172-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1411428329-23172-4-git-send-email-bjorn.andersson@sonymobile.com>
 <20140924083518.GB4015@sirena.org.uk>
 <4437DA50-D8BC-4E78-821C-41440A08B9A9@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4437DA50-D8BC-4E78-821C-41440A08B9A9-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed 24 Sep 06:50 PDT 2014, Kumar Gala wrote:

> 
> On Sep 24, 2014, at 3:35 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> 
> > On Mon, Sep 22, 2014 at 04:25:29PM -0700, Bjorn Andersson wrote:
> >> Driver for regulators exposed by the Resource Power Manager (RPM) found
> >> in Qualcomm 8660, 8960 and 8064 based devices.
> > 
> > Applied, thanks.

Thanks Mark, sorry for sending this to you so many times.  I'll keep the smd
rpm regulator separate from the smd series (after the RFC) to reduce the
traffic.

> 
> Mark, can you drop this until we see at least an RFC patch for the RPM
> support for b-family SoCs (8074, 8084, etc) chips.  The regulator could
> should either be the same or highly similar for b-family, but until we see
> the core RPM driver on the b-family SoCs we will not know that.
> 

As you can see in the smd rpm regulator driver, the protocol for regulator
updates are completely different in the two cases.  I'm not sure about msm_bus,
but the clocks implementation is equivalent, so there's some room for re-use.

So I think we're good here.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
