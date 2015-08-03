From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] irqchip: bcm2836: Use a CPU notifier enable IPIs.
Date: Mon, 03 Aug 2015 16:23:09 -0700
Message-ID: <87fv40lzxe.fsf@eliezer.anholt.net>
References: <55B67C81.1010900@gmail.com> <1438027789-1637-1-git-send-email-eric@anholt.net> <alpine.DEB.2.11.1508021221370.3825@nanos>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1508021221370.3825@nanos>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> writes:

> On Mon, 27 Jul 2015, Eric Anholt wrote:
>> +/* Unmasks the IPI on the CPU wen it's first brought online. */
>
> when
>
>> +static int bcm2836_arm_irqchip_cpu_notify(struct notifier_block *nfb,
>> +					  unsigned long action, void *hcpu)
>> +{
>> +	unsigned int cpu = (unsigned long)hcpu;
>> +	unsigned int int_reg = LOCAL_MAILBOX_INT_CONTROL0;
>> +	unsigned int mailbox = 0;
>> +
>> +	if (action == CPU_STARTING || action == CPU_STARTING_FROZEN)
>> +		bcm2836_arm_irqchip_unmask_per_cpu_irq(int_reg, mailbox, cpu);
>
> Shouldn't you mask the irq on CPU_DYING?

I was just following what other drivers were doing.  Is CPU_DYING the
only thing that needs masking?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVv/fdAAoJELXWKTbR/J7ot0gQAJVkpyhpccywQim/rVT8BW7y
ytOoeQ4Q6PklD44HR4ceSNIK4RxR9qYTaQonIvhhyFPc9OI4j63qRsSuZyXc06aR
VYCi0a9mNCAn99rfegyeT970bEeNBkUqahn34i4Dc6E9vpOi7UKzCfe2Q5R08R1v
GaVmGY/GwGrXE5k6z+dh837TjfPs25IKYJqgidT/Cy9LjWrPRCN7XMcvhgaAJyBT
FC0uK/myGXJQjN5SlXzMzQuHlrr5fLoyQJwezCLiurQgwjlXgh2Rek1eiYSil+wN
vj2SNk9eKU54wDcYOxzJpnzhCtUMUg43/bADeufymY0PFFc1KevS9OrZMLfNBU8x
cjIuXrS1DHa6MXSc0XZkfvaNzpa/0N2XdrebOidbOg+s3C92/PcU6L8RRr5BR0zY
Q8x3tl6wNm9UDQvvzgw96nlM/3YRXiITz1ct09rQgFBJk318avJObLaBvzJwVMzd
bJ+8LQrR6VOTsk4BT8Gz/at57ieRErB6d/+9GHQoyJa6Ib5fC6H5zi2v6h6ZsAkP
ZI8XRfEtEIb26G1OvZc+P3+G4YYcu80vaYrPFVzQ03MRoBNl/SqCv8SVMKa/HMi4
ODwd7JAqw17L0Tv3IHqhf1ngUXDqR7G5C3xPW2HxOl4oX4xkcbVyFYeJhllTV2+0
RkDCD6VjFbxoDbDeWF2Z
=bChi
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
