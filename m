From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCHv4 2/3] ARM: msm: Add support for APQ8074 Dragonboard
Date: Thu, 26 Sep 2013 16:06:52 -0500
Message-ID: <779B68F7-4E73-4B79-B85E-4E642ABC08C8@codeaurora.org>
References: <1379992406-3541-1-git-send-email-rvaswani@codeaurora.org> <1379992406-3541-2-git-send-email-rvaswani@codeaurora.org> <4E7868D6-56CB-4AF8-8EBF-069966899C23@codeaurora.org> <5243652F.7090408@codeaurora.org> <B0F416B8-042A-49F1-81E9-B217F02AAD1E@codeaurora.org> <52447779.3010908@codeaurora.org> <52448852.9050608@codeaurora.org> <50877C70-6066-4E87-9DEA-9F29D098525B@codeaurora.org> <20130926205808.GA3146@codeaurora.org>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130926205808.GA3146-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rohit Vaswani <rvaswani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Daniel Walker <dwalker-zu3NM2574RrQT0dZR+AlfA@public.gmane.org>, Bryan Huntsman <bryanh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Sep 26, 2013, at 3:58 PM, David Brown wrote:

> On Thu, Sep 26, 2013 at 02:33:53PM -0500, Kumar Gala wrote:
> 
>>> "ePAPR 1.1 section 2.2.1.1 "Node Name Requirements" specifies that any
>>> node that has a reg property must include a unit address in its name
>>> with value matching the first entry in its reg property. Conversely, if
>>> a node does not have a reg property, the node name must not include a
>>> unit address."
>>> 
>>> The soc node we have does not have a reg property ?
>> 
>> Not 100% sure what people will decide on this.  There are a number of
>> examples on the PPC side (arch/powerpc/boot/dts) that are soc@ADDR,
>> but they don't typically have "reg" properties at the soc level.
>> 
>> Let's go ahead w/o the unit address (as you have it) for now.
> 
> What is the address even supposed to mean?  Are we expecting multiple
> 'soc' nodes?


What do we consider to exist under soc in general?  I'd expect the address to be the base of the MMIO register register for on SoC devices (but that's based on my PPC history).

- k

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
