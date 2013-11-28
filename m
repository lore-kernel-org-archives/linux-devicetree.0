From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clocksource: Do not drop unheld reference on device node
Date: Thu, 28 Nov 2013 09:23:49 +0100
Message-ID: <5296FD95.1010000@linaro.org>
References: <1382136588-15320-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382136588-15320-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/19/2013 12:49 AM, Thierry Reding wrote:
> When booting a recent kernel on ARM with OF_DYNAMIC enabled, the kern=
el
> warns about the following:
>
> 	[    0.000000] ERROR: Bad of_node_put() on /timer@50004600
> 	[    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 3.12.0-rc5-=
next-20131017-00077-gedfd827-dirty #406
> 	[    0.000000] [<c0015b68>] (unwind_backtrace+0x0/0xf4) from [<c0011=
7e4>] (show_stack+0x10/0x14)
> 	[    0.000000] [<c00117e4>] (show_stack+0x10/0x14) from [<c055f734>]=
 (dump_stack+0x9c/0xc8)
> 	[    0.000000] [<c055f734>] (dump_stack+0x9c/0xc8) from [<c03b47d4>]=
 (of_node_release+0x90/0x9c)
> 	[    0.000000] [<c03b47d4>] (of_node_release+0x90/0x9c) from [<c03b5=
084>] (of_find_matching_node_and_match+0x78/0xb4)
> 	[    0.000000] [<c03b5084>] (of_find_matching_node_and_match+0x78/0x=
b4) from [<c07887c8>] (clocksource_of_init+0x60/0x70)
> 	[    0.000000] [<c07887c8>] (clocksource_of_init+0x60/0x70) from [<c=
076e99c>] (start_kernel+0x1f4/0x33c)
> 	[    0.000000] [<c076e99c>] (start_kernel+0x1f4/0x33c) from [<800080=
74>] (0x80008074)
>
> This is caused by clocksource_of_init() dropping a reference on the
> device node that it never took. The reference taken by the loop is
> implicitly dropped on subsequent iterations. See the implementation o=
f
> and the comment on top of the of_find_matching_node_and_match()
> function for reference (no pun intended).
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/clocksource/clksrc-of.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/clocksource/clksrc-of.c b/drivers/clocksource/cl=
ksrc-of.c
> index 35639cf4..b9ddd9e 100644
> --- a/drivers/clocksource/clksrc-of.c
> +++ b/drivers/clocksource/clksrc-of.c
> @@ -35,6 +35,5 @@ void __init clocksource_of_init(void)
>
>   		init_func =3D match->data;
>   		init_func(np);
> -		of_node_put(np);
>   	}
>   }

Applied to my tree for 3.13 fixes.


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
