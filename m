From: Eric Anholt <eric@anholt.net>
Subject: Re: [RESENT PATCH] ARM: bcm2835: Add devicetree for the Raspberry Pi
 3, for arm (32)
Date: Tue, 31 Jan 2017 13:59:39 -0800
Message-ID: <878tpqki0k.fsf@eliezer.anholt.net>
References: <1484845444-4617-1-git-send-email-kraxel@redhat.com>
 <87fukcgsqp.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4673999481933883809=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <87fukcgsqp.fsf@eliezer.anholt.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-rpi-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============4673999481933883809==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Eric Anholt <eric@anholt.net> writes:

> [ Unknown signature status ]
> Gerd Hoffmann <kraxel@redhat.com> writes:
>
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>> ---
>>  arch/arm/boot/dts/Makefile | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 7327250..82a760d 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -70,7 +70,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += \
>>  	bcm2835-rpi-b-plus.dtb \
>>  	bcm2835-rpi-a-plus.dtb \
>>  	bcm2836-rpi-2-b.dtb \
>> -	bcm2835-rpi-zero.dtb
>> +	bcm2835-rpi-zero.dtb \
>> +	../../../arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dtb
>>  dtb-$(CONFIG_ARCH_BCM_5301X) += \
>>  	bcm4708-asus-rt-ac56u.dtb \
>>  	bcm4708-asus-rt-ac68u.dtb \
>
> This would be really nice to have.
>
> Acked-by: Eric Anholt <eric@anholt.net>
>
> ARM upstream folks, do you have any issues with this?

Absent any feedback from ARM maintainers, I think we're about ready to
go with this.

Unfortunately, I just remembered yesterday that one of the requirements
is that we not use these sorts of ../../../ references in the DT tree.
Instead we have to use symlinks -- see arch/arm64/boot/dts/broadcom/ for
how we did the last round of this.

I think just having links from
arch/arm64/boot/dts/broadcom/bcm2837*.dts* to arch/arm/boot/dts/ would
be the solution, then this Makefile could just reference
bcm2837-rpi-3-b.dtb.

Would you be able to respin this?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAliRCMsACgkQtdYpNtH8
nug5pw/9GjcKp6gmT4trIt78m21vIkqXeGLEZvHotsoBChyjLLIfE0p0J6KG2vYw
78R5S6HXF0EqS9Nz0SiP1FKdg/Ut2MrGdhGqg4DeRqSNLDr6d+q9AgmwcCHRNtG0
jHvukum3LEAl9amL/nu/Ufmbrunk7fJMNs2VJP/JBiP9Z3DCGG0oySGxW14XfUF/
/uAHufSYpV2QlIjuuELN9A405mUjHPEeitgdLXCMgjizFZ0aPkzLLsWyx5wblPgF
88NL+E74oNnkZILEHqzGGIrI/EYcCINRYkSxI3WxtWJu8kSgHHX6BjqCyL+ZqoJ8
2nj4mceE291TSlI1OjDjcN2bBojvulyyYTOiOmLIIShpbiZMLvVP0ugMUq1LSos5
BfzwjUkKOzmAZGRe/qPvL0ZkU0DG4JVhuwTUTTfqCa5/LA6G3n9P5Wo0dgdOohSC
TGeH+oyqCh4x79+fAbiVgqLCPYeYdfgoBmALCdI+I4Zuol7BnEFnR1PpU9/3cFC1
000Su3RV7EGEMguRTtwBV83qCABXcILC8ohfx0dGUxE/9HWmrUtUmElBMMHuXU3E
iLO/N7bTsfhE+bLM2oVzBIM7se42A03SUH3mD/JBUnnksLXTAfGeFReIUH2ZeQt0
MlIbO5L8Ug3hBN/hVHZUyIV4a/jJsQEtLzUOzjBOjByv1Bbkb9s=
=tGVa
-----END PGP SIGNATURE-----
--=-=-=--


--===============4673999481933883809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4673999481933883809==--
