From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/3] Add initial DT support for Qualcomm SPMI PMIC
 devices
Date: Thu, 26 Feb 2015 18:25:57 +0200
Message-ID: <1424967957.2340.30.camel@mm-sol.com>
References: <1422965880-11047-1-git-send-email-iivanov@mm-sol.com>
	 <54E6848C.1090405@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54E6848C.1090405-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Hi Stephan, 

Sorry for delayed answer.

On Thu, 2015-02-19 at 16:49 -0800, Stephen Boyd wrote:
> On 02/03/15 04:17, Ivan T. Ivanov wrote:
> > Following set of patches add initial DT support for PMIC devices
> > found on recent Quqalcomm chipsets. Details for SPMI bus and PMIC arbiter
> > could be found here [1].
> 
> Can you please put the specific compatible strings for the pmic model
> into the nodes in addition to the generic "qcom,spmi-pmic"? We may want
> to have regmap config tables in the future that describe the
> cache/read/write abilities of the regsiters. If all we have is the
> generic binding then we don't have a way to populate these tables.
> Unless the plan there is to use the revid registers?
> 

I would really like that we can use "revid" registers, but I don't know... 

>From what I can see usually in one physical PMIC chip they
are 2 USID devices.

I can successfully discover following USID's on APQ8074 boards:

pmic-spmi 0-00: qcom,pm8941-v1.0 detected
pmic-spmi 0-01: qcom,pm8941-v1.0 detected
pmic-spmi 0-04: qcom,pm8841-v0.0 detected
pmic-spmi 0-05: qcom,pm8841-v0.0 detected

Unfortunately on PM8916 only one device is detected, with USID 0.
But they should be two, judging by downstream DTS files, right?

pmic-spmi 0-00: qcom,pm8916-v0.0 detected 
pmic-spmi 0-01: unknown device

For communication with PM8916 I am using recent patches from Gilad [1].
Maybe there are still some issues with these patches, which can cause
this behavior or PM8916 just didn't have these registers for USID 1?

Regards,
Ivan 

[1] https://lkml.org/lkml/2015/2/19/453

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
