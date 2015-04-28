From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 2/3 v5] mailbox: Enable BCM2835 mailbox support
Date: Tue, 28 Apr 2015 12:49:11 -0700
Message-ID: <87618g6nk8.fsf@eliezer.anholt.net>
References: <1430173644-19099-1-git-send-email-eric@anholt.net> <1430173644-19099-3-git-send-email-eric@anholt.net> <CABb+yY2u_v1uSDrBgP2DRAOrDkXETfs_zmLACm=uRFALVYFjmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABb+yY2u_v1uSDrBgP2DRAOrDkXETfs_zmLACm=uRFALVYFjmA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On Tue, Apr 28, 2015 at 3:57 AM, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> wrote:
>> From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
>>
>> Implement BCM2835 mailbox support as a device registered with the
>> general purpose mailbox framework. Implementation based on commits by
>> Lubomir Rintel [1], Suman Anna and Jassi Brar [2] on which to base the
>> implementation.
>>
>> [1] http://lists.infradead.org/pipermail/linux-rpi-kernel/2013-April/000528.html
>> [2] http://lists.infradead.org/pipermail/linux-rpi-kernel/2013-May/000546.html
>>
> We could probably drop the history from changelog. Just talk about
> what the controller is and any specifics of the driver.

How about:

"This mailbox driver provides a single mailbox channel to write 32-bit
values to the VPU and get a 32-bit response.  The Raspberry Pi firmware
uses this mailbox channel to implement firmware calls, while Roku 2
(despite being derived from the same firmware source) doesn't."

>
>> Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
>> Signed-off-by: Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>
>> Signed-off-by: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
>> Signed-off-by: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
> How come it has my s-o-b?

The patch had your s-o-b on it when I started working on it:

http://lists.infradead.org/pipermail/linux-rpi-kernel/2014-October/001006.html

Presumably from:

http://lists.infradead.org/pipermail/linux-rpi-kernel/2013-September/000692.html

I don't see your interaction in the cite for you, though, so if you'd
like the s-o-b removed, I'm happy to do so.  It's been an awfully long
time in development for this driver, with enough revisions, I figured I
just hadn't found where your involvement exactly was.

>> diff --git a/drivers/mailbox/bcm2835-mailbox.c b/drivers/mailbox/bcm2835-mailbox.c
>> new file mode 100644
>> index 0000000..6910c71
>> --- /dev/null
>> +++ b/drivers/mailbox/bcm2835-mailbox.c
>> @@ -0,0 +1,220 @@
>> +/*
>> + *  Copyright (C) 2010 Broadcom
>> + *  Copyright (C) 2013-2014 Lubomir Rintel
>> + *  Copyright (C) 2013 Craig McGeachie
>> + *
> You may want to make it 2015

At this point I've probably done enough to merit adding a 2015 for
Broadcom.  Done.

>> +/* Status register: FIFO state. */
>> +#define ARM_MS_FULL            0x80000000
>> +#define ARM_MS_EMPTY           0x40000000
>>
> nit:  BIT(31) and BIT(30)
>
>> +
>> +/* Configuration register: Enable interrupts. */
>> +#define ARM_MC_IHAVEDATAIRQEN  0x00000001
>>
> nit: BIT(0)

Works for me.

>> +
>> +struct bcm2835_mbox {
>> +       struct device *dev;
>> +       void __iomem *regs;
>> +       spinlock_t lock;
>> +       bool started;
>> +       struct mbox_controller controller;
>> +};
>> +
>> +struct bcm2835_mbox *mbox;
>> +
> Bad omen. You assume any platform will ever have just one instance of
> the mailbox controller. Which may come true, but still is a taboo to
> think of.

On the other hand, when I've submitted to other subsystems people have
complained about how I have these extra lookups/container_ofs, instead
of just storing the obviously-only-one-of-them thing in a global.

I think a global makes definite sense for this driver.  But if I have to
go readd the code I had cleaned up, to act like there might be more than
one, I could.

>> +       struct mbox_chan *link = &mbox->controller.chans[0];
>> +
>> +       while (!(readl(mbox->regs + MAIL0_STA) & ARM_MS_EMPTY)) {
>> +               u32 msg = readl(mbox->regs + MAIL0_RD);
>> +
>> +               if (!mbox->started) {
>> +                       dev_err(dev, "Reply 0x%08x with no client attached\n",
>> +                               msg);
>>
> This shouldn't happen unless the remote could send asynchronous
> commands to Linux. And even if it does, we shouldn't be seeing them
> before we are ready. Please move the "Enable the interrupt on data
> reception" from probe to bcm2835_startup(), and disable interrupts in
> bcm2835_shutdown()

Done.

>> +static int bcm2835_send_data(struct mbox_chan *link, void *data)
>> +{
>> +       int ret = 0;
>> +       u32 msg = *(u32 *)data;
>> +
> Sorry, this is seen as an abuse. Please pass pointer to a u32 and not
> typecast the value.

This is a pointer to a u32 being passed in.  I think you misread, or I'm
misunderstanding you.

>> +       if (!mbox->started)
>> +               return -ENODEV;
>>
> This 'started' flag is unnecessary. API won't call send_data() before
> startup() or after shutdown().

Dropped.

>> +       if (readl(mbox->regs + MAIL0_STA) & ARM_MS_FULL) {
>> +               ret = -EBUSY;
>> +               goto end;
>> +       }
>>
> This check is unnecessary too. API would have already called
> last_tx_done() already to make sure this never hits.

Dropped.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVP+Q3AAoJELXWKTbR/J7oQ/UP/1BZaX4HRphqhgrLcErVMS4W
dyHRGbEqSQtqWmWNOL0grJ54mz3wojlCitQ0btLxfcnns+C87RFJ+QL6JhJ21pEx
KmKQQmfYG85oIeVhvCvmE+PgtFPJuK4UyvOPTFK1f46xRz+UAQdDgDrYB1w/YJda
b4dgb0u0psXrc8jVkK8Quox+qfxBjhd5cakcqExvu3V1Dh67nJyzz1/BLSFoRe1u
fWVLidcoLFXLT3p9OXLBH+Zigzk02bGWGl9TZcQM1sxWNQnGRk4kgdzFpMF32RyF
nUpIWGMQK3zSGI+Xb5gb5nhyFOD6QmB4xjxTrSgKF07kHyPGDNQqDnmGGu1Bq/jv
F1J9IBygZVlXygVhQsVoCP446PDgbvS2YEUlV9reRB8W3BmAOAplEYCHrRLAcY+g
7rOM4b+dzB4eXNvQ/lScDXxN/fbiMBWQySphqsl9n+qyBlXTY5n9d+rATjxu8VQT
+znoGqYpj7pIgrxmLVkZy4Y9CkU+n4G5IEvsxaDyqTOBSK1SMDDkkCVlYkyF+bR0
OEMCZZRscir1aAOxgxe0/APCskbM8fukkKfep6dWN7IwyeQVQfdAltFOcDI6fTms
pCsndyd1dIIoG9wifpDEiabcJ3ZBjaUWFihildq04V9mmvGz0aOVTA7X444GuW0t
sig94lkDz4+O+VRAFwdf
=B78l
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
