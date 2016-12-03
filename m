From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 39/39] mtd: nand: denali_dt: add compatible strings for
 UniPhier SoC variants
Date: Sat, 3 Dec 2016 03:49:49 +0100
Message-ID: <f98b49b9-91fc-c3d0-1ace-fa862581e53b@gmail.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-40-git-send-email-yamada.masahiro@socionext.com>
 <20161201160511.ahlibszokg547wxk@rob-hp-laptop>
 <CAK7LNASJLbizHEh8mUUVDvTKiRMCSvyYtdrQzwN5tHmCV8iYOA@mail.gmail.com>
 <CAL_Jsq+H-JcAtDV3NCfptCWrmTgkQkmZFTj=Do8HhX4b=At9RA@mail.gmail.com>
 <CAK7LNAQHnH=On=+7fzenu_v6rB71y9hYuAZi5oinZFu-tfAdjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNAQHnH=On=+7fzenu_v6rB71y9hYuAZi5oinZFu-tfAdjw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Chin Liang See <clsee-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/03/2016 03:41 AM, Masahiro Yamada wrote:
> Hi Rob,

Hi!

> 2016-12-03 1:26 GMT+09:00 Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> 
>>>
>>>
>>> (Plan A)
>>>   "denali,socfpga-nand"           (for Altera SOCFPGA variant)
>>>   "denali,uniphier-nand-v1"       (for old Socionext UniPhier family variant)
>>>   "denali,uniphier-nand-v2"       (for new Socionext UniPhier family variant)
>>>
>>> (Plan B)
>>>   "altera,denali-nand"            (for Altera SOCFPGA variant)
>>>   "socionext,denali-nand-v5a"     (for old Socionext UniPhier family variant)
>>>   "socionext,denali-nand-v5b"     (for new Socionext UniPhier family variant)
> 
>> Let the Altera folks worry about their stuff. At least for soft IP in
>> FPGA, it's a bit of a special case. The old string can remain as bad
>> as it is.
> 
> 
> Hmm, I am not sure if this IP would fit in FPGA
> (to use it along with NIOS-II?)
> 
> (even if it happened, nothing of this IP would be customizable on users' side.
> When buying the IP, SoC vendors submit a list of desired features.
> Denali (now Cadence) generates the RTL according to the configuration sheet.
> The function is fixed at this point. So, generic compatible would be
> useless anyway.)
> 
> 
> If we are talking about SOCFPGA,
> SOCFPGA is not only FPGA. Rather "SOC" + "FPGA".
> It consists of two parts:
> [1] SOC part  (Cortex-A9 + various hard-wired peripherals such UART,
> USB, SD, NAND, ...)
> [2] FPGA part (User design logic)
> 
> The Denali NAND controller is included in [1].
> So, as far as we talk about the Denali on SOCFPGA,
> it is as hard-wired as Intel, Socionext's ones.

That's correct, the Denali NAND IP in altera socfpga is a hardware
block. You can make it available to the fabric too, but by default
it's used by the ARM part of the chip, so for this discussion, you
can forget that the FPGA part exists altogether.

I would be in favor of plan B, since it seems to be the more often
taken approach. A nice example is ci-hdrc:

$ git grep compatible drivers/usb/chipidea/

>> I simply would do "socionext,uniphier-v5b-nand" (and v5a).
>> The fact that it is denali is part of the documentation.
>>
> 
> Let me think about this.
> 
> Socionext bought two version of Denali IP,
> and we are now re-using the newer one (v5b) for several SoCs.
> Socionext has some more product lines other than Uniphier SoC family,
> perhaps wider re-use might happen in the future.
> 
> At first, I included "uniphier" in compatible, but I am still wondering
> if such a specific string is good or not.
> 
> Also, comments from Altera engineers are appreciated.

Adding a few more on Cc

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
