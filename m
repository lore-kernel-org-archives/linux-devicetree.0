From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM: boot: mxs: Add On-Chip RAM
Date: Fri, 21 Oct 2016 16:05:59 +0200
Message-ID: <9bf7c925-bdc2-d0b8-9886-70d46383d1e0@i2se.com>
References: <1473789066-8955-1-git-send-email-stefan.wahren@i2se.com>
 <20161021135343.GI30578@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161021135343.GI30578@tiger>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause-L1vi/lXTdtsfGbAt6QbQcg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?Q?Lothar_Wa=c3=9fmann?= <lw-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 21.10.2016 um 15:53 schrieb Shawn Guo:
> On Tue, Sep 13, 2016 at 05:51:02PM +0000, Stefan Wahren wrote:
>> The i.MX23 / i.MX28 have a small amount of On-Chip RAM which is also necessary
>> for suspend to RAM and standby mode. But before we need to remove the fake reg
>> properties of all internal bus nodes as discussed in this thread [1].
>>
>> This patch series requires Fabio Estevam's recent series "ARM: dts: imx23:
>> Remove skeleton.dtsi inclusion" [2].
>>
>> [1] - https://marc.info/?l=devicetree&m=146139948426520&w=2
> The page cannot be reached.  I would like to understand the
> background for this change.

Strange, because i don't have any problems while clicking on the URL.

It's an older discussion on the devicetree / kernel newbie mailing list
with subject "strange dtc errors after adding sram node". Arnd suggested
in the discussion to remove the reg property from the ahb node.

Please try this one: http://www.spinics.net/lists/newbies/msg57652.html

Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
