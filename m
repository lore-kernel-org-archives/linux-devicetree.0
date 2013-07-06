From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH 9/9] clocksource: dw_apb_timer: special variant for
 rockchip rk3188 timers
Date: Sat, 6 Jul 2013 02:12:24 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1307060153110.32106@ionos.tec.linutronix.de>
References: <201307060051.09716.heiko@sntech.de>
 <201307060056.29370.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1635963963-1373069545=:32106"
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201307060056.29370.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
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
To: =?ISO-8859-15?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Ulrich Prinz <ulrich.prinz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1635963963-1373069545=:32106
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, 6 Jul 2013, Heiko St=C3=BCbner wrote:
> +	if (of_device_is_compatible(np, "rockchip,rk3188-dw-apb-timer-osc"))
> +		*quirks |=3D APBTMR_QUIRK_64BIT_COUNTER | APBTMR_QUIRK_NO_EOI |
> +			   APBTMR_QUIRK_INVERSE_INTMASK |
> +			   APBTMR_QUIRK_INVERSE_PERIODIC;

Brilliant. Next time we add

> +	if (of_device_is_compatible(np, "rockchip,rk3188-dw-apb-timer-osc2"))
> +		*quirks |=3D APBTMR_QUIRK_64BIT_COUNTER | APBTMR_QUIRK_NO_EOI |
> +			   APBTMR_QUIRK_INVERSE_INTMASK |
> +			   APBTMR_QUIRK_INVERSE_PERIODIC | MORE_NONSENSE;

Plus the extra conditionals all over the place

and a week later

> +	if (of_device_is_compatible(np, "rockchip,rk3188-dw-apb-timer-osc3"))
> +		*quirks |=3D ALLNONSENSE;


This has nothing to do with QUIRKS at all. QUIRKS are our last resort
when we cannot deal with the problem in a sane way.

In this case this is simply the wrong aproach.

We can deal with it in a sane way as I pointed out before and handle
it as simple properties of the IP block. We have all mechanisms in
place to handle such properties, device tree, platform data, static
init structures. It's all there and we really do not need to plaster
the code with random QUIRK conditionals.

Did you ever consider the runtime penalty of this? Probably not,
otherwise you would have spent time on speeding up that code by
caching frequently accessed registers instead of reading them back
over and over for no reason.

Thanks,

	tglx

--8323329-1635963963-1373069545=:32106
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--8323329-1635963963-1373069545=:32106--
