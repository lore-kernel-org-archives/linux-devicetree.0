From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 1/3 v2] drm/vc4: Turn the V3D clock on at runtime.
Date: Tue, 18 Apr 2017 17:02:33 -0700
Message-ID: <87lgqx463q.fsf@eliezer.anholt.net>
References: <20170418191157.18517-1-eric@anholt.net> <20170418233805.15767-1-eric@anholt.net> <7906db2f-cfb8-e2e6-5869-b6e829dd8c6f@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7906db2f-cfb8-e2e6-5869-b6e829dd8c6f-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On 04/18/2017 04:38 PM, Eric Anholt wrote:
>> For the Raspberry Pi's bindings, the power domain also implicitly
>> turns on the clock and deasserts reset, but for the new Cygnus port we
>> start representing the clock in the devicetree.
>>=20
>> v2: Document the clock-names property, check for -ENOENT for no clock
>>     in DT.
>>=20
>> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
>> ---
>
>> +	if (v3d->clk)
>> +		clk_disable_unprepare(v3d->clk);
>
> The clock API allows you to pass a NULL clk and do nothing in these
> cases which is what you seem to have done a few lines below, you could
> simplify these checks?

Sounds good.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlj2qRkACgkQtdYpNtH8
nugyAw/+IwPyvsAqzBnI2+ZGbHc/lJJszAJ6b4D4yTmCP2ZQJsQBlU/FLBGNJS3d
OR1ziEBj1ipCeC8P4rAv3dHGLoKvIB6kx6SFvogTrEcARRvxuM8rI1vuPZaxYwt+
w8JEnWD/JOqQowYpqyoimxZLnEcrr2JSSz0CCt688Wj5y8SBgBDQT17C9i7hTl6X
oL6OgcsDPcqLARughQEl15k5yKil/zYmEEKxGbbN2UwZ5fr4z2ZgQioWnQaV+Yn1
int+dQ/eQ0y1YQ2o+WL4XLmcNg4ZYwpFum0QZAE9ixJE79q1Yybz36jO0P5dbM2h
jnFq3HUucr2CSCkTIWIv3PPSU/EaKVh5PiyhTN96AS/Ovvd9WlI7ZZJ5YXk0+cHv
V8I3UfKhB5zum/zAnvvLMeWl9WX9WuHzin9G5XpM2HE8NnGCMSRns7sodcJeO6+f
RL8DBy2AQHCe4qFFBeT96uBJwu7DiDvLhFETwOsJa7cYfLwSy08EVd8xeqBiXfxU
v51GVW5BliNqPIll0EEorzrnIaI89e2tjHmR5V5kqbcceg1A6+eZ6RULZXV23ePY
wwkJVwaT1/8r1FxjE/rsMSSKx8E7aLP804VAUDUN+16J9aCh5AvrQ2823Neo2LZL
Z8jhV+hP/mwVuyvAziVnqEfTAPDyCfa+HU81/L5zKg/cfvER1mE=
=6nG5
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
