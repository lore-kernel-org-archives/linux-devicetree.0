From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 3/4] ARM: dts: bcm2835-rpi-zero-w: Add bcm43438 serial
 slave
Date: Wed, 07 Mar 2018 14:36:10 -0800
Message-ID: <87muzjfr8l.fsf@anholt.net>
References: <1519567855-26105-1-git-send-email-stefan.wahren@i2se.com>
 <1519567855-26105-4-git-send-email-stefan.wahren@i2se.com>
 <84F7E645-59B4-4618-8C91-A5CD654E16A6@holtmann.org>
 <648118289.71086.1519593373795@email.1und1.de>
 <9D6209F2-5389-4F4E-844D-6A8683044F88@holtmann.org>
 <438185389.274708.1520422108782@email.1und1.de>
 <03B9ACBE-3ACA-40C4-9DA2-6A57D1AD96E0@holtmann.org>
 <2071508922.276811.1520426568577@email.1und1.de> <87sh9bvh3r.fsf@anholt.net>
 <D48AB207-F7F4-46D8-AC65-EC5CF76A6084@holtmann.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2211875463289170343=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <D48AB207-F7F4-46D8-AC65-EC5CF76A6084@holtmann.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marcel Holtmann <marcel@holtmann.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Johan Hedberg <johan.hedberg@gmail.com>, Lukas Wunner <lukas@wunner.de>, Phil Elwell <phil@raspberrypi.org>, Linux Bluetooth mailing list <linux-bluetooth@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-rpi-kernel@lists.infradead.org, =?utf-8?B?RnLDqWTDqXJpYw==?= Danis <frederic.danis.oss@gmail.com>, Loic Poulain <loic.poulain@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============2211875463289170343==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Marcel Holtmann <marcel@holtmann.org> writes:

> Hi Eric,
>
>>>>>>>>> Add BCM43438 (bluetooth) as a serdev slave device of uart0 (pl011=
/ttyAMA0).
>>>>>>>>> This allows to automatically insert the bcm43438 to the bluetooth
>>>>>>>>> subsystem instead of relying on patched userspace helpers (hciatt=
ach).
>>>>>>>>>=20
>>>>>>>>> In order to keep a debug UART we need to switch to uart1.
>>>>>>>>>=20
>>>>>>>>> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
>>>>>>>>> ---
>>>>>>>>> arch/arm/boot/dts/bcm2835-rpi-zero-w.dts | 14 +++++++++++++-
>>>>>>>>> 1 file changed, 13 insertions(+), 1 deletion(-)
>>>>>>>>>=20
>>>>>>>>> diff --git a/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts b/arch/arm/=
boot/dts/bcm2835-rpi-zero-w.dts
>>>>>>>>> index cf53436..b7f79f1 100644
>>>>>>>>> --- a/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
>>>>>>>>> +++ b/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
>>>>>>>>> @@ -131,6 +131,18 @@
>>>>>>>>>=20
>>>>>>>>> &uart0 {
>>>>>>>>> 	pinctrl-names =3D "default";
>>>>>>>>> -	pinctrl-0 =3D <&uart0_gpio14>;
>>>>>>>>> +	pinctrl-0 =3D <&uart0_gpio32 &uart0_ctsrts_gpio30>;
>>>>>>>>> +	status =3D "okay";
>>>>>>>>> +
>>>>>>>>> +	bluetooth {
>>>>>>>>> +		compatible =3D "brcm,bcm43438-bt";
>>>>>>>>> +		max-speed =3D <2000000>;
>>>>>>>>> +		shutdown-gpios =3D <&gpio 45 GPIO_ACTIVE_HIGH>;
>>>>>>>>> +	};
>>>>>>>>> +};
>>>>>>>>=20
>>>>>>>> is the shutdown GPIO working as expected with this hardware. So ev=
en module unload and reload works fine?
>>>>>>>=20
>>>>>>> Yes, unload and reload works fine.=20
>>>>>>>=20
>>>>>>>> Meaning we are getting back to the 115200 default baud rate on the=
 UART?
>>>>>>>=20
>>>>>>> I assume that, because reload works as expected.=20
>>>>>>=20
>>>>>> awesome. That is good news.
>>>>>>=20
>>>>>> Since you said that the GPIO expander driver for the RPi 3 has been =
accepted, did you test it there as well? If so, then it would be good to ge=
t a patch that also provides shutdown-gpios for RPi 3.
>>>>>=20
>>>>> after applying Loic's patch and the necessary patch for the RPi 3 dts=
 file (see below), i will get this output:
