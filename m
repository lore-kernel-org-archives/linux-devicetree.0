From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 4/4] ARM: OMAP: Move DT wake-up event handling over to
 use pinctrl-single-omap
Date: Tue, 11 Jun 2013 12:08:49 +0300
Message-ID: <51B6E921.7050804@ti.com>
References: <20130607203936.16513.57494.stgit@localhost> <20130607205046.16513.2802.stgit@localhost> <688FBEF7C8277944BE5AED9A41FB1EBC1AB12DA0@DNCE05.ent.ti.com> <20130610142511.GF8164@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <20130610142511.GF8164@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, "Ujfalusi, Peter" <peter.ujfalusi@ti.com>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 06/10/2013 05:25 PM, Tony Lindgren wrote:
> * Quadros, Roger <rogerq@ti.com> [130610 05:37]:
>> Hi Tony, (sorry, on Outlook web)
>>
>> -                       compatible = "ti,omap4-padconf", "pinctrl-single";
>> +                       compatible = "ti,omap4-padconf";
>>
>> This change is not necessary if we make sure the pinctrl-single-omap driver
>> gets registered early enough, before the pinctrl devices are probed.
>>  (e.g. subsys_initcall())
> 
> I'd rather make everything just module_init, there should not be
> any need to tinker with the init call ordering any longer with
> deferred probe. And by making everything into regular device drivers
> we actually see real error messages without DEBUG_LL and earlyprintk
> if something goes wrong.
> 
> Note that there are patches queued to make twl-core.c just regular
> module_init as well, so that should fix any issues you might be
> related it probing before pinctrl.
>  

OK.

>> I've commented about this in the other patch.
> 
> Sorry can you clarify, which other patch? The other message I saw
> in this thread was empty. Or at least I have not seen it yet.

Sorry about that. Outlook web sucks. I see that you have found it :).

cheers,
-roger

