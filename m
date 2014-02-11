From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 2/3] clocksource: keystone: add bindings for keystone
 timer
Date: Tue, 11 Feb 2014 13:58:27 +0100
Message-ID: <52FA1E73.7050200@linaro.org>
References: <1392027058-11680-1-git-send-email-ivan.khoronzhuk@ti.com> <1392027058-11680-3-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392027058-11680-3-git-send-email-ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, santosh.shilimkar-l0cyMroinI0@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/10/2014 11:10 AM, Ivan Khoronzhuk wrote:
> This patch provides bindings for the 64-bit timer in the KeyStone
> architecture devices. The timer can be configured as a general-purpos=
e 64-bit
> timer, dual general-purpose 32-bit timers. When configured as dual 32=
-bit
> timers, each half can operate in conjunction (chain mode) or independ=
ently
> (unchained mode) of each other.
>
> It is global timer is a free running up-counter and can generate inte=
rrupt
> when the counter reaches preset counter values.
>
> Documentation:
> http://www.ti.com/lit/ug/sprugv5a/sprugv5a.pdf
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Acked-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
> ---

Applied to my tree for 3.15

Thanks !

   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
