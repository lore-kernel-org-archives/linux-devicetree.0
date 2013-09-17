From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] ARM: msm: Move msm devicetrees under a Qualcomm dir
Date: Tue, 17 Sep 2013 10:52:02 -0500
Message-ID: <0618B96B-2F6C-4D67-9D32-0B74E898496F@codeaurora.org>
References: <1379003839-16068-1-git-send-email-galak@codeaurora.org> <CAOesGMisWLwYKotGDFPW6PyHJs=_+fohTdC08SGjsv2FXaa7Fg@mail.gmail.com> <25E0B143-658E-4CCC-A88A-0AF70FFF33CE@codeaurora.org> <CAOesGMhfdvyJ_2AA2e8iO_2e=q7KgpyNbcriPKFw-RLormG6bA@mail.gmail.com> <3E38F48E-EE41-4564-84A1-36CF07B08811@codeaurora.org> <20130912224737.GA24937@codeaurora.org> <9EA264FE-7621-458D-8333-9340DDBFC4EE@codeaurora.org> <52374DD1.9040209@codeaurora.org> <AEBF64D7-5359-4E37-8263-B81209620192@codeaurora.org> <CAOesGMgCvnuX918pt6vT0_QsHdfJ8b813iu2tXRHvdpL8GZ3dg@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMgCvnuX918pt6vT0_QsHdfJ8b813iu2tXRHvdpL8GZ3dg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Rohit Vaswani <rvaswani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org list" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Sep 16, 2013, at 1:50 PM, Olof Johansson wrote:

> On Mon, Sep 16, 2013 at 11:46 AM, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> 
>> I think the two options are either:
>> 
>> qcom-msm*, qcom-apq*, etc
>> 
>> or
>> 
>> qcom/msm-*, qcom/apq*, etc
>> 
>> I'm guessing we'll end up without the dir and in the future have:
>> 
>> qcom/qcom-msm-*, qcom/qcom-apq-*
>> 
>> Olof???
> 
> 
> When you create the dir, you can go from qcom-msm-* to qcom/msm-*, but
> still produce qcom-msm-*.dtb as the build output. We care about
> keeping the DTB name stable, not DTS. As long as they just conform to
> those two patterns it's easy to handle through makefile targets.

Sounds good, Rohit let's go ahead with qcom-msm-*, qcom-apq-*.

- k
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
