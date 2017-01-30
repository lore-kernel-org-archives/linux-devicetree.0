From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 1/4] drm/msm: remove qcom,
	gpu-pwrlevels bindings
Date: Mon, 30 Jan 2017 11:56:50 -0800
Message-ID: <87zii8qq2l.fsf@eliezer.anholt.net>
References: <20170130164921.20744-1-robdclark@gmail.com>
 <20170130164921.20744-2-robdclark@gmail.com>
 <87vaswh0i9.fsf@eliezer.anholt.net>
 <CAF6AEGt8mj8S+iv8aHVwyqm3f-5NhzmRv5Ajv5TmJXee5YLxVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1673043176=="
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAF6AEGt8mj8S+iv8aHVwyqm3f-5NhzmRv5Ajv5TmJXee5YLxVg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jordan Crouse <jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============1673043176==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On Mon, Jan 30, 2017 at 1:21 PM, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> wrote:
>> Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>
>>> The plan is to use the OPP bindings.  For now, remove the documentation
>>> for qcom,gpu-pwrlevels, and make the driver fall back to a safe low
>>> clock if the node is not present.
>>>
>>> Note that no upstream dtb use this node.  For now we keep compatibility
>>> with this node to avoid breaking compatibility with downstream android
>>> dt files.
>>>
>>> Signed-off-by: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Will we need the bus frequency knobs that I see in the old pwrlevels
>> node?  If so, what would the plan be for doing that within OPP?
>
> So, that I think is one of the open questions.  Jordan knows this
> stuff a lot better than I, but my understanding is that bus and clk
> scale *basically* independently, except that a given gpu clk we want a
> different minimum bus clk.
>
> (I'm not sure if that is a functional requirement, or just what qcom
> arrived at after performance tuning..)
>
> There is some work ongoing to get some sort of upstream bus scaling
> scaling, although I'm not really sure yet what the bindings for this
> would look like.
>
> So basically short answer is "I don't know.. there are too many open
> questions".  Maybe in the end we re-introduce qcom,gpu-pwrlevels.  But
> I think for now the approach of not documenting it and have safe/slow
> clk fallback in the driver is a reasonable way to move forward with
> getting some basic gpu nodes into upstream dts files.

Yeah, letting the upstream DT bind without the custom OPP stuff for now
seems like progress.  If we find that the safe fast freq is too high
then we can drop it down later, and that would just put more pressure on
getting the OPP work finished.

Reviewed-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAliPmoMACgkQtdYpNtH8
nuiD5A//fWS5OOCknwcvT+M0anfvaMJZ47hiTf8RFtFBJxepsrGg6ktm23vDIxB8
7CzFbi6SJsdx3Y8qGCGx7suBrCTEjJHwHxyQMun1WOnh3KT02sohJlubQytfRTCP
kSqUVSRMy2OIOYoA+taa8cymJMn7G6rTO/TgicfODUedgjLRICYTHcD0HeH20Qls
EvGNSMM5pzxP9EMz9nmrBd2kp/KDgVFcVNIA2SPeRaVIFdwOtFhvXN50pKH4EIDz
2qWcE3Mwif2/imldD+ZLs4grJqB4wO+0rn3Y6yrMk5X9IhBXgBDxToq5uwJOZWNk
gSbdVaBVIK1Q0yQEZOzRPo4TJkAwOnC5FoIwpqnR8cuSOsT5oQHjACF8Ku/rJA7e
Z+4y86Sb1jyyYzA8aLJ13Jn8Ok2lWaB5iDSIfpP9VeHtEdWanO4iHz10gwNQUW60
rnmEmXPrqTI4ofNbfRTK5s/yYBqFQE/HzJKLeaI+xPzCmze9AsMowomuDfq5UOxn
SBXXGFon6DDIIX7wvIH+i4+jrLMzoEDalXATzBgvxgTvgHBnNpbhe2CtHOE4NWKc
BKh04GohkN+yuPcXy6mXy7O6qg4D1NTINSU5jH72ubdsxUzVdmiAt9LkIWcS/hR0
yRSjUTWWIeRYrAHsJsQcWJRUGfobNm0/DJqQEX3Fhb07QM1gxRk=
=41mF
-----END PGP SIGNATURE-----
--=-=-=--

--===============1673043176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5v
IG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCg==

--===============1673043176==--
