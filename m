From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 3/3] clocksource: Add clockevent support to NPS400
 driver
Date: Wed, 16 Nov 2016 07:44:55 -0600
Message-ID: <20161116134455.dv2fmuh4ot7yjiyc@rob-hp-laptop>
References: <1479199859-980-1-git-send-email-noamca@mellanox.com>
 <1479199859-980-4-git-send-email-noamca@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479199859-980-4-git-send-email-noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 15, 2016 at 10:50:59AM +0200, Noam Camus wrote:
> From: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> 
> Till now we used clockevent from generic ARC driver.
> This was enough as long as we worked with simple multicore SoC.
> When we are working with multithread SoC each HW thread can be
> scheduled to receive timer interrupt using timer mask register.
> This patch will provide a way to control clock events per HW thread.
> 
> The design idea is that for each core there is dedicated register
> (TSI) serving all 16 HW threads.
> The register is a bitmask with one bit for each HW thread.
> When HW thread wants that next expiration of timer interrupt will
> hit it then the proper bit should be set in this dedicated register.
> When timer expires all HW threads within this core which their bit
> is set at the TSI register will be interrupted.
> 
> Driver can be used from device tree by:
> compatible = "ezchip,nps400-timer0" <-- for clocksource
> compatible = "ezchip,nps400-timer1" <-- for clockevent
> 
> Note that name convention for timer0/timer1 was taken from legacy
> ARC design. This design is our base before adding HW threads.
> For backward compatibility we keep "ezchip,nps400-timer" for clocksource
> 
> Signed-off-by: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> ---
>  .../bindings/timer/ezchip,nps400-timer.txt         |   15 --
>  .../bindings/timer/ezchip,nps400-timer0.txt        |   17 ++
>  .../bindings/timer/ezchip,nps400-timer1.txt        |   15 ++

Please add acks when reposting.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/clocksource/timer-nps.c                    |  170 ++++++++++++++++++++
>  4 files changed, 202 insertions(+), 15 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer0.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer1.txt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
