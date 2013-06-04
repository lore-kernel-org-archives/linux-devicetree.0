From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH v2 4/4] clocksource: dw_apb_timer_of: use
 clocksource_of_init
Date: Tue, 4 Jun 2013 15:21:20 +0100
Message-ID: <20130604142120.GD5308@maple>
References: <201306041136.09566.heiko@sntech.de>
 <201306041138.42639.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201306041138.42639.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On Tue, Jun 04, 2013 at 11:38:42AM +0200, Heiko St=FCbner wrote:
> dw_apb_timer_init used to search the devicetree for matching timer
> devices, making calls to it from board files necessary.
> =

> Change the dw_apb_timer_init to work with CLOCKSOURCE_OF_DECLARE.
> With this change the function gets called once for each timer node
> and tracks these number of calls to attach clockevent and clocksource
> devices to the nodes.
> =

> Also remove the calls to dw_apb_timer_init from all previous users, as
> clocksource_of_init is the default for init_time now.
> =

> Tested on the upcoming rk3066 code.
> =

> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
...
> -void __init dw_apb_timer_init(void)
> +static int num_called;
> +static void __init dw_apb_timer_init(struct device_node *timer)
>  {
> -	struct device_node *event_timer, *source_timer;
> -
> -	event_timer =3D of_find_matching_node(NULL, osctimer_ids);
> -	if (!event_timer)
> -		panic("No timer for clockevent");
> -	add_clockevent(event_timer);
> -
> -	source_timer =3D of_find_matching_node(event_timer, osctimer_ids);
> -	if (!source_timer)
> -		panic("No timer for clocksource");
> -	add_clocksource(source_timer);
> -
> -	of_node_put(source_timer);
> +	switch (num_called) {
> +	case 0:
> +		pr_debug("%s: found clockevent timer\n", __func__);
> +		add_clockevent(timer);
> +		of_node_put(timer);
> +		break;
> +	case 1:
> +		pr_debug("%s: found clocksource timer\n", __func__);
> +		add_clocksource(timer);
> +		of_node_put(timer);
> +		init_sched_clock();
> +		break;
> +	default:
> +		break;
> +	}
>  =

> -	init_sched_clock();
> +	num_called++;
>  }
> +CLOCKSOURCE_OF_DECLARE(pc3x2_timer, "picochip,pc3x2-timer", dw_apb_timer=
_init);
> +CLOCKSOURCE_OF_DECLARE(apb_timer, "snps,dw-apb-timer-osc", dw_apb_timer_=
init);

I think maybe we also want CLOCKSOURCE_OF_DECLARE() instances for the =

contents of sptimer_ids for completeness, otherwise looks good.

Acked-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>

Thanks,

Jamie
