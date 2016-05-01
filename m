From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] pinctrl: amlogic: Add support for Amlogic Meson GXBB SoC
Date: Sun, 01 May 2016 16:48:51 -0700
Message-ID: <m2y47tuyos.fsf@baylibre.com>
References: <1462036875-22625-1-git-send-email-carlo@caione.org>
	<1462036875-22625-2-git-send-email-carlo@caione.org>
	<CACRpkdbfSgVH_zGMdgyfvBbnpiTkd7dzugza4_w0_7MLMVNzyA@mail.gmail.com>
	<CAOQ7t2YEVsk9cB-kmp-fXSVsVVtXynFbMSxPzTPE_0+s0qY9PQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOQ7t2YEVsk9cB-kmp-fXSVsVVtXynFbMSxPzTPE_0+s0qY9PQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Carlo Caione's message of "Sun, 1 May 2016 11:20:14 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-meson <linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> writes:

> On Sun, May 1, 2016 at 11:03 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On Sat, Apr 30, 2016 at 7:21 PM, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> wrote:
>>
>>> From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>>>
>>> This patch adds the basic platform file to support the pin controller
>>> found on the Amlogic Meson GXBB SoCs.
>>>
>>> Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>>
>>>  .../devicetree/bindings/pinctrl/meson,pinctrl.txt  |   2 +
>>
>> This thing conflicts with upstream. Make a separate patch for
>> updating the bindings I think.
>
> This patch is based on linux-next where the documentation is correctly
> updated (see 11ca8735) but apparently this is missing from upstream.
> Probably slipped through the cracks with the latest PR.
>
> Kevin, did you merge both the commits in
> https://patchwork.ozlabs.org/patch/603580/ or just the DT changes?

Yes, I just pulled your branch.

That pull was merged for v4.7, which is why it's in next, but not yet
mainline (where v4.6 is just now being finalized.)

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
