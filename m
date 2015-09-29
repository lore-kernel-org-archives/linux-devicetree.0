From: Josh Boyer <jwboyer-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: dts: Fix Makefile target for sun4i-a10-itead-iteaduino-plus
Date: Tue, 29 Sep 2015 10:32:59 -0400
Message-ID: <CA+5PVA5ceg94PrUdUpb5X7ZsbEuK4_u1V-ZDesR7h_MZ8rGUtg@mail.gmail.com>
References: <20150904124934.GD464@hansolo.redhat.com>
	<20150906112046.GK31584@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150906112046.GK31584@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Josef Gajdusek <atx-MwjtXicnQwU@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 6, 2015 at 7:20 AM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Fri, Sep 04, 2015 at 08:49:34AM -0400, Josh Boyer wrote:
>> Commit 79ae3e66f8d (ARM: dts: sun4i: Add Iteaduino Plus A10) added a new
>> make target for the sun4i-a10-itead-iteaduino-plus dts file, but mistakenly
>> used .dts instead of the correct .dtb suffix.  This resulted in a build error
>> like:
>>
>>         scripts/Makefile.dtbinst:42: target 'sun4i-a10-itead-iteaduino-plus.dts' doesn't match the target pattern
>>
>> when doing a make dtbs_install.
>>
>> Fix it to use the proper file name.
>>
>> Signed-off-by: Josh Boyer <jwboyer-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
>
> Queued, thanks!

Are you going to push this to Olof or Linus for the 4.3 release?  I
don't see it in Linus' tree and this is still broken there.

josh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
