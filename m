From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH v5 2/2] ARM: dts: bcm2837-rpi-3-b: Add bcm43438 serial slave
Date: Fri, 06 Oct 2017 15:03:58 -0700
Message-ID: <87poa0djch.fsf@anholt.net>
References: <1504125721-4760-1-git-send-email-loic.poulain@gmail.com> <1504125721-4760-2-git-send-email-loic.poulain@gmail.com> <C1D28787-A7C3-4A7A-8EAC-7E7994E54B29@holtmann.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <C1D28787-A7C3-4A7A-8EAC-7E7994E54B29-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>, Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org> writes:

> Hi,
>
>> Add BCM43438 (bluetooth) as a slave device of uart0 (pl011/ttyAMA0).
>> This allows to automatically insert the bcm43438 to the bluetooth
>> subsystem instead of relying on userspace helpers (hciattach).
>>=20
>> Overwrite chosen/stdout-path to use 8250 aux uart as console.
>>=20
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> arch/arm/boot/dts/bcm2837-rpi-3-b.dts | 10 ++++++++++
>> 1 file changed, 10 insertions(+)
>>=20
>> v2: dt-bindings as separate patch
>>     rebase on upcoming pi3 dts changes
>> v3: changes in bcm serdev drivers:
>>     name refactoring and additional comments
>>     Add generic host_set_baudrate method
>>     Use agnostic device_property_read
>> v4: changes in doc and dts:
>>     Add additional params to broadcom bt dt-bindings
>>     Set the max baudrate to 2000000 instead of 921600
>>     use chosen/stdout-path instead of console=3D
>>     remove useless earlyprintk
>>     same changes in bcm283x.dtsi
>> v5: remove 1/4 dt-bindings and 4/4 hci_bcm serdev support
>>     1/4 and 4/4 merged in bluetooth-next tree
>>=20
>> diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/b=
cm2837-rpi-3-b.dts
>> index 20725ca..e4488cb 100644
>> --- a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
>> +++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
>> @@ -8,6 +8,11 @@
>> 	compatible =3D "raspberrypi,3-model-b", "brcm,bcm2837";
>> 	model =3D "Raspberry Pi 3 Model B";
>>=20
>> +	chosen {
>> +		/* 8250 auxiliar UART instead of pl011 */
>> +		stdout-path =3D "serial1:115200n8";
>> +	};
>> +
>> 	memory {
>> 		reg =3D <0 0x40000000>;
>> 	};
>> @@ -24,6 +29,11 @@
>> 	pinctrl-names =3D "default";
>> 	pinctrl-0 =3D <&uart0_gpio32 &gpclk2_gpio43>;
>> 	status =3D "okay";
>> +
>> +	bluetooth {
>> +		compatible =3D "brcm,bcm43438-bt";
>> +		max-speed =3D <2000000>;
>> +	};
>> };
>>=20
>
> the driver for this is already in Linus=E2=80=99 tree. And I would really=
 prefer that we get the DT changes merged in as well.

Now that the separated stdout patch is ready to go, I've applied this
for -next (dropping the chosen node) and I'm sending the PR for both.

Thanks so much for working on this!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlnX/c8ACgkQtdYpNtH8
nuilexAAr4xunwCEukkTmwYopUp1osVIvBaifaYB+LV5AW7DSEKXJDRgBXtbf/j0
28K1iseN8iRXRNgByqJOFmwEmOPitBd405rw3hjoP8gDKiY/E2UIgGM0TSkrNg6E
NUqdlCO6cjtAFFgeA+GMShGg1m+LIZsWwvxoUzZCrxCFl+MXcg0txV29WsmAduO0
LuxMMEzivF/nlWaLgusNJvdkGlQfdsfHIWz70NY6pGmzfQRDNKBylul0uy4Cl912
5nLWvVOdfxXmSLgWjJUhdZGuiP3JrolZ51xWBi//GwoHrPs857TMG7xlncNePVTV
wiH1D38INJ5KKAhop/SY7ULc0SG5L5tGNHVEdGp0Gq53FkReVGZYL3Z3vPaWTO7f
GeO1jhtxsGkhBsupkQEZ6IHT37O4unX6FRSXyYBS2Y3G6FjGdcmlFCjg6TR8pume
qtIijXUQ+SRGNF0Mwks4TikHY7OBMc7jvbGXZ1a3S9EGo0KsC0fU6R+sTnis22Zl
QOO9kYmrETWeCv18NDDqUdPDgvt8h7V/eXMp/C9OpPUFFhWffk8DhL+YO3F282w6
+uW5msSp7kAwIgiHw1ljaJntEQpWLIjabsZMPkQpdgoBobjNvc2auUjY6BT3MRjE
Tp+2dRDRwWtYFMWo2kbm6VgJjZnB49b9TQOGSfU15nhL8QsOylU=
=iHSs
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
