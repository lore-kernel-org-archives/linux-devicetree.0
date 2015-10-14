From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: fix gpio-keys wakeup-source property
Date: Wed, 14 Oct 2015 16:27:57 +0100
Message-ID: <561E747D.1040100@arm.com>
References: <1444743164-17735-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444743164-17735-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On 13/10/15 14:32, Sudeep Holla wrote:
> The keyboard driver for GPIO buttons(gpio-keys) checks for one of the
> two boolean properties to enable gpio buttons as wakeup source:
> 1. "wakeup-source" or
> 2. the legacy "gpio-key,wakeup"
>
> However juno, ste-snowball and emev2-kzm9d dts file have a undetected
> "wakeup" property to indictate the wakeup source.
>
> This patch fixes it by making use of "wakeup-source" property.
>
> Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
> Cc: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Please review this and provide ack if you are fine with the change for
ste-snowball. I can then ask arm-soc guys to pick this up as fix for v4.3

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
