From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 1/7] drm/bridge: Support hotplugging panel-bridge.
Date: Fri, 23 Jun 2017 14:50:58 -0700
Message-ID: <87o9te1igt.fsf@eliezer.anholt.net>
References: <20170615204130.19255-1-eric@anholt.net>
 <20170615204130.19255-2-eric@anholt.net>
 <777ee1b1-e5ce-ea29-8a48-f792354a22d1@codeaurora.org>
 <871sqkouvr.fsf@eliezer.anholt.net>
 <8e148170-b626-b426-3c94-b93d2746f4ce@codeaurora.org>
 <871sqe7ei0.fsf@eliezer.anholt.net>
 <CA+M3ks6T5aXjVuiYirw+j0UMt-x6tPjoeBXfOTAH8DXQNW-5sA@mail.gmail.com>
 <dd33044e-46d6-6f33-1011-b0bc343ddc96@codeaurora.org>
 <20170622112332.7ec7b65c@bbrezillon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1106895685=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170622112332.7ec7b65c@bbrezillon>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja <architt@codeaurora.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Philippe Cornu <philippe.cornu@st.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
List-Id: devicetree@vger.kernel.org

--===============1106895685==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

> On Thu, 22 Jun 2017 13:47:43 +0530
> Archit Taneja <architt@codeaurora.org> wrote:
>
>> On 06/22/2017 01:20 PM, Benjamin Gaignard wrote:
>> > 2017-06-20 19:31 GMT+02:00 Eric Anholt <eric@anholt.net>:=20=20
>> >> Archit Taneja <architt@codeaurora.org> writes:
>> >>=20=20
>> >>> On 06/16/2017 08:13 PM, Eric Anholt wrote:=20=20
>> >>>> Archit Taneja <architt@codeaurora.org> writes:
>> >>>>=20=20
>> >>>>> On 06/16/2017 02:11 AM, Eric Anholt wrote:=20=20
>> >>>>>> If the panel-bridge is being set up after the drm_mode_config_res=
et(),
>> >>>>>> then the connector's state would never get initialized, and we'd
>> >>>>>> dereference the NULL in the hotplug path.  We also need to regist=
er
>> >>>>>> the connector, so that userspace can get at it.
>> >>>>>>=20=20
>> >>>>>
>> >>>>> Shouldn't the KMS driver make sure the panel-bridge is set up befo=
re
>> >>>>> drm_mode_config_reset? Is it the case when we're inserting the
>> >>>>> panel-bridge driver as a module?
>> >>>>>
>> >>>>>
>> >>>>> All the connectors that have been added are registered automatical=
ly
>> >>>>> when drm_dev_register() is called by the KMS driver. Registering a
>> >>>>> connector in the middle of setting up our driver is prone to race
>> >>>>> conditions if the userspace decides to use them immediately.=20=20
>> >>>>
>> >>>> Yeah, this is fixing initializing panel_bridge at DSI host_attach t=
ime,
>> >>>> which in the case of a panel module that creates the DSI device
>> >>>> (adv7533-style, like you said I should use as a reference) will be =
after
>> >>>> drm_mode_config_reset() and drm_dev_register().=20=20
>> >>>
>> >>> Okay. In the case of the msm kms driver, we defer probe until the
>> >>> adv7533 module is inserted, only then we proceed to drm_mode_config_=
reset()
>> >>> and drm_dev_register(). I assumed this was the general practice foll=
owed by
>> >>> most kms drivers. I.,e the kms driver defers probe until all connect=
or
>> >>> related modules are inserted, and only then proceed to create a drm =
device.=20=20
>> >>
>> >> The problem, though, is the panel driver needs the MIPI DSI host to
>> >> exist to call mipi_dsi_device_register_full() during the probe proces=
s.
>> >> The adv7533 driver gets around this by registering the DSI device in =
the
>> >> bridge attach step, but drm_panel doesn't have an attach step.=20=20
>>=20
>> I'm not sure how we can get around this. We had discussion about this on=
 irc
>> recently, but couldn't come up with a good conclusion. We could come up =
with a
>> panel_attach() callback to make it similar to bridges, but that's just u=
s avoiding
>> the real issue.
>
> How about making DSI dev registration fully asynchronous, that is, DSI
> devs declared in the DT under the DSI host node will be
> registered/attached at probe time, and devs using another control bus
> (like the adv7533 controller over i2c) will be registered afterwards.
>
> That implies moving the drm_brige registration logic outside of the DSI
> host ->probe() path. The idea would be to check if all devs connected
> to the DSI bus are ready at dsi_host->attach() time. If they are, we
> can finally register the XXX -> DSI bridge. If they're not (because
> some devs connected to the DSI bus have not been probed yet), then we
> do not register the drm_bridge and wait for the next dsi_host->attach()
> event.
>
> With this solution, I think we can avoid the chicken&egg problem where
> the adv7533 dev is waiting for the DSI host to be probed to be able to
> register a DSI dev with mipi_dsi_device_register_full() and the DSI
> host needs all devs to be registered to not return -EPROBE_DEFER.

I've now tried having mipi_dsi_device_register_full() succeed early and
just do the device-add part when the host shows up.  The problem is
there's still mipi_dsi_attach(), which needs to be delayed until the
panel driver fills in the rest of mipi_dsi_device's fields.  Why aren't
those part of the info?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAllNjUIACgkQtdYpNtH8
nujQbQ/7BXphichzL1i+SyppMwIs+vHCJzIJL2dy59y+HVGE3TqrNSoKZdXkaqTI
sSq7aacLY4gexqr6kTeWkm/mD0iNQfpcEtEm3vgkNWBptXYkobafVFoixJac5UwR
K0FPXAl2+Ksr2YMzkZOP+tW7/lbDeK03TFOjQNK3TdqdcvebT6OHfxAK77BIKnu7
yMqQbZLzJ7idT0rC13JWQYSnMjOMk7kXQ22Vka+2te11POmibYvVYQJXOFcqBsbq
9LcuNiEF8J1896hB7Uexv7/kzmWQWTxC2K2wVD3q31D4LRrfWyJ8dfKve7hIhJZd
/Ua745HqgQu1XdNRQYo0c7ZYFX0DsfFoozGUWqGNaIl2A+aVe9XVJwt6gnVvS36Q
f7W5O6F3EfoJktbdeH4rDARfs7t+kCaCOqIYvyLrYF4/cV7AdsZylV6foD/JO5Ce
NKXVXABsBxgkLLkUjctlwGxvuY0JIdKjR5Wf9/net7u4tq7LqsaNNEMQCMhZmrsN
cJzwE3YdStJkNlJl/mBE+EfdhkEiWUdhTTJxBMs2RVbIcMO53PLlH5QLIGmXitFo
rzOztv66ZvDqZdS+TjlZsnO3zv6C5/UoKhOjpspqo1BdiA21o8AKn2SL+XyJSstR
e7xprtEXxSpmGtb6zwU2vAIt18gNkEtzN+/poTEEbNlZbCdzr4c=
=7OJ1
-----END PGP SIGNATURE-----
--=-=-=--

--===============1106895685==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1106895685==--
