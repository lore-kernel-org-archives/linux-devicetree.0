From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 02/10] mailbox: Enable BCM2835 mailbox support
Date: Fri, 06 Mar 2015 12:00:06 -0800
Message-ID: <87bnk5lwvt.fsf@eliezer.anholt.net>
References: <1425329684-23968-1-git-send-email-eric@anholt.net> <1425329684-23968-3-git-send-email-eric@anholt.net> <54F675F1.60205@wwwdotorg.org> <87a8zs8vzo.fsf@eliezer.anholt.net> <54F932FD.5040207@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54F932FD.5040207-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> On 03/04/2015 11:20 AM, Eric Anholt wrote:
>> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:
>>=20
>>> On 03/02/2015 01:54 PM, Eric Anholt wrote:
>>>> From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
>>>>=20
>>>> Implement BCM2835 mailbox support as a device registered with
>>>> the general purpose mailbox framework. Implementation based on
>>>> commits by Lubomir Rintel [1], Suman Anna and Jassi Brar [2] on
>>>> which to base the implementation.
>>>=20
>>>> diff --git a/drivers/mailbox/bcm2835-mailbox.c
>>>> b/drivers/mailbox/bcm2835-mailbox.c
>
>>>> +static irqreturn_t bcm2835_mbox_irq(int irq, void *dev_id) +{=20
>>>> +	struct bcm2835_mbox *mbox =3D (struct bcm2835_mbox *) dev_id; +
>>>> struct device *dev =3D mbox->dev; + +	while (!(readl(mbox->regs +
>>>> MAIL0_STA) & ARM_MS_EMPTY)) { +		u32 msg =3D readl(mbox->regs +
>>>> MAIL0_RD); +		unsigned int chan =3D MBOX_CHAN(msg); + +		if
>>>> (!mbox->channel[chan].started) { +			dev_err(dev, "Reply on
>>>> stopped channel %d\n", chan); +			continue; +		} +
>>>> dev_dbg(dev, "Reply 0x%08X\n", msg); +
>>>> mbox_chan_received_data(mbox->channel[chan].link, +			(void *)
>>>> MBOX_DATA28(msg)); +	} +	rmb(); /* Finished last mailbox read.
>>>> */
>>>=20
>>> I know the PDF mentioned in the comment earlier in the patch says
>>> to put in barriers between accesses to different peripherals,
>>> which this seems compliant with, but I don't see quite what this
>>> barrier achieves. I think the PDF is talking generalities, not
>>> imposing a rule that must be blindly followed. Besides, if
>>> there's a context-switch you can't actually implement the rules
>>> the PDF suggests. What read operation is this barrier attempting
>>> to ensure happens after reading all mailbox messages and any
>>> associated DRAM buffer?
>>=20
>> Looking at this bit of code in particular:
>>=20
>> "As interrupts can appear anywhere in the code so you should
>> safeguard those. If an interrupt routine reads from a peripheral
>> the routine should start with a memory read barrier. If an
>> interrupt routine writes to a peripheral the routine should end
>> with a memory write barrier."
>
> I can see that doing that would be safe, but I don't think following
> those rules is actually necessary in the general case. Following those
> rules would cause lots of unnecessary barriers in code.
>
> Barriers shouldn't be used arbitrarily at the start/end of ISRs, but
> rather at specific chosen locations in the code that actually need to
> enforce some kind of memory ordering.

According to the architecture docs, if you don't RMB at the start of
your ISR, then the following timeline could get the wrong values:

some other device driver               our isr
=2D-----------------------               -------
rmb()
read from device
                                       read from device
                                       examine value read
                                       exit isr
examine value raed.

The ISR could get the device driver's value.  This is made explicit in
footnote 2 on page 7.

>> So it seems like the IRQ handler at least wants:
>>=20
>> diff --git a/drivers/mailbox/bcm2835-mailbox.c
>> b/drivers/mailbox/bcm2835-mailbox.c index 604beb7..7e528f6 100644=20
>> --- a/drivers/mailbox/bcm2835-mailbox.c +++
>> b/drivers/mailbox/bcm2835-mailbox.c @@ -88,6 +88,13 @@ static
>> irqreturn_t bcm2835_mbox_irq(int irq, void *dev_id) struct
>> bcm2835_mbox *mbox =3D (struct bcm2835_mbox *) dev_id; struct device
>> *dev =3D mbox->dev;
>>=20
>> +	/* +	 * BCM2835-ARM-Peripherals.pdf says "If an interrupt
>> routine +	 * reads from a peripheral the routine should start with
>> a +	 * memory read barrier." +	 */ +	rmb(); + while
>> (!(readl(mbox->regs + MAIL0_STA) & ARM_MS_EMPTY)) { u32 msg =3D
>> readl(mbox->regs + MAIL0_RD); unsigned int chan =3D MBOX_CHAN(msg);=20
>> @@ -100,7 +107,6 @@ static irqreturn_t bcm2835_mbox_irq(int irq,
>> void *dev_id) mbox_chan_received_data(mbox->channel[chan].link,=20
>> (void *) MBOX_DATA28(msg)); } -	rmb(); /* Finished last mailbox
>> read. */ return IRQ_HANDLED; }
>
> In this case, I don't think neither the original barrier is needed,
> nor the extra one you added.

Your formatting got completely destroyed here.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJU+gdGAAoJELXWKTbR/J7ov+EP/1VKxaNhrHUs/g66zSHmH2Ye
lBHm4UCuFp+z6zbjPc0YPXTVqY6aO9/i4/BZ/ZDCl/8DuZyy294P1m+9yJMfLYMl
Dach4TBPLjNYwOhwtbATVA8Fyb2mgdFQDcfFfkVuCk6+mHii83dZn1SZCPhYO+3Q
o2KXKRAr+BYwxpjJN3DQIM4R02d2s859ctj4rhaapE+eS1Lmu2H2tbErBZZZgrXv
jaJugWfXvorOwHGU8wec6DOvuWD7Wlm4hOiRu6AJ6i8wgBZcWu5jfZgwxzX5oo3O
sTgD9h31Kh8cYisMPP6kAPooH+Pufxpah4NyMblXkaRclSqMRK87juZDc6a1u38f
aHw5ggfMh1t2ed6m425aKcvJbuTXzrILwsv8JQdNVtj8zoSLbhNNiS52nFC4IGGG
fgJmrhXRDU2uDPlS8jP5b0BxzBYN8U3H4ayqZ3k9RSIcRvU7wNT2KTE79pfO7b0a
kyF79FOIPqNDLppcyQ+FPraMgnb8NfShyRV5fwO1SdJ5E1up0ANLkDVa/iGyurgM
fnM0I8fWapbDFGdqG20IsnbXByjAgMjRzVpeeWGYtiXlFsLGwAFBmVOKUFTHWRcw
kKU+crrA5xFATIo7dsEBMQyacUVaB71TVUChG6VzgU2Im/rmeWM1D7rfz6oq+29L
GL7C29tAnenuZIWQTnvb
=S7oV
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
