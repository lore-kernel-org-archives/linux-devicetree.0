From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 09/10] ARM: bcm2835: Add the mailbox property channel driver.
Date: Thu, 05 Mar 2015 11:54:41 -0800
Message-ID: <87vbif6wzi.fsf@eliezer.anholt.net>
References: <1425329684-23968-1-git-send-email-eric@anholt.net> <1425329684-23968-10-git-send-email-eric@anholt.net> <54F68352.5080108@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54F68352.5080108-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> On 03/02/2015 01:54 PM, Eric Anholt wrote:
>> Many of the operations with the firmware are done through this mailbox
>> channel pair with a specific packet format.  Notably, it's used for
>> clock control, which is apparently not actually totally possible to do
>> from the ARM side (some regs aren't addressable).  I need clock
>> control for the VC4 DRM driver, to turn on the 3D engine.
>
>> diff --git a/drivers/mailbox/bcm2835-mailbox-property.c b/drivers/mailbox/bcm2835-mailbox-property.c
>> +int bcm_mbox_property(void *data, size_t tag_size)
>
>> +	buf = dma_alloc_coherent(NULL, PAGE_ALIGN(size), &bus_addr, GFP_ATOMIC);
>> +	if (!buf)
>> +		return -ENOMEM;
>
> Can't the driver (this one or the client) maintain some persistent
> buffer rather than allocating/freeing a new one each time. It seems like
> the alloc/free might introduce quite some overhead?

The size of the buffer is arbitrary (up to 1MB), the frequency of
requessts is low, and the hardware's pretty starved for RAM.  However,
we're probably only ever going to see single page allocations, so the
RAM cost is probably low and the allocation time is probably also
correspondingly low (not like when I was trying to do 256k allocations
in the vc4 driver.  ouch).

>> +	writel(size, buf);
>> +	writel(bcm_mbox_status_request, buf + 4);
>> +	memcpy_toio(buf + 8, data, tag_size);
>> +	writel(bcm_mbox_property_end, buf + size - 4);
>
> Since this is just a regular chunk of RAM, can't the code just use
> regular memory writes and memcpy()?

will wmb() guarantee that the compiler won't optimize out my write to
buf[0] and corresponding read from buf[0]?  I was originally treating it
as RAM and using volatile, but then reread the old "don't use volatile"
doc.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJU+LSBAAoJELXWKTbR/J7oQ2QQAJ9ttiNLvO+WY2OLx0rXXDwM
FA6F60tMRgL5T009jnACQOc4/vSGk2eK3TiNArJetqSzCQCUWjjejSlxg6ZOWPNK
rUibXSJxLziJE3KS8iIg6H+Sxbmc1a6FtW/gnrfwyxL/rsFoNSW5MSvzg12ZAnas
QJaUKZi8+Kp7Mgh4AJ7yCIpxMnbzek5PuKQiIGmvzkq2+5HoxmkV742BcFNPtmiq
x3UnFMS857DsRHLFU/aifqBpPjDFYiYkVSsioexRIHR4EKMF8dfrnOQKftPZtliB
J6XxHTAJYb1KfnVkpwYzcg6HHTIq0pDN/R2lmkyHcFoaZmJrdcoma4O7mlUwhHUE
EurwsZri9tslUqaHysvEep75QpwCpgVeafIgyPhjJ0Z8Eyg+9nja/a0VMs9V9ite
8Yx9pauONH9RK9CwLJ2LQwAn+s6i77AgoATckx9Z1gpEHmIyO7SIIKFczxnaxhjM
QPbmZg66DFQzC9v6C+sn+ZlmxwVCLeaeE+Lpnqwo6qQgehPps/nTfoqB1WZrDF8k
IKzRc9H1aLFkLQvRP7HQRr8cpLNl9tLbZ/UqeKoCXUcrK+OnIOkPL+29Jneijn3S
P9bKnHbGD4H4bNvQ3qvMBYHq3vBjmoOgUe3BlX+9KHduF1UZ6gBfmzY9epoR9o/i
qPXkRDvpwMtRinHeaUK9
=QAg2
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
