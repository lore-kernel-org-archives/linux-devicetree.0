From: Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] gpio/serial: revert "linux,first-pin" property handling
Date: Wed, 12 Jul 2017 13:56:17 +0200
Message-ID: <44be7013-b849-a784-90e9-5f4ba4ac07e7@siemens.com>
References: <20170710140902.21935-1-linus.walleij@linaro.org>
 <db1ae5e9-dc03-403e-2f46-e05cbd4a7b4f@siemens.com>
 <5310fa81-dc0e-75b1-05fb-2ec9b558f867@siemens.com>
 <CACRpkdb9sOj5DgeCwD1FK5yCNUmMiC0JKXL4H7z0RfK1DfUH8g@mail.gmail.com>
 <6b28ae9a-9393-1c97-4ef2-aaf69ec6a522@siemens.com>
 <CACRpkdZAwXZn+dJ-XB6wEbVLLiOfhumdrXDx4K-bMFN-p3-PSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZAwXZn+dJ-XB6wEbVLLiOfhumdrXDx4K-bMFN-p3-PSA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2017-07-12 13:39, Linus Walleij wrote:
> On Wed, Jul 12, 2017 at 1:30 PM, Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org> wrote:
>> On 2017-07-12 11:30, Linus Walleij wrote:
> 
>>> What you are talking about should be hardware-and-vendor specific
>>> info and prefixed "exar,*".
>>
>> "exar," or rather "gpio-exar,", like in [1]?
> 
> HW-specific DT bindings have this form: "vendor,foo".
> 
> So "exar,gpio-first-exported-pin" is some kind of overstating of the
> fact, but correct.

OK.

> 
> The bindings (put with the rest of the exar DT bindings if there
> are such somewhere in Documentation/devicetree/bindings/* else
> in a new file) should make it very clear that this is a
> hardware-specific thing telling us which hardware pin is the
> first offset to be used for GPIO.

This binding will lack any compatible value, so I'm not yet sure how to
name/document things properly. Is there a precedence for such a case?
Well, I can add some gpio-exar.txt and just put those two properties in it.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA ITP SES-DE
Corporate Competence Center Embedded Linux
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
