From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] ARM: dts: Add devicetree for the Raspberry Pi 3,
 for arm32 (v4)
Date: Thu, 20 Apr 2017 13:12:10 -0700
Message-ID: <877f2e96ud.fsf@eliezer.anholt.net>
References: <20170330002605.15213-1-eric@anholt.net>
 <9c076a1e-267a-1a66-7cc0-9dd5bf59c5a8@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7867424772871777791=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <9c076a1e-267a-1a66-7cc0-9dd5bf59c5a8@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org, Lee Jones <lee@kernel.org>Florian Fainelli <f.fainelli@gmail.com>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Gerd Hoffmann <kraxel@redhat.com>, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============7867424772871777791==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Florian Fainelli <f.fainelli@gmail.com> writes:

> On 03/29/2017 05:26 PM, Eric Anholt wrote:
>> Raspbian and Fedora have decided to support the Pi3 in 32-bit mode for
>> now, so it's useful to be able to test that mode on an upstream
>> kernel.  It's also been useful for me to use the same board for 32-bit
>> and 64-bit development.
>>=20
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>> ---
>>=20
>> v1: Gerd's patch that put the ../../../arm64/... link in the Makefile
>> v2: Michael's patch that #included from ../../../arm64/... in a new
>>     bcm2837-rpi-3-b.dts.
>> v3: Mine, using symlinks to make sure that we don't break the split DT
>>     tree.
>> v4: Rely on the new include/arm64 symlink.
>>=20
>> Assuming positive review feedback, I assume it would be acceptable to
>> merge the shared/dt-symlinks branch in a PR of my own for the 32-bit
>> DT branch?
>
> Either that, or I can take it directly through devicetree/next whichever
> you prefer. We have not gotten feedback on whether this looks acceptable
> or not though...

I would love if you could pull this patch, but it does require
shared/dt-symlinks.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlj5FhoACgkQtdYpNtH8
nuieRBAAnf6yQlyXw476/0fjHOr/Lw7/zD7qkghGkyxkIXwpQateCKHcBOzOLgqk
Gi1Ao3d4AHWN1Fw+hP6l0Xt4jWwVIl6F+7NRZ6M/V+/ONGGVe5dhTgV+g0RTvujh
AufNeoTL4hQSKXU1A3H0EOyESmrgHkqHJo3sMGo740zqDZb3WuBIMZV1qweRLQFp
32AL/ZrPJRUio4fvG+/lQGQJO9d03GVDuFvDbauzPdk4R2H7/ExFclL/U8IvVtgi
lWYl/7dn8lJwP4OK/IITuqb4Km2HYKk4bUNe3dH3W0ZnViKvHI7BK+cwuOHudkYQ
Ka4zXWiBh0vK70lH2lTJwp1ppBWEJjgSyuRDgw2uFgiYfk6vYaYqiOFmadQEoL9E
4CZ3IByYOc1kAyt57dmuzYzflgcMpq6nClD27M95QvemAJjOloRyc5fHsdr2frfQ
dKuNZq3vY9RbW1Jo1LQLhMiEqWgKCOH3vb9m5q9YRvAfPP3kZj2wN95my4E2x6Vl
aeIbClXgZeW1Dn7fzIBqNcMMHF81RN9VxVUOwELqTMhs9sCvvmY4WyaYiszmiYZE
69ebT9x8PTrO2RukJ++4NKkX9VEkAMHRgl94LUIVL00akkEJhEVd+TKWODJsZ3ku
YGnXrRLzhEgppsGbuGnh+9HahpXjjSC0qRsTzQX2yeOtBELlfmY=
=Q8Zc
-----END PGP SIGNATURE-----
--=-=-=--


--===============7867424772871777791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7867424772871777791==--
