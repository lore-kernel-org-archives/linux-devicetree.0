From: Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [PATCH] mfd: qcom-spmi-pmic: Add support for more chips versions
Date: Tue, 11 Nov 2014 12:27:08 -0800
Message-ID: <20141111202708.GA13013@sonymobile.com>
References: <1415108003-16387-1-git-send-email-iivanov@mm-sol.com>
 <CAJAp7OgU64=KCuDhYEZTYppVeBz6wKvTDsof5vDRznfdZgAfZw@mail.gmail.com>
 <1415212271.14949.1.camel@mm-sol.com>
 <CAJAp7OgXHGWQj7MWh51LTUdmZpgZc=6m=o-Az=z8QxR7yfrw7g@mail.gmail.com>
 <1415260480.13103.3.camel@mm-sol.com>
 <CAJAp7OgPGhM=EnMNU2JfjG6Qb-EiWSPSRyZWGicSPmpicBQW7g@mail.gmail.com>
 <1415374390.26058.1.camel@mm-sol.com>
 <1415374852.26058.3.camel@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415374852.26058.3.camel-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Cc: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 07, 2014 at 04:40:52PM +0100, Ivan T. Ivanov wrote:
> On Fri, 2014-11-07 at 17:33 +0200, Ivan T. Ivanov wrote:
> > On Thu, 2014-11-06 at 08:55 -0800, Bjorn Andersson wrote:
> > > On Wed, Nov 5, 2014 at 11:54 PM, Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org> wrote:
> > > > On Wed, 2014-11-05 at 17:36 -0800, Bjorn Andersson wrote:
[...]
> > > > > Could you be a little bit more elaborate on what you're trying to do
> > > > > and which child devices that might be?
> > > > 
> > > > For example ADC drivers are required temperature compensation based
> > > > on PMIC variant and chip manufacturer.
> > > > 
> > > 
> > > I see, is that compensation of any practical value? Or is the
> > > compensation of academic proportions?
> > 
> > It depends of what you mean by academic :-). Attached file have test
> > application which dump difference between non compensated and compensated
> > values for different temperature, manufacture and input value.
> > 
[...]
> Forgot to add. PMIC subtype and version are used also in charger and BMS
> drivers to workaround hardware issues.

All of the blocks on the PM8x41 series have their own version numbers.
There's no need to look at the chip revision.

In fact, the SMBB (charger) documentation (80-NA555-12) specifically
refers to the SMBB_MISC block revision registers as the method for
determining the hardware version.  The "qpnp-charger" SMBB driver in the
CAF 3.4 & 3.10 trees utilizes block specific revision numbers, as do the
"qpnp-bms" BMS driver, the "qpnp-adc-current" IADC driver, and the
"qpnp-adc-voltage" VADC driver.

The revision of the PMIC itself should be completely irrelevant to any
of the software interfacing with it.

-Courtney
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
