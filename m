From: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Subject: Re: [RFC PATCH 0/9] dt: dependencies (for deterministic driver initialization
 order based on the DT)
Date: Wed, 14 May 2014 20:16:53 +0200
Message-ID: <5373B315.3020909@ahsoftware.de>
References: <1399913280-6915-1-git-send-email-holler@ahsoftware.de>	<20140514141914.446F7C4153D@trevor.secretlab.ca>	<53738580.7000902@ahsoftware.de>	<CACxGe6s4px_9CNk3bkc1OF1KGZGYdyh4gE_VufCKU5dLFBG48g@mail.gmail.com>	<53739871.9070407@ahsoftware.de> <CAL_JsqJB4CAO60m1HTGQGHQRYVWcARxm_roOhn-PJh+ZR7OONg@mail.gmail.com> <5373ABD2.9010508@ahsoftware.de> <5373ADB6.1070702@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5373ADB6.1070702-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 14.05.2014 19:53, schrieb Alexander Holler:
> Am 14.05.2014 19:45, schrieb Alexander Holler:
>
>> One of the biggest problem of the deferred probe stuff is the problem
>> how to identify real problems if everything ends up with a deferred
>> probe when an error occurs? That means if you display an error whenever
>> something is deferred, the log becomes almost unreadable. If you don't
>> display an error, you never will see an error. And how do you display
>> the real error when deferred probes finally do fail? The deferred probe
>> stuff doesn't has any information about the underlying error, so it
>> can't display it.
>
> And that is a real problem. I've recently tried to identify why a driver
> failed and it was a nightmare because nothing offered any message (debug
> or not) when a probe was deferred. So I had to insert tons of printks to
> walk upwards to find the finally place where the probe failed.
> Everything afterwards just has forwarded the -EPROBE_DEFER without
> printing any message.

To add some numbers, I had to insert around 20-30 printks in around 10 
or more files to find the underlying problem. Having to do such whenever 
an error happens because everything assumes the error will disappear in 
a later try, which doesn't happen for real errors, is just a nightmare.

Regards,

Alexander Holler

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
