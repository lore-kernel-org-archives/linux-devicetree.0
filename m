From: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] ARM: msm: Move msm devicetrees under a Qualcomm dir
Date: Thu, 12 Sep 2013 15:47:37 -0700
Message-ID: <20130912224737.GA24937@codeaurora.org>
References: <1379003839-16068-1-git-send-email-galak@codeaurora.org>
 <CAOesGMisWLwYKotGDFPW6PyHJs=_+fohTdC08SGjsv2FXaa7Fg@mail.gmail.com>
 <25E0B143-658E-4CCC-A88A-0AF70FFF33CE@codeaurora.org>
 <CAOesGMhfdvyJ_2AA2e8iO_2e=q7KgpyNbcriPKFw-RLormG6bA@mail.gmail.com>
 <3E38F48E-EE41-4564-84A1-36CF07B08811@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3E38F48E-EE41-4564-84A1-36CF07B08811-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org list" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rohit Vaswani <rvaswani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 12, 2013 at 12:55:36PM -0500, Kumar Gala wrote:
>
>On Sep 12, 2013, at 12:06 PM, Olof Johansson wrote:

>> My original request to please use a common prefix for your product
>> families stands. Please prefix with msm-*, or if you have to, qcom-*
>> instead, since you guys can't seem to make your mind up on standard
>> prefixes (msm, apq, etc).
>
>This is silly, I dont see the reason to go with
>qcom-apq<SOC>-<BOARD>.dts and than in the future drop qcom- when we
>mostly likely shift to a dir structure.  As engineers we are all too
>aware of the lack of sanity in marketing names, but its what we have
>so we have to live with it.

At least what we'd decided a year or two ago was to call _everything_
with an msm* prefix.  If marketing comes up with cute prefixes for
things, we would basically ignore them.  So, under that, it should be
an msm8074-dragonboard.  Admittedly, it might be a little confusing
with the name of the product having the apq in it, but as others have
pointed out, I think there is less confusing than not having a common
prefix on our MSM products.

At least so far, there are no chips where apq vs msm actually
distinguishes anything.  In fact, a simple "decoder ring" would point
out that the 'apq' usually corresponds with the second digit being a
zero.  It doesn't help that we've added an 'mpq' prefix as well.

I don't really see how to satisfy all of this other than qcom-apq*, or
just continue to use msm*.

David

-- 
sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