>>>>>=20
>>>>> [    4.873246] Bluetooth: HCI UART driver ver 2.3
>>>>> [    4.873260] Bluetooth: HCI UART protocol H4 registered
>>>>> [    4.873265] Bluetooth: HCI UART protocol Three-wire (H5) registered
>>>>> [    4.873751] Bluetooth: HCI UART protocol Broadcom registered
>>>>> [    4.877279] uart-pl011 3f201000.serial: no DMA platform data
>>>>> [    6.952382] Bluetooth: hci0: command 0xfc18 tx timeout
>>>>> [   15.192298] Bluetooth: hci0: BCM: failed to write update baudrate =
(-110)
>>>>> [   15.192312] Bluetooth: hci0: Failed to set baudrate
>>>>> [   15.316415] Bluetooth: hci0: BCM: chip id 94
>>>>> [   15.318567] Bluetooth: hci0: BCM: features 0x2e
>>>>> [   15.341538] Bluetooth: hci0: BCM43430A1
>>>>> [   15.341560] Bluetooth: hci0: BCM43430A1 (001.002.009) build 0000
>>>>> [   19.112670] Bluetooth: hci0: BCM (001.002.009) build 0360
>>>>> [  274.713732] Bluetooth: hci0: command 0x0c14 tx timeout
>>>>> [  274.714085] Bluetooth: hci0: Frame reassembly failed (-84)
>>>>> [  317.275941] Bluetooth: hci0: last event is not cmd complete (0x0f)
>>>>>=20
>>>>> I don't see these errors on RPi Zero W. Maybe the reason for this is =
the lack of hardware flowcontrol on RPi 3. Or some of the downstream patche=
s on BlueZ must be adapted for the kernel [1].
>>>>>=20
>>>>> Btw the bcm43438 is detected even after unloading and reloading the d=
river. But the timeout occurs also on driver reload. Reducing the baudrate =
to 115200 doesn't help here.
>>>>=20
>>>> maybe it needs some time after switching the hardware on. Have you tri=
ed to sleep for a bit at the end of bcm_gpio_set_power?
>>>=20
>>> I will try, but this could also be an "issue" of the gpio expander
>>> driver. AFAIK the expander is connected via I2C to the GPU. In case
>>> the mailbox reply come before the I2C command has been handled by the
>>> GPIO expander, we are running out of sync.
>>=20
>> The mailbox command for setting GPIO state is synchronous in terms of
>> sending the i2c command to the GPIO expander HW.
>
> does that mean the driver does this correctly and really waits for the
> completion. Or does the GPIO expander might return to quickly and
> returns a false sense of GPIO state. I think it would be good a sleep
> of 50ms after the GPIO makes a difference. Maybe the GPIO expander
> driver needs to take this into account.

It seems unlikely that you can get to I2C stop before the GPIO expander
HW has changed the state of the output.

> Reality is that once the Bluetooth driver toggled the GPIO, it goes
> onto initializing the chip. One other reason might be that no device
> wakeup GPIO is wired here, that the chip actually needs some time
> before it is all good to go.

This seems much more likely to me.  The spec for bcm43438 is easily
googleable and has a power-on timing diagram.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlqgaVoACgkQtdYpNtH8
nuhpZBAAtOfYfCIZ5cIzFaNTt8fILmNYswi+8HXhExHF5YgaUdy+TrZgOwEkHkCN
+iHlEGvvQLCCkvR8OFBkUFNMhHjfK1V9r1daK4wT9cDaN55exLU9OBWeZW4Y+3DK
g7G4US3dzDDo4hmW7GtNSuZzKWz+rXdpS7Bxt/xKvlt/qfEpud5VV5ycFVOon5aB
Dvmk9z34c2ANJbuMeGfa6LPouUl597rdBOmKSULudhe9E8+5JGIxdu/BL0/WJUXY
DHLzBYeP6ry0lRMsg+H1BkuI78/beTT0w4bMNye9nIil4sIdxPO7cUv77XNzSN0A
uALUZooCeHzOEJYxGkjZHYe8UW2FXhXLkR7B6UN40RsoDyWE73jRjKMVm1UXgaH1
p+p9AkU6Mnlz1QA6g0o1HG5QQe+HviGodEtiH6bvNiW+0FPuJZ0h9fs1X7DjVyvb
73IDL4xfGKkBt7q7L1dWMjpNaDKa3n39yz+tsp0mnm6xyAe2w99HApWLqs0/giE5
reVsu+wB6T2iKWwBm1RIXuzqZyTJQHUUZfUs+02NPH9aOZoRoSHnxtFBcvBN57lJ
4UCKQMBQQrjbziqlS5I50k5pf5OboXlLoCSyrFzgUpHgEzeCdK7K5QF85gz14OH9
91iUH+qNoJHZdChFgifeP9v+VDznQgdBkhZHTjLLnP/7sJMjOBk=
=QEcs
-----END PGP SIGNATURE-----
--=-=-=--


--===============2211875463289170343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2211875463289170343==--
