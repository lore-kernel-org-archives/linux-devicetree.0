From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/4] pinctrl: amlogic: Make driver independent from two-domain configuration
Date: Fri, 18 Mar 2016 09:14:07 -0700
Message-ID: <7hzitvsr00.fsf@baylibre.com>
References: <1456869876-19320-1-git-send-email-carlo@caione.org>
	<1456869876-19320-3-git-send-email-carlo@caione.org>
	<CAOi56cWN-iPVh6Ace-SXUFoX4POnSyT0OmG8gyqivNpQTo9u4A@mail.gmail.com>
	<CAOQ7t2Ykgej4uyDLUvuSZyjiJwK1TF4RGYJQhXWubk69d1xA_Q@mail.gmail.com>
	<7h7fh1t8vu.fsf@baylibre.com>
	<CAOQ7t2YjS5nAb3xxpdH-H11+2Y8WeCkxdKJE9yUKzkbVYMYfEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOQ7t2YjS5nAb3xxpdH-H11+2Y8WeCkxdKJE9yUKzkbVYMYfEw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Carlo Caione's message of "Thu, 17 Mar 2016 19:15:24 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-meson <linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>, Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> writes:

> On Thu, Mar 17, 2016 at 4:35 PM, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
>
>> Do you have an ack now?  or are you still waiting?
>
> Still waiting for Rob.
>
>>> What's the fastest way to land the DTS changes in mainline at this point?
>>
>> When you've collected the acks, send a pull request through arm-soc so
>> we can get it in via our fixes branch.
>
> ok

If the Ack is not forthcoming ASAP, you should probably revert the
change so that mainline/arm-soc/linux-next are not broken.  For future
reference, it's better to wait until all dependencies can be merged
together.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
