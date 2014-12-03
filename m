From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 2/2] backlight/lp855x: Add supply regulator to lp855x
Date: Wed, 03 Dec 2014 15:11:49 +0100
Message-ID: <5204192.bzM5jPIgHv@wuerfel>
References: <1417570752-23633-1-git-send-email-seanpaul@chromium.org> <1417570752-23633-2-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417570752-23633-2-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: milo.kim-l0cyMroinI0@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Aaron Durbin <adurbin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 02 December 2014 17:39:12 Sean Paul wrote:
> 
>  .../devicetree/bindings/video/backlight/lp855x.txt     |  2 ++
>  drivers/video/backlight/lp855x_bl.c                    | 18 ++++++++++++++++++
>  include/linux/platform_data/lp855x.h                   |  2 ++
>  3 files changed, 22 insertions(+)

While your two patches are both correct (and applied already), I took
a look at the platform_data header and noticed that all users of this
file have been converted to DT a while ago, so it would be nice to clean
it up by integrating the linux/platform_data/lp855x.h header file into the
drivers/video/backlight/lp855x_bl.c itself.

You can then merge struct lp855x_platform_data into lp855x to avoid the
extra dynamic allocation and remove all the 'pdata' references in the
driver.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
