From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/9] of: Add a new macro to declare_of for one parameter
 function returning a value
Date: Tue, 14 Jun 2016 09:41:49 +0200
Message-ID: <575FB53D.8030107@linaro.org>
References: <1464770093-12667-1-git-send-email-daniel.lezcano@linaro.org>
 <1464770093-12667-2-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464770093-12667-2-git-send-email-daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/01/2016 10:34 AM, Daniel Lezcano wrote:
> The macro OF_DECLARE_1 expect a void (*func)(struct device_node *) wh=
ile the
> OF_DECLARE_2 expect a int (*func)(struct device_node *, struct device=
_node *).
>
> The second one allows to pass an init function returning a value, whi=
ch make
> possible to call the functions in the table and check the return valu=
e in order
> to catch at a higher level the errors and handle them from there inst=
ead of
> doing a panic in each driver (well at least this is the case for the =
clkevt).
>
> Unfortunately the OF_DECLARE_1 does not allow that and that lead to s=
ome code
> duplication and crappyness in the drivers.
>
> The OF_DECLARE_1 is used by all the clk drivers and the clocksource/c=
lockevent
> drivers. It is not possible to do the change in one shot as we have t=
o change
> all the init functions.
>
> The OF_DECLARE_2 specifies an init function prototype with two parame=
ters with
> the node and its parent. The latter won't be used, ever, in the timer=
 drivers.
>
> Introduce a OF_DECLARE_1_RET macro to be used, and hopefully we can s=
moothly
> and iteratively change the users of OF_DECLARE_1 to use the new macro=
 instead.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---

Rob, Grant,

do you agree with this change ?

Thanks.

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
