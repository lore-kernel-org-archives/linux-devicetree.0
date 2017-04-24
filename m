From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] ARM: dts: Add devicetree for the Raspberry Pi 3,
 for arm32 (v4)
Date: Mon, 24 Apr 2017 13:01:25 -0700
Message-ID: <87d1c1mv6y.fsf@eliezer.anholt.net>
References: <20170330002605.15213-1-eric@anholt.net>
 <CAOesGMhf-MNh+SPZe2YYefyaPk3qxqhZ5ipr86zzK3r02bE81A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1413338936478316745=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOesGMhf-MNh+SPZe2YYefyaPk3qxqhZ5ipr86zzK3r02bE81A@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Stefan Wahren <stefan.wahren@i2se.com>, Lee Jones <lee@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Broadcom Kernel Feedback List <bcm-kernel-feedback-list@broadcom.com>, linux-rpi-kernel@lists.infradead.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Gerd Hoffmann <kraxel@redhat.com>
List-Id: devicetree@vger.kernel.org

--===============1413338936478316745==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Olof Johansson <olof@lixom.net> writes:

> Hi,
>
> On Wed, Mar 29, 2017 at 5:26 PM, Eric Anholt <eric@anholt.net> wrote:
>> Raspbian and Fedora have decided to support the Pi3 in 32-bit mode for
>> now, so it's useful to be able to test that mode on an upstream
>> kernel.  It's also been useful for me to use the same board for 32-bit
>> and 64-bit development.
>>
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>> ---
>>
>> v1: Gerd's patch that put the ../../../arm64/... link in the Makefile
>> v2: Michael's patch that #included from ../../../arm64/... in a new
>>     bcm2837-rpi-3-b.dts.
>> v3: Mine, using symlinks to make sure that we don't break the split DT
>>     tree.
>> v4: Rely on the new include/arm64 symlink.
>>
>> Assuming positive review feedback, I assume it would be acceptable to
>> merge the shared/dt-symlinks branch in a PR of my own for the 32-bit
>> DT branch?
>>
>>  arch/arm/boot/dts/Makefile | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 011808490fed..27d258cb50f2 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -72,6 +72,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += \
>>         bcm2835-rpi-b-plus.dtb \
>>         bcm2835-rpi-a-plus.dtb \
>>         bcm2836-rpi-2-b.dtb \
>> +       include/arm64/broadcom/bcm2837-rpi-3-b.dtb \
>
> Building straight out of (and into) the include dir is a little odd here.
>
> A tiny wrapper *.dtb in this dir, that just includes a shared dts/dtsi
> would be a lot nicer.

OK, just sent a version with a #include.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlj+WZUACgkQtdYpNtH8
nujmnBAAqm+KnCp/ehmRSMRlyGDOJM8kHd4oNYZOf3GaGi53mJ0hVlcI3EhwD6ov
1owUP9oLT8bS5sEoYl6DqfUodCNh96NOGe1B7ONYPkTTUqUNGcSWOQP3xJMyt30S
jRP/cdGdQxkP0LvYTwDXvDWLnZNQ+yIcdbgrr55cLUaDzhdvs1dCRgJt/lQKieFn
6MFKcXsmpZqgmVhO6qUFmeKsPb/o0P/tYPJ1+U80HlUOSRwcS1jDRoW7nOqe3pDf
IxqQQfiJ4sxiNTkENsXhIlyYaJuMSgmOVzJSg7RNLthV+TIJ4DE/10yxZUMItmsg
ZO/DPOE0TagDa9RVo6UAkW+cPpChsESJ0lqk3k5VS05kFuXJvRsB5NeproZAj2pR
xEOAYqIwnXTq8ypKo5qHPZqzDB6qyaodd5lRPStOPpHuEWYSj4YQPaxW1wSGP5OM
Mk6dM4aMyatIDQrph9xipOLvtFVYcwBaLBzkGOIlXWywZYWTskwHU/7JDLjYb96P
vG4tUlJQ5mlLyzqCrqytvs+Y8BRrUF3jN0XQd19mHQ4XT+aKsrLJy1cLUS7YhdGi
iU7DcBALkxhY8O/bbRdsGY16AQTnk20EtESkfOduWs5yRE5aesUjJFfJJPapdNX4
Zs5/+1SX1GIG/wkLK+bJ6wAOPY4dTFZsjui/t0dhtVY3/0ndZ7k=
=AhlO
-----END PGP SIGNATURE-----
--=-=-=--


--===============1413338936478316745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1413338936478316745==--
