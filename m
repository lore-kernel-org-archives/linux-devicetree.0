From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: common location for devicetree files
Date: Fri, 8 Nov 2013 11:59:56 -0600
Message-ID: <5957C301-9698-45B0-BFED-749DE79D0A74@codeaurora.org>
References: <1438803E-C904-428B-B042-891978BC15DF@codeaurora.org> <20131108165255.GA32668@titan.lakedaemon.net>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131108165255.GA32668-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org list" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Nov 8, 2013, at 10:52 AM, Jason Cooper wrote:

> On Thu, Nov 07, 2013 at 05:21:58PM -0600, Kumar Gala wrote:
>> As we start having more sharing of device trees between architectures
>> (arm & arm64, arm & powerpc, guessing maybe mips & arm) we need dts to
>> live in location that 
>> 
>> I was wondering what people felt about doing:
>> 
>> 	arch/dts/<VENDOR>/
>> 
>> as a common location that could be shared.  I'm up for other
>> suggestions.
> 
> What do we really need to do before the move?  Should all arch dts files
> be able to #include from any arch?  What's the minimum churn needed to
> accomplish that?  Maybe just move the needed bits to arch/dts/include/ ?
> 
> I'm not real keen on separating by vendor.  For example, us mvebu folks
> would probably miss useful/duplicated effort in another vendor's
> subdirectory.  Which was the whole reason for moving driver code out of
> machine directories to begin with.


Can you explain that further, what would you miss from other vendors.  All the patches should still be going via devicetree ML.

- k

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
