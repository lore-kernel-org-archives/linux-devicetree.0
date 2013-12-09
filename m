From: boris brezillon <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 5/9] ARM: at91/dt: add mmc0 slot0 support to at91rm9200ek
 board
Date: Mon, 09 Dec 2013 11:34:02 +0100
Message-ID: <52A59C9A.6000306@overkiz.com>
References: <1377687640-10529-1-git-send-email-b.brezillon@overkiz.com>	<1377687995-10758-1-git-send-email-b.brezillon@overkiz.com>	<20131120145926.GE14627@ns203013.ovh.net>	<528CDFFB.1020601@overkiz.com>	<CACRpkdboBg4YOnMNiar0DDBVnoky=zNky+Pzyp1=P_POtH15qQ@mail.gmail.com>	<528DE1C4.6060900@overkiz.com>	<CACRpkdZdweyWJefttiuiYAJ9qhahLbnj7eHUiLV_83UA41X_uQ@mail.gmail.com>	<5294D64D.7000100@overkiz.com>	<CACRpkdZoAjuWVpWZfvPgOAd7qB1ZBtC+45nD3SYay3SrMhqwVA@mail.gmail.com>	<52986CA8.3010601@overkiz.com> <CACRpkdag5=QYsWe81ocpkMp2APaoBAOOn2r0iAVdf9DHTKrSXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdag5=QYsWe81ocpkMp2APaoBAOOn2r0iAVdf9DHTKrSXA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Linus,

On 29/11/2013 14:31, Linus Walleij wrote:
> On Fri, Nov 29, 2013 at 11:30 AM, boris brezillon
> <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org> wrote:
>> On 29/11/2013 11:03, Linus Walleij wrote:
>>> I guess one way is to obtain this GPIO in board code and just
>>> flick it depending on which device you register.
> (...)
>> The whole goal of moving from board files to dt is to drop all board
>> specific processing or initialization and only keep a common description
>> with generic drivers capable of handling common use cases.
>>
>> I'm not sure providing new board specific drivers is a good solution
>> (even if it is the simplest way to achieve our goal).
>>
>> Could we have something similar to pinctrl but with gpios :
>> when the device is probed the device/driver core code request the gpio
>> configure it appropriately and set it to the requested value (if configured
>> as output).
> This has been suggested under the name "GPIO hogs" in the past.
>
> It would work similar to how pinctrl hogs work by associating the
> GPIO line the controller itself, using some specific string
> like gpio-input-hogs = <...> / gpio-output-hogs = <...>;
>
> The gpiolib core will then grab and set up these before
> returning from the registration call so noone ever gets a chance
> to use them.
One more question, and I'm done :).

In which case should we use output-high or output-low config
instead of gpio-output-hogs ?


Best Regards,

Boris
>> These are just thoughts, and I guess introducing new code in the
>> device/driver core
>> code is not that easy, especially when this code is here to handle specific
>> case
>> like ours.
> It is very easy, just write the patch, iterate it (these patches get
> a lot of scrutiny as it is core code, so expect some work and time
> to get it done), and then unless there is a blocker, I would merge it.
> The concept is entirely sound, just that someone needs to step
> up and do the work...
> Yours,
> Linus Walleij

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
