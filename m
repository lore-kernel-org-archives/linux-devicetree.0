From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 0/3] mailbox: arm: introduce smc
 triggered mailbox
Date: Thu, 17 Aug 2017 10:57:54 +0100
Message-ID: <a1faf9ae-f5f9-68d0-551f-73c4edd11e16@arm.com>
References: <1500852206-28771-1-git-send-email-andre.przywara@arm.com>
 <ffabbe33-5edd-4642-6038-5b48c87ad372@suse.de>
Reply-To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDNZNK75ZIKRBMGR2XGAKGQEQSNSB2Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <ffabbe33-5edd-4642-6038-5b48c87ad372-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-GB
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

(sorry for the delay, cleaning up my inbox after holidays)

On 01/08/17 11:50, Alexander Graf wrote:
> Hi Andre,
> 
> On 24.07.17 01:23, Andre Przywara wrote:
>> This is a reworked version of my previous post. It addresses Jassi's
>> comments on the driver and also tries to cover Rob's and Mark's comments
>> on the binding documentation.
>> I dropped the more example-like DT changes from v1, as they are actually
>> not meant to be merged into the Linux tree, but instead are provided as
>> part of some firmware actually implementing this functionality.
>>
>> Please let me know what you think.
> 
> Could you please quickly explain what it would take to provide SCMI on
> top of this instead of SCPI?

On the Linux side basically nothing, that's actually the beauty of this
approach. This driver here is just a Linux mailbox interface provider.
And both SCMI and SCPI rely on one.
So all you would need to do is to provide compliant services on the
firmware side and add the proper nodes to the DT. Whether this is SCMI
or SCPI does not really make much of a difference, apart from the yet
missing upstream Linux support for SCMI, of course.

Cheers,
Andre.

> https://lkml.org/lkml/2017/6/7/624
> 
> I can certainly see that SCPI is an easier target because it's already
> upstream and widely spread. But wouldn't it make sense to jump on the
> SCMI train while it's taking steam?
> 
> 
> Thanks,
> 
> Alex
