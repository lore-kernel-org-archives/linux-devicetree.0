From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 4/4] irqchip: Add bcm2836 interrupt controller for
 Raspberry Pi 2.
Date: Mon, 13 Jul 2015 11:48:57 -0700
Message-ID: <87bnffao6e.fsf@eliezer.anholt.net>
References: <1436303617-17185-1-git-send-email-eric@anholt.net>
 <1436303617-17185-5-git-send-email-eric@anholt.net>
 <55A0A5EB.4090007@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4900292416100265751=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <55A0A5EB.4090007@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrea Merello <andrea.merello@gmail.com>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

--===============4900292416100265751==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Warren <swarren@wwwdotorg.org> writes:

> On 07/07/2015 03:13 PM, Eric Anholt wrote:
>> This interrupt controller is the new root interrupt controller with
>> the timer, PMU events, and IPIs, and the bcm2835's interrupt
>> controller is chained off of it to handle the peripherals.
>>=20
>> SMP IPI support was mostly written by Andrea Merello, while I wrote
>> most of the rest of the IRQ handling.
>>=20
>> Signed-off-by: Andrea Merello <andrea.merello@gmail.com>
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>
> I'd expect the git patch author to be Andrea if he wrote the original
> patch and you enhanced it.

I wrote the IRQs patch, and Andrea added the IPI bits to it.

>> diff --git a/drivers/irqchip/irq-bcm2836.c b/drivers/irqchip/irq-bcm2836=
.c
>
>> +struct arm_local_intc {
>> +	struct irq_domain *domain;
>> +	void __iomem *base;
>> +};
>> +
>> +static struct arm_local_intc intc  __read_mostly;
>
> It'd be nice to give everything (types, functions, variables) a
> consistent symbol prefix; bcm2836_arm_irqchip_ sounds like a good
> bikeshed to me, but perhaps just propagating the above arm_local_ to the
> functions too would be good, although that seems to risk symbol name
> collisions with other ARM SoCs.

Done.

>> +static void bcm2836_mask_gpu_irq(struct irq_data *d)
>> +{
>> +}
>> +
>> +static void bcm2836_unmask_gpu_irq(struct irq_data *d)
>> +{
>> +}
>
> If the IRQs can't be masked, should these functions actually be implement=
ed?

They are called unconditionally at IRQ enable time.  I don't see a way
to mask them.

>> +static void __exception_irq_entry bcm2836_handle_irq(struct pt_regs *re=
gs)
>> +{
>> +	int cpu =3D smp_processor_id();
>> +	u32 stat;
>> +
>> +	stat =3D readl_relaxed(intc.base + LOCAL_IRQ_PENDING0 + 4 * cpu);
>> +	if (stat & 0x10) {
>> +		void __iomem *mailbox0 =3D (intc.base +
>> +					  LOCAL_MAILBOX0_CLR0 + 16 * cpu);
>> +		u32 mbox_val =3D readl(mailbox0);
>> +		u32 ipi =3D ffs(mbox_val) - 1;
>> +
>> +		writel(1 << ipi, mailbox0);
>> +		handle_IPI(ipi, regs);
>
> Given that bcm2836_send_ipi() is #ifdef CONFIG_SMP, should this code be t=
oo?

Sure, done.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVpAgZAAoJELXWKTbR/J7ok4sP/0SfP9tZmypDJBSFUx5pv5tX
Uat3KheYP3e/CosVvwq6+FuUN1vwUfntUEKTmHHKndTFphl/Tq3JNaFbD3M28wJG
dEZ3gXd97M0xQH6La7MDsfIzNfR/f+LKN1by6YC1Hvkz4PwM42MPnN4l/rbJmtXn
5DT2SKAHB9XBxYRPt2O/nKT9ABlgosMZzOsC4H6MdHhtMR0NZOfN8zg/JFd5Q9Mi
uB0q8TOP0ClCD2kNrJBpxzpvH7zXb3MKS8mlPSbRhVy2NIYOqp5Mox8nJaupc+Nb
NOowkHuNaNXkgpBW/AJ2n6tnEAFKJIZzodX4k5XMD3xO/eX18QlK+ay+cSSoqNHE
31IpKjKgC+sdVLtQpAVw3YmNrt8LyHhl3HtfFcCwv5dDQlQYQWPJQ84ZDW1FJT6Z
LI0THTVButZVBnuekhF4ZAIg5WQBFnEAzMPlUNLNqsXP5zYIXs5/W6Qte54Qx9YP
josXPOs8YQM30zcugqMwTSmQNGLEXRJDoOXAHprjeiUn3L351GXB5Q8uPWZWWl49
FcuoEDcXTJEAIR0yVlPYwmKl5H4wkQKxL+iqTQzN65wfPGJDP52up3RsTemr9VE1
O2/4FBP5dsudfKRw8vuzR6pumAuaCrp929E1vOBfiyWcecmmGoGZGjR2nmsrk+IZ
uN2jJdxny0snYEpNs8f6
=ZFLO
-----END PGP SIGNATURE-----
--=-=-=--


--===============4900292416100265751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4900292416100265751==--
