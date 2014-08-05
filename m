From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/4] pinctrl: qpnp: Qualcomm PMIC pin controller
 driver
Date: Tue, 05 Aug 2014 14:55:18 +0300
Message-ID: <1407239718.2475.76.camel@iivanov-dev>
References: <1405610748-7583-1-git-send-email-iivanov@mm-sol.com>
	  <1405610748-7583-3-git-send-email-iivanov@mm-sol.com>
	  <53D307BB.1020208@codeaurora.org> <1406536774.2475.36.camel@iivanov-dev>
	 <53E0350C.4020003@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53E0350C.4020003-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: David Collins <collinsd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2014-08-04 at 18:36 -0700, Stephen Boyd wrote:
> On 07/28/14 01:39, Ivan T. Ivanov wrote:
> > I am working on proposal from Stephen Boyd to encode GPIO/MPP mode and 
> > source select into combined function. Something like this one:
> >
> > #define PM8XXX_DIGITAL_IN		0
> > #define PM8XXX_DIGITAL_OUT		1
> > #define PM8XXX_DIGITAL_IN_OUT		2
> >
> > ...
> >
> > /* mode and source select */
> > #define PM8XXX_FUNCTION(m,s)		((m) << 16 | (s))
> >
> > #define PM8921_GPIO1_14_KYPD_SNS	PM8XXX_FUNCTION(PM8XXX_DIGITAL_IN, 1)
> > #define PM8921_GPIO9_14_KYPD_DRV	PM8XXX_FUNCTION(PM8XXX_DIGITAL_OUT, 1)
> > #define PM8921_GPIO33_35_PWM		PM8XXX_FUNCTION(PM8XXX_DIGITAL_OUT, 3)
> >
> > ..
> >
> >
> 
> This isn't what I was suggesting at all. The function should be
> something like KYPD, PWM and those should just be defined to be 1 or 3.
> The mode should be some other property like input or output, and the
> driver should or the two together and put it into the register.

Well, we can do this. I was just thought that will more convenient if
function is fully described in to one property.

Regards,
Ivan


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
