From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 4/9] ARM: dts: bcm2837: Add Raspberry Pi 3 B+
Date: Tue, 17 Apr 2018 09:02:57 -0700
Message-ID: <87muy1253i.fsf@anholt.net>
References: <1523640478-4448-1-git-send-email-stefan.wahren@i2se.com>
 <1523640478-4448-5-git-send-email-stefan.wahren@i2se.com>
 <20180416204331.ft4ehpe5statsw4u@rob-hp-laptop>
 <60625d11-c521-b004-d64c-f72c9c6aac83@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3690441202720628887=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <60625d11-c521-b004-d64c-f72c9c6aac83@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Alexander Graf <agraf@suse.de>, Phil Elwell <phil@raspberrypi.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, Ray Jui <rjui@broadcom.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============3690441202720628887==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <stefan.wahren@i2se.com> writes:

> Hi Rob,
>
> Am 16.04.2018 um 22:43 schrieb Rob Herring:
>> On Fri, Apr 13, 2018 at 07:27:53PM +0200, Stefan Wahren wrote:
>>> The Raspberry Pi 3 B+ has the following major differences compared
>>> to the model 3 B:
>>> * Microchip LAN7515 (Gigabit Ethernet)
>>> * Cypress CYW43455 (802.11n/ac and BT 4.2)
>>>
>>> We need to add the USB LAN chip so the bootloader can add the MAC addre=
ss.
>>> This is necessary because there ain't a EEPROM or a valid OTP.
>>>
>>> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
>>> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
>>> ---
>>>   arch/arm/boot/dts/Makefile                 |   1 +
>>>   arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts | 108 ++++++++++++++++++++=
+++++++++
>>>   arch/arm/boot/dts/bcm283x-rpi-lan7515.dtsi |  27 ++++++++
>>>   3 files changed, 136 insertions(+)
>>>   create mode 100644 arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
>>>   create mode 100644 arch/arm/boot/dts/bcm283x-rpi-lan7515.dtsi
>>>
>>> ...
>>> diff --git a/arch/arm/boot/dts/bcm283x-rpi-lan7515.dtsi b/arch/arm/boot=
/dts/bcm283x-rpi-lan7515.dtsi
>>> new file mode 100644
>>> index 0000000..169203c
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/bcm283x-rpi-lan7515.dtsi
>> Why the separate file? This can be shared?
>
> this comes from the assumption the RPi 3 B+ won't be the only RPi board=20
> with a LAN7515. Should i fold it in the dts file as long as we don't=20
> have a second board?

I think it's great as is -- our other network chips are hooked up this
way and it makes 3b+ match all the others.  Also, while I have no
specific knowledge, it seems likely that this would get reused.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlrWGrEACgkQtdYpNtH8
nuio/w//SXn/twYi6OuuGPRAFusFOBgKyOASYrVjr+VPfm05HHEmGZ+XXLlUzfjG
MM790EVFJ6TqM1uZhJAz8eyGrvJCRFjW6mhuFZf8RRvcrraGvwyWIGa4tuzE/3lC
D921ZQ1lZtsdoF/3D1hN8lEqIGC4iLD04DMQVZP9wU8L25XVj6390xhztniR3H/i
fKs4pEtqjT6y31ZdOk3VDT8zCyNYDWlqIS03j66mATVq5La46LFv4BKehe3p1o58
HggbLwMf9nanlZ5IgFV+UPBT5VSRAq/ymTJM+vAUru0D39E9fIF62gO5nmHq93C9
jkQWGyKSYLuT/xm4hWt+qqsyBpcxhg02iB9iRJwZ7DVgOxoQZZxoNGLCe7Mh46Md
dZ852D4gIwgU8ceQ9G8Kbk4GGfnEqppffaBtWTHwEKGx9H6jy7kRoJCqSNO/tars
1djigWlg6prIcmPAV8s3NG6WydxId17OqTfZ2KIwLKZCcbdg5t3X0F08IsI5C4K4
9YQxTWJQyp0Mk5DltH7gBgOKH0MigUC/16X5wCbEfzH7DSPv3h7Vjo01bB1+bpjg
SQcnXe6JGHjJI1TRXbSYVCbJMhZ73EHtW4vn6X3W/pfJXoGwuPyY94FUIBIjoM4a
1dTcX1A0DjsVqE/sBhxaY2NnE8gJ4juXiGxmbPz2C57MLe6v5Pk=
=8rGI
-----END PGP SIGNATURE-----
--=-=-=--


--===============3690441202720628887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3690441202720628887==--
