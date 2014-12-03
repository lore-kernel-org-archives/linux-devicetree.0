From: "Kim, Milo" <milo.kim-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 2/2] backlight/lp855x: Add supply regulator to lp855x
Date: Wed, 3 Dec 2014 09:54:52 +0900
Message-ID: <547E5F5C.40406@ti.com>
References: <54767F43.2060901@ti.com> <1417468079-4990-1-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417468079-4990-1-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, =?UTF-8?B?U3TDqXBoYW5lIE1hcmNoZXNpbg==?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Aaron Durbin <adurbin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/2/2014 6:07 AM, Sean Paul wrote:
> This patch adds a supply regulator to the lp855x platform data to fac=
ilitate
> powering on/off the 3V rail attached to the controller.
>
> Cc: St=C3=A9phane Marchesin<marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Aaron Durbin<adurbin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Sean Paul<seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Acked-by: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>

=46or effective power consumption, regulator could be enabled/disabled=20
based on backlight control flow.
=46or example, when the brightness is 0, then call regulator_disable()
when the brightness is > 0 and regulator is off, then call=20
regulator_enable().
However, I'd like to send ACK to this patch.

Sean,
Could you send the patch-set with the first one - 'backlight/lp855x:=20
Refactor dt parsing code'? I'll send my ACK as well.
=46or the backlight maintainers, it would be better to apply them toget=
her.

Thanks!

Best regards,
Milo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
