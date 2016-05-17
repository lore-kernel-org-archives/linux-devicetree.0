From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] arm64: dts: NS2: Add all of the UARTs
Date: Tue, 17 May 2016 12:56:15 -0700
Message-ID: <573B775F.4060503@gmail.com>
References: <1463007369-13071-1-git-send-email-jonmason@broadcom.com>
 <57341FCE.6050403@huawei.com>
 <CAC3K-4qbkt3DCgd6qurNo3V+++x70bbFC--aunR0DbCTBvBNZg@mail.gmail.com>
 <57353761.5020409@huawei.com>
 <CAC3K-4oXcwR--879sCFR=MCG1Uman7DoGvaHLVXWr+0QH2WeJg@mail.gmail.com>
 <57391E45.8010209@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57391E45.8010209-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/15/2016 06:11 PM, Kefeng Wang wrote:
>> I can confirm that with your change and the change to the bootargs you describe above, it works as desired.  Was your change already accepted?
>>
> 
> Great, thanks a lot. it is still being reviewing for now and waiting for response for now.

Then I would be inclined to take Jon's patch as-is, and follow up with
an additional patch to the NS2 DTS once yours lands in.
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
