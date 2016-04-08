From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 0/3] dmaengine: bcm2835: support dma channel 11 to 14
Date: Fri, 08 Apr 2016 11:37:23 -0700
Message-ID: <87zit4ymjg.fsf@eliezer.anholt.net>
References: <1458228273-15591-1-git-send-email-kernel@martin.sperl.org> <20160405170336.GB5392@vkoul-mobl.iind.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160405170336.GB5392-bQVUxfxUtC13uc1i7fC1zK2pdiUAq4bhAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> writes:

> On Thu, Mar 17, 2016 at 03:24:30PM +0000, kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org wrote:
>> From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
>>=20
>> Right now the dma engine officially supports dma channel 11 and 12.
>> But the use of dma channel 12 immediately stalls the system.
>>=20
>> The reason is that the interrupt assigned right now to dma channel 11
>> is actually a shared interrupt for dma channels 11 to 12.
>> So whenever the dma channel 12, 13 or 14 is used, it triggers the interr=
upt
>> for dma 11 which only clears the interrupt flag for dma channel 11.
>> This results in the interrupt 11 is triggered all the time.
>>=20
>> On top the requesting dma channel12 (and the corresponding irq) triggers
>> an immeditate stall of the system, because for the 12th interrupt
>> any dma channel will trigger also this interrupt - even if the dma chann=
el
>> is controlled by the firmware.
>>=20
>> As the description in the default device-tree is (for the above reasons)
>> wrong a new means had to get devised that allows correct representation
>> of the mapping between interrupts and dma channels.
>>=20
>> For this the existing (but unused) device-tree property "interrupt-names"
>> is used to define the mapping.
>
> This looks fine by me, need an ACK on ARM patch before this can be applie=
d.

This series is:

Acked-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXB/pkAAoJELXWKTbR/J7opx8P/1UCvt+Qz/JmYx8w6o1n/hw/
61iPwRRws1ZK+puW1oBQmMB9cXCom2W0d3OpcRuws1/+Wl+I9QuQi5+TSDUg3Yw7
NU296ydRgILCzL04J2UsIrS0zjPyRw9oHQNMd1yY+IfO8Kr72q3HkqmhI66fkSdI
3Om4irzgWYmg5DAjWnb4tZlO7dkKP0IoN927Ubh41JTRxDnLEH0nvjMO9vjiPwXh
EV58zPDPzSJtX+6lgu+cidlG6JWIqR8+S1KTzYbemZ7T+adUfnzcV/y44EWJbe/k
hOYW2DJsOtXqvLJ1tcg1d8FonrSYHYOAwUNY+ErUuB7hbmlwtRArUsNjPch2KE7M
oOh1Y3+J8hhPKSUu63L9l2L3eN+8h3MOqRvHrD1EW8/8B1Jq4DkCqFmDTQ3HTXZ3
JI34/UGXDazVYZ7mohW7iMiZnJY0rbshk/ppgFnG1nqUU/8PV0z89kW6NQp9c9sU
5f54Ks4OxSyHh/N+MFEeKuMGl3xqdM+j7Z3rcUoAG+0J52p+g9JsV9qXRR6I+yGN
SKdl1v9awyaNnRDpwA1KU2TGRxDJDpswDXdiT9HleTdo5PyrqMMJS1oeohQBv2uW
NQ3xKQ2uSjWPcCOKFwDhS0KkOzGbONEE+SvJavqdZkIaQ6tHDqb+DOQ/zPxvLhye
wyEpW696iqjWV1OXJ4Vz
=iXfL
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
