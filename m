From: Hongbo Zhang <hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v10 2/3] DMA: Freescale: Add new 8-channel DMA engine
 device tree nodes
Date: Thu, 26 Sep 2013 13:06:25 +0800
Message-ID: <5243C0D1.4070808@freescale.com>
References: <1379499333-4745-1-git-send-email-hongbo.zhang@freescale.com> <1379499333-4745-3-git-send-email-hongbo.zhang@freescale.com> <524074A7.7000001@wwwdotorg.org> <524169E3.7030408@freescale.com> <5241CC60.5070204@wwwdotorg.org> <52429252.10009@freescale.com> <1380159992.24959.248.camel@snotra.buserror.net> <20130926022859.GL9625@voom.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130926022859.GL9625-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, djbw-b10kYP2dOMg@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/26/2013 10:28 AM, David Gibson wrote:
> On Wed, Sep 25, 2013 at 08:46:32PM -0500, Scott Wood wrote:
>> On Wed, 2013-09-25 at 15:35 +0800, Hongbo Zhang wrote:
>>> By the way, I know maybe it is difficult, but why not introduce a
>>> document of maintaining rules for the dt binding docs? we have dedicated
>>> maintainers for this part now. Description language from one submitter
>>> cannot satisfy every reviewer/maintainer, for a reg property, is it
>>> necessary to say "offset and length",
>> Don't say "offset and length".  It's both redundant with the base
>> definition of the reg property, and overly specific because it makes
>> assumptions about how the parent node's ranges are set up (sometimes we
>> want to be that specific, but usually not).

Thanks for your answer Scott.
In fact my questions are mainly sample questions to file the necessary 
rules of dt binding.
> To look at it another way, the format of the 'reg' property is defined
> by the parent bus's binding, not the binding of the node itself.
>
Whatever the rule is, if it is reasonable and accepted, just as I said, 
we need to file it.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
