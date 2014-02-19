From: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 1/2] memory: ti-aemif: introduce AEMIF driver
Date: Wed, 19 Feb 2014 19:04:31 +0200
Message-ID: <5304E41F.4080205@ti.com>
References: <1391629574-18955-1-git-send-email-ivan.khoronzhuk@ti.com> <1391629574-18955-2-git-send-email-ivan.khoronzhuk@ti.com> <20140218203049.GA18647@kroah.com> <53048822.2080307@ti.com> <20140219143403.GA31063@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140219143403.GA31063-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: santosh.shilimkar-l0cyMroinI0@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, "[initial author] Murali Karicheri" <m-karicheri2-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On 02/19/2014 04:34 PM, Greg KH wrote:
> On Wed, Feb 19, 2014 at 12:32:02PM +0200, Ivan Khoronzhuk wrote:
>>>> +	aemif->clk = devm_clk_get(dev, NULL);
>>>> +	if (IS_ERR(aemif->clk)) {
>>>> +		dev_err(dev, "cannot get clock 'aemif'\n");
>>>> +		return PTR_ERR(aemif->clk);
>>> No freeing memory?
>> There is no need to free memory explicitly.
>> devm_kzalloc is used instead of kzalloc.
> Yes, but where does the device on the error path get removed?

Why these functions are needed in that case...

As I see, memory allocated with these functions
are automatically freed on driver detach.

Additionally I've checked if resources are released after
AEMIF driver probe error.
And they're released completely in case of probe error.

:-\

-- 
Regards,
Ivan Khoronzhuk

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
