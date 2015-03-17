From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 01/10] dt/bindings: Add binding for BCM2835 mailbox driver
Date: Tue, 17 Mar 2015 12:10:18 -0700
Message-ID: <87vbhzl9t1.fsf@eliezer.anholt.net>
References: <1425329684-23968-1-git-send-email-eric@anholt.net> <1425329684-23968-2-git-send-email-eric@anholt.net> <20150303080550.GF6976@x1> <87vbih98za.fsf@eliezer.anholt.net> <54F66FDD.2040409@wwwdotorg.org> <87egothkaf.fsf@eliezer.anholt.net> <55079AA0.5090904@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55079AA0.5090904-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> On 03/12/2015 05:23 PM, Eric Anholt wrote:
>> Device base maintainers weren't excited about my patch for
>> -EPROBE_DEFER, because then a new DT would mean we start failing to
>> probe the USB driver in an older kernel, which whould be a
>> regression in the case that the user had U-Boot setting up USB for
>> them.
>
> The main ABI issue is that old DTs should work with new kernels. The
> other way around is nice, but certainly not as strict a requirement. I
> don't think that should block a change. Do you have a link to the
> thread; I don't think I noticed it.

http://comments.gmane.org/gmane.linux.kernel/1906119

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVCHwaAAoJELXWKTbR/J7obO0P/1q7eMoAliAjvMYhlM1BAfdV
dK5a9Q6gFkz8p/kybUwrjJqwCXebwXhiAu4bFgHhBW1Reo0xJ5iNI0fa2s4658Ev
MU6OQ3odDfgAfX8sr5zu0C4x9ajEFZUYGn4pYOOmJsuOk56NbOzVY6rae8ero0ms
4LhTnkTKoRJluuwpQts7GfGVdmkcPU9L++cbjLGk2S2hL3ehp9h39oXcr7odLTTn
vsQkodEQi2xHQGrzCcpeP1ILjscYkMjGABOE0jmzc4p3oMDMfCFA6LeRB4SE95Iw
j5qH2Uj8xURURkRmvCF8hf77qNCoJOsp4kVen5HOdV2Hw/0f1c+cC5aaKh3lnIzk
mxXTMNfcM3aD4pq06LILfrcBwnpehpOGEcv0Y17OV4vmIPykD9saYrn3F0BY7h6h
sSbMl630FWOsUNUu/GbskWKLkVOU+bdX1VUWtUblXJP2/ZZpLHbVpOfgxh3/aOGx
i1MpgPNPKQy/nSjVWEb8TfhfqqUyI3uYMdwGBjjBktBKtSIpU6+LE+phRPeLnFP3
mbnA71KrM/ht2mpYv3w/qfcBXhhy5V7NSsQSdndXqBVt51MehPfWdsZg5ayfx2lk
iWGfKz36g7bICPZkBXg6mhfB1r7tQkSeN4RK1m0ee9iKkuhZJ+larhygqdyu5EIo
x7Lr26/gomA81JJtmj5F
=dVZ5
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
