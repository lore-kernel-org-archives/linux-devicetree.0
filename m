From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 1/7] drm/bridge: Support hotplugging panel-bridge.
Date: Fri, 23 Jun 2017 14:36:20 -0700
Message-ID: <87r2ya1j57.fsf@eliezer.anholt.net>
References: <20170615204130.19255-1-eric@anholt.net>
 <20170615204130.19255-2-eric@anholt.net>
 <777ee1b1-e5ce-ea29-8a48-f792354a22d1@codeaurora.org>
 <871sqkouvr.fsf@eliezer.anholt.net>
 <8e148170-b626-b426-3c94-b93d2746f4ce@codeaurora.org>
 <871sqe7ei0.fsf@eliezer.anholt.net>
 <CA+M3ks6T5aXjVuiYirw+j0UMt-x6tPjoeBXfOTAH8DXQNW-5sA@mail.gmail.com>
 <dd33044e-46d6-6f33-1011-b0bc343ddc96@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1791004464=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <dd33044e-46d6-6f33-1011-b0bc343ddc96@codeaurora.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Archit Taneja <architt@codeaurora.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Philippe Cornu <philippe.cornu@st.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

--===============1791004464==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Archit Taneja <architt@codeaurora.org> writes:

> On 06/22/2017 01:20 PM, Benjamin Gaignard wrote:
>> 2017-06-20 19:31 GMT+02:00 Eric Anholt <eric@anholt.net>:
>>> Archit Taneja <architt@codeaurora.org> writes:
>>>
>>>> On 06/16/2017 08:13 PM, Eric Anholt wrote:
>>>>> Archit Taneja <architt@codeaurora.org> writes:
>>>>>
>>>>>> On 06/16/2017 02:11 AM, Eric Anholt wrote:
>>>>>>> If the panel-bridge is being set up after the drm_mode_config_reset=
(),
>>>>>>> then the connector's state would never get initialized, and we'd
>>>>>>> dereference the NULL in the hotplug path.  We also need to register
>>>>>>> the connector, so that userspace can get at it.
>>>>>>>
>>>>>>
>>>>>> Shouldn't the KMS driver make sure the panel-bridge is set up before
>>>>>> drm_mode_config_reset? Is it the case when we're inserting the
>>>>>> panel-bridge driver as a module?
>>>>>>
>>>>>>
>>>>>> All the connectors that have been added are registered automatically
>>>>>> when drm_dev_register() is called by the KMS driver. Registering a
>>>>>> connector in the middle of setting up our driver is prone to race
>>>>>> conditions if the userspace decides to use them immediately.
>>>>>
>>>>> Yeah, this is fixing initializing panel_bridge at DSI host_attach tim=
e,
>>>>> which in the case of a panel module that creates the DSI device
>>>>> (adv7533-style, like you said I should use as a reference) will be af=
ter
>>>>> drm_mode_config_reset() and drm_dev_register().
>>>>
>>>> Okay. In the case of the msm kms driver, we defer probe until the
>>>> adv7533 module is inserted, only then we proceed to drm_mode_config_re=
set()
>>>> and drm_dev_register(). I assumed this was the general practice follow=
ed by
>>>> most kms drivers. I.,e the kms driver defers probe until all connector
>>>> related modules are inserted, and only then proceed to create a drm de=
vice.
>>>
>>> The problem, though, is the panel driver needs the MIPI DSI host to
>>> exist to call mipi_dsi_device_register_full() during the probe process.
>>> The adv7533 driver gets around this by registering the DSI device in the
>>> bridge attach step, but drm_panel doesn't have an attach step.
>
> I'm not sure how we can get around this. We had discussion about this on =
irc
> recently, but couldn't come up with a good conclusion. We could come up w=
ith a
> panel_attach() callback to make it similar to bridges, but that's just us=
 avoiding
> the real issue.
>
>>>
>>> Another alternative is my original version of the panel driver that was
>>> a mipi_dsi_device driver that registered the panel during the DSI device
>>> probe.  That's why vc4's panel lookup is during the MIPI DSI attach
>>> phase, currently.
>>=20
>
> This would require you to have a DSI device node in DT, rather than an i2c
> node, right? I don't know if we should do that because of a limitation in
> our drm_mipi_dsi and drm_panel frameworks.

All versions of this patch have had one of those, because either that's
where you attach the driver (the first, no-core-changes version of the
driver) or you need it for the of-graph connections anyway.  These later
versions just haven't had a compatible string on the DSI device node.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAllNidQACgkQtdYpNtH8
nui1rhAAil5Z8ScP+p9wDgqnFBCBJWEkVMvrpgYuqGPRmuYlnbORvHUNYUPFMmrm
g0fbSqD4uWn54mHqDgaNrXMU2GdwA1VRu5Ie0jp5sNbU0JHG/sROc8bh2DmatPyr
j0u50fuQ5Noo2lleHi7M/MNug8KNfSxELqm4Zl2roS8rYMEjnMRODWbuW3RHUtze
9Y5rQ3+DewdnbGZgS8qqqo98sA1s1puEDGMjKejhATnc1cwFhBqMpux/npk7n38c
KQyP9Lg5vof2Qm9CA5SJtyQQmp8V9nNlYGo89OdYG+XS+FJXmBTZAWRW4lK5dg5q
SZpyIZBEioBIlzDH7l5LLK0CRQZQP2AALTz6+RHXFHapMerHVuU+ZUUqMD7Pvdqy
syF7Yxm85f9DqG2wjSDhd+cooarb/mxC8yvCdcHi1tYY9GS8xgNXnIgFgxkpISVe
zFgZ3ObYkK9FojrXWMm102T9Hbg9hkVwo9Xhp/HgBjT0yKQiF+DAqDkuaqg2/va1
iFPq77serv4ox+PLDGTF2GWOauHz0U4LRHI3EZOPe/l+Z8UO8x8LpH0HhYrwb7oE
Q/igFS/xggE1pPsfs2Nj/2tWF/ezYYk1w2JvphyBNVIa2iR+W6xiXIab6PhIlEpz
R/MZW/uPcq3PTUb1wV2a0DLDqiZacGO7uEG7D9J8Xpj1gZb+w04=
=iciD
-----END PGP SIGNATURE-----
--=-=-=--

--===============1791004464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1791004464==--
