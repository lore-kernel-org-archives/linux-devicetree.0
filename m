From: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCHv6 0/6] ARM: imx: Add Freescale LS1021A SoC and board
 support
Date: Sun, 26 Oct 2014 14:57:11 +0000
Message-ID: <1414335419636.17637@freescale.com>
References: <1414145327-23541-1-git-send-email-jingchang.lu@freescale.com>,<20141026002354.GC6973@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141026002354.GC6973@tiger>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


________________________________________
From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sent: Sunday, October 26, 2014 8:23 AM
To: Lu Jingchang-B35083
Cc: arnd-r2nGTMty4D4@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Subject: Re: [PATCHv6 0/6] ARM: imx: Add Freescale LS1021A SoC and board support

On Fri, Oct 24, 2014 at 06:08:41PM +0800, Jingchang Lu wrote:
>> This series contain the support for Freescale LS1021A CPU and LS1021A-QDS
>> and LS1021A-TWR board.
>>
>> The LS1021A SoC combines two ARM Cortex-A7 cores that have been optimized
>> for high reliability and pack the highest level of integration available
> >for sub-3W embedded communications processors and with a comprehensive
>> enablement model focused on ease of programmability.
>>
>> The LS1021A SoC shares IPs with i.MX family, Vybrid family and Freescale
>> PowerPC platform.
>>
>> For the detail information about LS1021A SoC, please refer to the RM doc.
>>
>> ---
>> changes in v6:
>>  add dts patch description.
>>  remove '-' from QDS and TWR board dts name for consistence with u-boot.

>I'm not sure it's a good idea.  The most idiomatic DTS naming schema is
just <socname>-<boardname>.dts.
Many our PowerPC platforms doesn't have '-' between SoCs and board names. This becomes a project requirement when integrating in our SDK release, and I have renamed these board names internally, so I also rename them on upstream for consistence. Thanks.

Best Regards,
Jingchang

>Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
