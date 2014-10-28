From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCHv6 0/6] ARM: imx: Add Freescale LS1021A SoC and board
 support
Date: Tue, 28 Oct 2014 23:17:02 +0100
Message-ID: <7bd04bef7b8e2eb701a4fe91603a0dc1@agner.ch>
References: <1414145327-23541-1-git-send-email-jingchang.lu@freescale.com>,
 <20141026002354.GC6973@tiger> <1414335419636.17637@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414335419636.17637-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 2014-10-26 15:57, schrieb Jingchang Lu:
<snip>
>>> ---
>>> changes in v6:
>>>  add dts patch description.
>>>  remove '-' from QDS and TWR board dts name for consistence with u-boot.
> 
>>I'm not sure it's a good idea.  The most idiomatic DTS naming schema is
> just <socname>-<boardname>.dts.
> Many our PowerPC platforms doesn't have '-' between SoCs and board
> names. This becomes a project requirement when integrating in our SDK
> release, and I have renamed these board names internally, so I also
> rename them on upstream for consistence. Thanks.

Especially since this SoC has a letter in the end, its quite hard to
tell what is the SoC name and what is the board name. Hence I vote for
the hyphen too.

--
Stefan

> 
> Best Regards,
> Jingchang
> 
>>Shawn
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
