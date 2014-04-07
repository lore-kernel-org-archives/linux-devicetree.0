From: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
Subject: Re: [PATCH v2 2/5] ARM: zynq: dt: Convert to preprocessor includes
Date: Mon, 7 Apr 2014 14:17:24 +0200
Message-ID: <53429754.8080105@topic.nl>
References: <1396653256-28397-1-git-send-email-soren.brinkmann@xilinx.com> <1396653256-28397-3-git-send-email-soren.brinkmann@xilinx.com> <53423E75.3020008@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53423E75.3020008-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=EF=BB=BFOn 04/07/2014 07:58 AM, Michal Simek wrote:
> Hi Soren,
>
> On 04/05/2014 01:14 AM, Soren Brinkmann wrote:
>> Convert all Zynq DT files to the dtc preprocessor include syntax.
>> This allows to include header files in the devicetrees like other
>> SoC-types already do.
>>
>> Inspired-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> (http://www.spinics.net/lists/arm-kernel/msg319832.html)
>>
>> Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>
> These 4 patches needs more wider discussion if this is helpful or
> not. Currently I can't see any value in it because everything
> is just generated and fixed. I think I had the same discussion
> with Laurent some weeks ago regarding this.

I would be kinda neutral here. I'd consider it helpful, it improves=20
readability (regardless of whether they are generated or hand crafted).=
 That's=20
convenient for things like interrupt sensitivity, I can't remember whet=
her 4=20
is level or edge type. On the other hand, the clock indices are just as=
 much=20
magic numbers as the memory addresses. If I suspect an error in that ar=
ea, I'd=20
start by lokking in /sys/kernel/debug/clk but wouldn't start in the DT.

> IRC the origin idea to use this was especially for people who
> writing these DTS by hand which is not our case - at least
> for majority of our customers.

I write them by hand. Is there any other way?

Mike.


Met vriendelijke groet / kind regards,

Mike Looijmans

TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) (0) 499 33 69 79
Telefax:  (+31) (0) 499 33 69 70
E-mail: mike.looijmans-Oq418RWZeHk@public.gmane.org
Website: www.topic.nl

Please consider the environment before printing this e-mail

Visit us at the Hannover Messe 7 - 11 April 2014 - Hall 002/D10 (Dutch =
Pavillion)
http://www.hannovermesse.de/exhibitor/topic-embedded-products/V229623

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
