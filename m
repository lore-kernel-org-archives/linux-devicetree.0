From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 2/4] drm/msm: drop qcom,chipid
Date: Mon, 30 Jan 2017 11:54:11 -0800
Message-ID: <8737g0s4rg.fsf@eliezer.anholt.net>
References: <20170130164921.20744-1-robdclark@gmail.com>
 <20170130164921.20744-3-robdclark@gmail.com>
 <874m0gifmf.fsf@eliezer.anholt.net>
 <CAF6AEGuK9TCdRmyaj4tk3+uu5L5Xvf1T3Kz8gZynX331VqSMfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2051372683=="
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAF6AEGuK9TCdRmyaj4tk3+uu5L5Xvf1T3Kz8gZynX331VqSMfA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============2051372683==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On Mon, Jan 30, 2017 at 1:09 PM, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> wrote:
>> Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>
>>> The original way we determined the gpu version was based on downstream
>>> bindings from android kernel.  A cleaner way is to get the version from
>>> the compatible string.
>>>
>>> Note that no upstream dtb uses these bindings.  But the code still
>>> supports falling back to the legacy bindings (with a warning), so that
>>> we are still compatible with the gpu dt node from android device
>>> kernels.
>>
>> The gpulist[] seems pretty short, like you could just have 7 compatible
>> strings in dt_match[] and point them directly at corresponding the
>> gpulist[] entry.  Or are there lots of patch levels, with the same
>> struct adreno_info values?
>
> The list currently is rather incomplete (which may or may not matter,
> I guess it comes down to how many different phones/tablets out there
> people try to get an upstream kernel working on).  And it has those
> ANY_ID wildcard entries.
>
> A full list of all the gpu's including all their patchlevels would be
> quite long.
>
> We might end up wanting to split the quirks out differently, since
> those tend to apply to specific patchlevel's.. I had to change the
> existing entry for a530 from a530.* to a530.2 for this reason.  But
> that won't effect the bindings so that is an implementation detail we
> can worry about later.

I think that using the of_match_device() mechanism from the specific
strings listed as the compatible would make more sense than this string
parsing.  You have to write a gpulist[] entry anyway for the module to
load.  So that means adding about 7 values today to the compatible
string dt_match, and the code to use of_match_device() to get your
struct adreno_info.  Then the current version number lookup loop would
be just for the old DT compatibility and there's no string parsing.

However, it's your driver.  The code seems correct, and using specific
compatible strings is an obviously good step.

Reviewed-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAliPmeQACgkQtdYpNtH8
nuglGRAAo8NARAA/R7d+h5FV50e24MOJ87fDnwsMz2rYmbmCNiLP0tNivoZ7UBuO
5di2cSvhp7BHcmR0ZA++ajl/zPVVg/Xr8SnKd6+3m09Bo+aD6nUEEFXGWoj6qjl1
0cvzNpA+4edMBx6IElVzC7RSgRxYupCjQVtXTnJ/aUM7oTL9fRlSjUvXvCMjHO++
URCvZc6ZbEEmbt/80b2KgoN2ihVSqCtY3U/y4Kr+UMDNrVNya4T+sN4km38ayrdW
mSSp4Aw9ebX54+wQlEzHxpV9Zi5GSB9NcfXo/lXSdw9/tY1YSvee/7VW+pO/PKN3
l2DNOI1mszLnhY3XFsrNfgDVHggAgdVCdd9/nRrxhys3nfuXDllS+9iuoaK1cap1
1usBbY+ZidNdgBvuioDhO8GwaN37C5pXNeIXBws9UmUWXzoEVbGzr89NxUw11icW
RPa4UTpFtXnvGS7nnEIXb8w1FRcFr/i9E6RbdkZHJNUHUpMLu3OuJzb7DcXEho9E
GrnV2auxFu7790Oq5BzBmcEpEEEooxAU+J/R0VU/LJdo+wMJw6OlAzsg34ChnHDO
fQHVptvBqQuZ8LwA4PO55xgch9ERG2gt51Ik02/VhQKhZjjERQtHYaDg1Ah/DWb5
+oEVOeG9xkkwajH2C/tb/7Ddzo8zN97djhyf9I1r7s44u2mrlN8=
=168U
-----END PGP SIGNATURE-----
--=-=-=--

--===============2051372683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5v
IG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCg==

--===============2051372683==--
