From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [PATCH v7 1/3] mfd: devicetree: bindings: Add Qualcomm RPM DT
 binding
Date: Wed, 24 Sep 2014 08:53:20 -0700
Message-ID: <20140924155319.GA28481@sonymobile.com>
References: <1411428329-23172-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1411428329-23172-2-git-send-email-bjorn.andersson@sonymobile.com>
 <20140924082228.GF17801@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140924082228.GF17801@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed 24 Sep 01:22 PDT 2014, Lee Jones wrote:

> On Mon, 22 Sep 2014, Bjorn Andersson wrote:
> 
> > Add binding for the Qualcomm Resource Power Manager (RPM) found in 8660,
> > 8960 and 8064 based devices. The binding currently describes the rpm
> > itself and the regulator subnodes.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/mfd/qcom-rpm.txt |  246 ++++++++++++++++++++
> 
> Please adhere to: Documentation/devicetree/bindings/submitting-patches.txt
> 

I assume you mean this part:

  1) The Documentation/ portion of the patch should be a separate patch.

But I doubt this document was written with include/dt-bindings in mind, because
in my eyes they are part of "device tree bindings".

> >  include/dt-bindings/mfd/qcom-rpm.h                 |  154 ++++++++++++
> >  2 files changed, 400 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/qcom-rpm.txt
> >  create mode 100644 include/dt-bindings/mfd/qcom-rpm.h
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/qcom-rpm.txt b/Documentation/devicetree/bindings/mfd/qcom-rpm.txt
> > new file mode 100644
> > index 0000000..4264021
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/qcom-rpm.txt
> 
> This requires a DT Ack.
> 
> [...]
> 
> > +++ b/include/dt-bindings/mfd/qcom-rpm.h
> 
> Please split this into a separate patch.
> 

But this is part of the device tree binding and the binding "depends" on it.

> When you do, for this file only, please apply my:
> 
>   Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 

Thanks,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
