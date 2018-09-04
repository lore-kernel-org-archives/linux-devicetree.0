From: Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH] ARM64: dts: meson-gxbb-wetek: add ttyAML1 uart for
 Bluetooth
Date: Tue, 4 Sep 2018 23:42:32 +0400
Message-ID: <84ED3B83-82E2-4ABE-AA03-9F4950EAF4A4@gmail.com>
References: <1536072290-28015-1-git-send-email-christianshewitt@gmail.com>
 <CAFBinCAQFcYKRCr72vOtuB9x=Zdt4Ox=pY0E9oxZFCO2XKF7oQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCAQFcYKRCr72vOtuB9x=Zdt4Ox=pY0E9oxZFCO2XKF7oQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, carlo@caione.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


> On 4 Sep 2018, at 11:05 pm, Martin Blumenstingl =
<martin.blumenstingl@googlemail.com> wrote:
>=20
> Hi Christian,
>=20
> On Tue, Sep 4, 2018 at 4:47 PM chewitt <christianshewitt@gmail.com> =
wrote:
>>=20
>> This change adds the ttyAML1 uart used by the brmcfmac sdio module in
>> the WeTek Hub and WeTek Play 2 devices.
> do you know which Broadcom chip this is exactly?

It=E2=80=99s an AMPAK 6335 module. WiFi shows as BCM4339, BT shows as =
BCM4335(rev C0). I=E2=80=99ve submitted a patch to add the BT id =
earlier, see:
(https://marc.info/?l=3Dlinux-bluetooth&m=3D153608351032693&w=3D2)

> I assume you want to use the "patchram" userspace program (or
> something similar) to initialize the HCI controller?
> it's been a while since a similar patch was rejected, but things have
> gotten better since then. more details below
>=20
>> Signed-off-by: chewitt <christianshewitt@gmail.com>
>> ---
>> arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi | 8 ++++++++
>> 1 file changed, 8 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi =
b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
>> index 70325b2..9476868 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
>> @@ -10,6 +10,7 @@
>> / {
>>        aliases {
>>                serial0 =3D &uart_AO;
>> +               serial1 =3D &uart_A;
> this can be dropped if you read on
>=20
>>                ethernet0 =3D &ethmac;
>>        };
>>=20
>> @@ -239,6 +240,13 @@
>>        vqmmc-supply =3D <&vddio_boot>;
>> };
>>=20
>> +/* This is connected to the Bluetooth module: */
>> +&uart_A {
>> +       status =3D "okay";
>> +       pinctrl-0 =3D <&uart_a_pins>, <&uart_a_cts_rts_pins>;
>> +       pinctrl-names =3D "default";
> insert bluetooth child-node from [0] here (with the correct max-speed,
> *-gpios and clock* properties for this board)
>=20
> some background: with Rob's serdev framework some Bluetooth controller
> drivers recently gained the ability to get the controller into a
> working state without any userspace utility. if you add the bluetooth
> child-node here the kernel will:
> - not create a /dev/ttyAMLn
> - load the matching Bluetooth controller driver (the Broadcom one in =
your case)
> - do the "initialize this Bluetooth controller with all the vendor
> specific magic" dance (toggling GPIOs, loading firmware from userspace
> via standard request_firmware, etc.)
> - provide you with a ready-to-use hci0 interface

No problem, i=E2=80=99ve done that for another device. I=E2=80=99ll =
investigate.

>=20
> Regards
> Martin
>=20
>=20
> [0] =
https://elixir.bootlin.com/linux/v4.18/source/Documentation/devicetree/bin=
dings/net/broadcom-bluetooth.txt
