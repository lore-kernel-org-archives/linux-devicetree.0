From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/9] ARM Versatile multi-platform support
Date: Thu, 8 Jan 2015 15:38:13 -0600
Message-ID: <CAL_JsqKLNPVDCUELaZU8JW0roT3RcyqcxtJbvbYQrjzxjt3FeQ@mail.gmail.com>
References: <1419967718-26909-1-git-send-email-robherring2@gmail.com> <CACRpkda8T8CwghVYtTw41h_y+GdCA5xCEaSL1Jy4VZBo3MAy-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkda8T8CwghVYtTw41h_y+GdCA5xCEaSL1Jy4VZBo3MAy-Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 8, 2015 at 1:47 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Dec 30, 2014 at 8:28 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> This series converts ARM Versatile platform to multi-platform. I started
>> this some time ago and some pieces were already merged. The primary
>> piece remaining is converting the PCI host to DT which I was waiting for
>> the common PCI DT parsing to get settled. Now that that is in place as
>> well as a few other pieces are in place like multi-platform fixes for
>> CLCD, we can fully convert Versatile to DT and multi-platform.
>>
>> There's still a few things that need DT support which can be done
>> later:
>> - MMC card detect and write protect. Should be able to use VExpress
>>   support
>> - Reboot support. Should be able to re-use Realview reboot code.
>> - flash phys-map support. Binding exists, but specifically Vpp control
>>   is needed.
>> - CLCD support. Not sure where this is at.
>
> I like it overall but would like to see some use of the syscon
> pattern to access random registers in syscon, and specifically not
> to refer to these registers as some "gpio" because they aren't.

I'm not sure I follow. Creating GPIO lines for SD card detect and
write protect is exactly how VExpress syscon was implemented.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
