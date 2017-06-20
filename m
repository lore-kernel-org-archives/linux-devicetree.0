From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 1/7] drm/bridge: Support hotplugging panel-bridge.
Date: Tue, 20 Jun 2017 10:31:03 -0700
Message-ID: <871sqe7ei0.fsf@eliezer.anholt.net>
References: <20170615204130.19255-1-eric@anholt.net> <20170615204130.19255-2-eric@anholt.net> <777ee1b1-e5ce-ea29-8a48-f792354a22d1@codeaurora.org> <871sqkouvr.fsf@eliezer.anholt.net> <8e148170-b626-b426-3c94-b93d2746f4ce@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8e148170-b626-b426-3c94-b93d2746f4ce-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> writes:

> On 06/16/2017 08:13 PM, Eric Anholt wrote:
>> Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> writes:
>>=20
>>> On 06/16/2017 02:11 AM, Eric Anholt wrote:
>>>> If the panel-bridge is being set up after the drm_mode_config_reset(),
>>>> then the connector's state would never get initialized, and we'd
>>>> dereference the NULL in the hotplug path.  We also need to register
>>>> the connector, so that userspace can get at it.
>>>>
>>>
>>> Shouldn't the KMS driver make sure the panel-bridge is set up before
>>> drm_mode_config_reset? Is it the case when we're inserting the
>>> panel-bridge driver as a module?
>>>
>>>
>>> All the connectors that have been added are registered automatically
>>> when drm_dev_register() is called by the KMS driver. Registering a
>>> connector in the middle of setting up our driver is prone to race
>>> conditions if the userspace decides to use them immediately.
>>=20
>> Yeah, this is fixing initializing panel_bridge at DSI host_attach time,
>> which in the case of a panel module that creates the DSI device
>> (adv7533-style, like you said I should use as a reference) will be after
>> drm_mode_config_reset() and drm_dev_register().
>
> Okay. In the case of the msm kms driver, we defer probe until the
> adv7533 module is inserted, only then we proceed to drm_mode_config_reset=
()
> and drm_dev_register(). I assumed this was the general practice followed =
by
> most kms drivers. I.,e the kms driver defers probe until all connector
> related modules are inserted, and only then proceed to create a drm devic=
e.

The problem, though, is the panel driver needs the MIPI DSI host to
exist to call mipi_dsi_device_register_full() during the probe process.
The adv7533 driver gets around this by registering the DSI device in the
bridge attach step, but drm_panel doesn't have an attach step.

Another alternative is my original version of the panel driver that was
a mipi_dsi_device driver that registered the panel during the DSI device
probe.  That's why vc4's panel lookup is during the MIPI DSI attach
phase, currently.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAllJW9cACgkQtdYpNtH8
nujIkBAAjFal5QtoS38bBoOiWGeEkS2g1Oj9TVb6tBc7RpVrKhYv9oLOGonKhZdW
PXjxiciS28BsXveen8hqVXDf4LAI1C+qyApKF+EPW2cd5x803xW/1h5uTW9x/9qK
Y7skPOa4jeR3MxWoWgykm1BvRWWlmnxIoqJVS4QW6+l7XjY18uHZmknmweyNeGuW
aq9CBfsGK2l0EWHHJeFl6/8vmkXT5RtE5f7FBde+xzJg+OMWI+JZJhgeItS952fL
dhvoBBU6sV2awJqiZrVseRjfsfjIXGbm9m2OaELDGhLbqxEsx4QzWFBXQ6mJH/Hk
IKOoFOk/6174BHTzJHhIxzzBoMY1gC3uuaxNELVK5d7CAcLjp9V4vUzZJQ0ixKnT
to7Dp9t0FhwyZ0NIfox7jrXJnFprdnb2T1y0ovKM8IrEKx0AANFUteRRRvIClg5R
BmWxUrTokDMfxdJpOStyp9pfnMIiLS6BV/a3kZojSE/tn8Te2aXWWONMvt0m/D+d
wVe/PNXXH5m4M8J1uwztNmZ5fLpklwrwnd/tyXsz+ndK8ahE/p0Lcs92sf1MYRv7
R0YOGaqqlCP9Fo7yrj8OPOlII7oyPPYOYEWMJ4mwK1mW1wNNwEvEX7hKLpoUm3ut
KykBf4TtLGZbYHNSBMH+tOP+5iaaa5BSDBtyVQkvQSXVc8yr0IU=
=UVhj
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
