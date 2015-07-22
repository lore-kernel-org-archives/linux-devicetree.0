From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH v2 4/4] irqchip: Add bcm2836 interrupt controller for Raspberry Pi 2.
Date: Wed, 22 Jul 2015 11:02:44 -0700
Message-ID: <87egk0gjej.fsf@eliezer.anholt.net>
References: <1436837718-956-1-git-send-email-eric@anholt.net> <1436837718-956-5-git-send-email-eric@anholt.net> <55AEFB57.6030902@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55AEFB57.6030902-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrea Merello <andrea.merello-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> On 07/13/2015 07:35 PM, Eric Anholt wrote:
>> This interrupt controller is the new root interrupt controller with
>> the timer, PMU events, and IPIs, and the bcm2835's interrupt
>> controller is chained off of it to handle the peripherals.
>
>> diff --git a/drivers/irqchip/irq-bcm2836.c b/drivers/irqchip/irq-bcm2836.c
>
>> +static void bcm2836_arm_irqchip_mask_pmu_irq(struct irq_data *d)
>> +{
>> +	pr_err("%d: mask PMU\n", smp_processor_id());
>> +	writel(1 << smp_processor_id(), intc.base + LOCAL_PM_ROUTING_CLR);
>> +}
>> +
>> +static void bcm2836_arm_irqchip_unmask_pmu_irq(struct irq_data *d)
>> +{
>> +	pr_err("%d: unmask PMU\n", smp_processor_id());
>> +	writel(1 << smp_processor_id(), intc.base + LOCAL_PM_ROUTING_SET);
>> +}
>
> Are those pr_err() calls left-over debug, or is there some reason it's
> an error to call those functions?

Yeah, I was trying to figure out whether the PMU bits worked.  We're
failing before the point of IRQ probe, though (I don't see anything that
would set arm_pmu->supported_cpus for us).

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVr9rEAAoJELXWKTbR/J7oOEkP/3kXJu6Y62LxSBkO06Ueq8IO
DuWUXABSvN3FqTFEWYlFMyGdfAI14E2tnJvoR4kfzbz/j9aULYXKhAX+aI8cqDt7
yGT5Kl0MwohYZc14whQRMOIY5KvaV7pJmte4errtI2OJJvysWbuSJRLQfJtiw8fi
P6LHSIltXhgnY1wXZWqe7FxVReb6lE0dkYLyJNEfxot011BnLiRYMMcxo6R7MqoR
Fd9ofmj7lET8bhXdWvIvHwguB5PUnSm2kSLm+iB1BrFdeJhzL7eOyQ4ogtW+HuHl
YnpMe0QxdE0902wz8RSOT6hQ/ADQR6/jC76tO2sfPmsTM7Gw2RpAevabHykCxxzO
4OtgoxoaO9HmHoQa49P9KD9hN9yBJlnOaC5UpFaAYbuJ14EFGqNEYjFOV5EQxx6u
ziDzW5e0GYuuJQ2obt7jN82JAjuVtLhrqXN+Oxjtv5z14sb/DeS8xIPJ2CO+jPlp
TrDL2NnoTcMvVz8FIPkrKk1KIZ03C3gajPxpV15/uN7G8zZdwkJBkA+Dq3U+e4yI
tBJs1u6LiyAZEKwhL6zeFSpBAFja9IovyZeXg4v7c8chfEsDJw+BYwL/zifzZtEh
mrqhgdGrSrHYaO3ZNFWpOkmMPZwbo07yDBvEuMu2HfgxDBD/d11qomEKZSlx24YU
aJ/zC8YqYHVHWAs8w1wk
=9uZq
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
