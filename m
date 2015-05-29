From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 2/7] ARM: bcm2835: Add a Raspberry Pi-specific clock driver.
Date: Fri, 29 May 2015 12:30:36 -0700
Message-ID: <87k2vrchb7.fsf@eliezer.anholt.net>
References: <1431978219-14226-1-git-send-email-eric@anholt.net> <1431978219-14226-3-git-send-email-eric@anholt.net> <55679085.6040402@wwwdotorg.org> <20150528224828.GI24204@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150528224828.GI24204-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> writes:

> On 05/28, Stephen Warren wrote:
>> On 05/18/2015 01:43 PM, Eric Anholt wrote:
>> > Unfortunately, the clock manager's registers are not accessible by the
>> > ARM, so we have to request that the firmware modify our clocks for us.
>> >=20
>> > This driver only registers the clocks at the point they are requested
>> > by a client driver.  This is partially to support returning
>> > -EPROBE_DEFER when the firmware driver isn't supported yet, but it
>> > also avoids issues with disabling "unused" clocks due to them not yet
>> > being connected to their consumers in the DT.
>>=20
>> It looks like you forgot to CC the clock subsystem maintainers:
>>=20
>> M:      Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> M:      Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>>=20
>
> Thanks, except I don't have the full patch context here to review
> the patch.
>
>> The description above sounds like a neat solution, but has the
>> disadvantage that the clocks without a client won't show up in debugfs.
>> I wonder if the clock maintainers know of a better way?
>
> Can you mark them as CLK_IGNORE_UNUSED? The probe defer problem
> has a solution in sight (see more below).

>> > +	init.flags =3D CLK_IS_ROOT;
>>=20
>> Is it possible to add clock parent information to the driver, so the
>> clocks are all hooked together into the correct tree, rather than all
>> looking like root clocks?
>>=20
>> One of the many reasons I didn't do anything FW-wise for the kernel was
>> the hope that such information would be forthcoming, and hence we could
>> have complete kernel drivers.
>>=20
>> > +void __init rpi_firmware_init_clock_provider(struct device_node *node)
>> > +{
>> > +	/* We delay construction of our struct clks until get time,
>> > +	 * because we need to be able to return -EPROBE_DEFER if the
>> > +	 * firmware driver isn't up yet.  clk core doesn't support
>> > +	 * re-probing on -EPROBE_DEFER, but callers of clk_get can.
>>=20
>> Oh, that's nasty. What would it take to fix the clock core to support
>> deferred probe? It really should.
>
> There are patches to support probe defer from clk_get() but they
> stalled because sunxi is needs to keep clocks on from their
> providing driver (termed "critical clocks"). If we can resolve
> the "critical clocks" thing then we should be able to support
> probe defer, unless we find other users of orphaned clk
> pointers.

Great!  I'm certainly happy to switch to a normal registration of all my
clocks once -EPROBE_DEFER works from the clock provider init.

If those patches aren't landing this release, that also gives us a
release to wire up all the clock consumers in the DT before we get hit
by stable DT ABI, so we'll be able to give a nice limited set of
CLOCK_IGNORE_UNUSED in the flags when we transition.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVaL5cAAoJELXWKTbR/J7o6SAQAJg6jtlgbZTVYIlbJtAIhH4w
uBa978+CoZh7/ZRu1kwheFxGJ9+QRauBEYh0NdmwAZMMt2mpzhx/w92w0PhzFKGF
qPcUzWIzVKtxc7YiNYk6XuftNgoZyzoN2OcGShQKUm8GHu6jUR1A7WSnDU8XCQ3K
FQLl687RVDa2hV9160xrXhWF5cA4frMF73QtOxypRaNqiBvsh5lBJaxW2tsSrWtL
k+3H+L1LF+XZz1Xmycm7StRH1ty8UatffWezu5A6UBN07FogKvt/DdoNjazwImsD
1BsJTrT+qpPxlFBLmldcOS9HYmE+z9ULAmOEA6yLL8Cmc8XktUvTEH86cL2yLb8d
D5OvZSZsKNeO6bgG8w/EoBi4bW8WZBx+Ffka48dqFYIm7YiTgacwP997hg/oJwoa
m/njncWSfSZt+4dWML7Dy/khv5qsUhy5lMZqir8lxQ81CEqejYdOZdwpDJrn2TnL
Cbm9tdsrdxt1MjilF9uz/IBeY/hRi0YtQvTsm21vNxPjY+xZ0k//su9aOMP2oM/x
NybxgrW1XNYfOXSf2NjYEvMKkZ/Zd4CfHx2TAUhBPq2MRkFslzVmyr2qksHYoblF
y8zlpySNTL+TEDEE5uHDsZCCV3nwWKo/hwpkuot+6l5udJonAO00DtQAzx7KBkmK
0gCU4pFQDfvXLPI7U0fd
=PFn0
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
