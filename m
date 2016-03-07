From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] documentation: Fix pinctrl documentation for Meson8 / Meson8b
Date: Mon, 7 Mar 2016 10:01:53 +0100
Message-ID: <CAOQ7t2bd5-xeUkwjN4cqi=xa602B8JwZ4vvrUF1VL4y2=pkV_Q@mail.gmail.com>
References: <1456869876-19320-1-git-send-email-carlo@caione.org>
	<1456869876-19320-5-git-send-email-carlo@caione.org>
	<20160305042646.GL13525@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160305042646.GL13525@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-meson <linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 5, 2016 at 5:26 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Mar 01, 2016 at 11:04:36PM +0100, Carlo Caione wrote:
>> From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>>
>> Fix pin controller documentation with the new compatibles.
>
> What was wrong with it? (answer in the commit msg)

I'll extend the commit message.

[...]
>>  Required properties for the root node:
>> - - compatible: "amlogic,meson8-pinctrl" or "amlogic,meson8b-pinctrl"
>> + - compatible: "amlogic,meson8-cbus-pinctrl", "amlogic,meson8b-cbus-pinctrl",
>> +   "amlogic,meson8-aobus-pinctrl" or "amlogic,meson8b-aobus-pinctrl"
>
> Reformat with 1 per line (assuming each are mutually exclusive).

ok

[...]
>> -Valid sub-node names are:
>> - - "banks" for the regular domain
>> - - "ao-bank" for the always-on domain
>> -
>
> Why are these being removed?

Because we are not forced anymore to use those specific names for the sub-nodes.

-- 
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
