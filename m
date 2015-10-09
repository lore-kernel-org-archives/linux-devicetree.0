From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v3 2/7] MAINTAINERS: Add myself for the new VC4 (RPi GPU)
 graphics driver.
Date: Fri, 09 Oct 2015 16:13:34 -0700
Message-ID: <87fv1jljoh.fsf@eliezer.anholt.net>
References: <1444426068-15817-1-git-send-email-eric@anholt.net>
 <1444426068-15817-3-git-send-email-eric@anholt.net>
 <CACvgo53ftyjj=LhsNuePnjH2Bez5SAG5cwk=7gzMhmMPMYOnew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1486172360=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CACvgo53ftyjj=LhsNuePnjH2Bez5SAG5cwk=7gzMhmMPMYOnew@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============1486172360==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Emil Velikov <emil.l.velikov@gmail.com> writes:

> Hi Eric,
>
> On 9 October 2015 at 22:27, Eric Anholt <eric@anholt.net> wrote:
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>> ---
>>
>> v2: Mark it Supported, not Maintained.
>>
>>  MAINTAINERS | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7ba7ab7..e331e46 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3653,6 +3653,12 @@ S:       Maintained
>>  F:     drivers/gpu/drm/sti
>>  F:     Documentation/devicetree/bindings/gpu/st,stih4xx.txt
>>
>> +DRM DRIVERS FOR VC4
>> +M:     Eric Anholt <eric@anholt.net>
>> +T:     git git://github.com/anholt/linux
> You might want to add dri-devel as mailing list, at least initially.

I believe that's already implied by the general entry for dri-devel:

./scripts/get_maintainer.pl -f drivers/gpu/drm/vc4/vc4_drv.c
Eric Anholt <eric@anholt.net> (supporter:DRM DRIVERS FOR VC4)
David Airlie <airlied@linux.ie> (maintainer:DRM DRIVERS)
dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWGEoeAAoJELXWKTbR/J7oyZkQAJiashGQ49EvIdMCn8TqOEvS
n/jjquxcpPrQ1MvjkkQ96L6D9Eva9D7vdFtEfG4Ru2ITTr6Eq6nRye2N9IUExOb8
EQe1EkCDUqizr2329sFlJjJkR2e9n9ZKiqWMPbmUEW1kR1+FIf0DmchFRmyCNnYJ
/25khaI6QdwTT4dJ52ksDL+JVriXDB5RmRSCCelPDxe9uw8kQRAxtnKHjSYHo2oK
gDK4ad2FajfSJPlRNyQ8oh0WryAga61fyOnmL8Ocuc/bselYS+Mal6OfdrFviY0u
O//sRyCpQFZ0uzBovNOlpniuAvJdG4OdvuNPeJOU+YSse+m1q6cyAOs2Q+bDbQPj
Y8yey3bPvzAc5M8ZlgBmDqr4uStnKCY2EMcQX1EcaiJfvM9kVjQXKrIZc6NZaQ0A
bUgjXVCq5hpkHxgwk3Vhp+zmeJXIpnTWOGv4Q8KkC+bqtRQNJt2S9cAeJsSFNA3S
daRhBZXm75WOq4SmLsX4fvNegG43x7HT2zvDlAm+8cvuvqLeWhb7qujjaZIsrgj/
qEfxC+nLJmPIT0pweI8kSCHolA0es5Ff/NpmCOxlu+yutU810040lXmXoH0jHQQe
y6Oe8XyIQZpEGqAEuXXsVpdMs2eiQ0pTvN5Qfky/3MSFBwZWmw+idq5bg7EZmQ80
KBpjZy7tV/Ko1HtDznDl
=93mt
-----END PGP SIGNATURE-----
--=-=-=--

--===============1486172360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1486172360==--
