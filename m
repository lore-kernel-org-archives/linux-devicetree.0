From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 6/7] ARM: bcm2835: Add the DDC I2C controller to the
 device tree.
Date: Mon, 17 Aug 2015 11:35:30 -0700
Message-ID: <871tf1wyod.fsf@eliezer.anholt.net>
References: <1439427380-2436-1-git-send-email-eric@anholt.net>
 <1439427380-2436-7-git-send-email-eric@anholt.net>
 <55CEC567.109@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1247288794=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <55CEC567.109@wwwdotorg.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============1247288794==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Stephen Warren <swarren@wwwdotorg.org> writes:

> On 08/12/2015 06:56 PM, Eric Anholt wrote:
>> We need to use it for getting video modes over HDMI.
>
>> diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
>
>> +		i2c2: i2c@7e805000 {
>> +			compatible = "brcm,bcm2835-i2c";
>> +			reg = <0x7e805000 0x1000>;
>> +			interrupts = <2 21>;
>> +			clocks = <&clk_i2c>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +		};
>
> In an SoC .dtsi file, you'd typically write:
>
> 	status = "disabled";
>
> ... in all nodes that represent IO controllers that interface to
> external HW, so that board DT files can/must explicitly choose to enable
> the device if it's actually in use on the board. Some systems might not
> have HDMI and hence might not hook up the HDMI_SCL/SDA pads.
>
> BCM2835-ARM-Peripherals.pdf states "Note that the BSC2 master is used
> dedicated with the HDMI interface and should not be accessed by user
> programs.". Does this imply the Linux kernel shouldn't be touching this
> I2C controller; that the VC4 firmware might also be attempting to use
> it? I wonder how any such sharing of the HW would work.

In order for *any* of this driver to work, we need to ensure that the
firmware doesn't try to write to the corresponding part of the hardware.
DDC I2C is no different.  All that will cause the firmware to do
anything with display is generating mbox/dispmanx requests (through the
firmware driver), and the undervoltage warnings.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJV0ilzAAoJELXWKTbR/J7oItwQALP9j55B5vIG78jh6fgbR0oC
/16sKufMJ6rFxZ9yB6sXC42u/7f4VXra274NlBYLcv+hcI1c9UQTPd2hX72E4YH4
tC3MHJFG5ZuMsiLEQexvE944h8I0fxT8dvbiJ3PCEACDF6oxlKDYwU0QfOetaNoI
VOwiZPhO/1iDZCw2mnmiF1kqbhGmiegtE1eiPONNh82OdkJ3heuL2um4PYpdKGKn
IoN86ACEVYMjsZUI9JyYgK6hMFMLTAlIfARzvnceiF9Jcf/KT+mC4+s0hdY4JNCW
MrHTBqcNUXPrV4VoDXBKa+UAo6I3maqFvoalj7gPeTA8U4ne6GhUQn4H3vDHiTRm
udbHejXv+MtjvktyjuoxbH/R+4pMIFioDdVlrH+Gu1H9htPwSzObVfK2igN4tmKf
TOiC0XM6jlYBHfpFAw6b5dIur2P492+FKgesUaW1NnmaqwwfmwA8X8JiaiPaUs98
B4f9AcywP1JP4Z8kJj3KRxzkv+J65tlRrS27xDw/VzOKDj50iPLWaAb4dvvfbcm9
WQgyZnG6P0L9kKd8+ANpJkH5D0aY1Khh72Sch7KSSs/E/uQb2p3ibtUBLDfjyMw8
iDP+pU0RiObxjD6b9Lw17cXYCEjbkp0aZfvggSc7Tvm+85tHSkFpg2PwlzDae01U
NTy2LOnND4x6LwZe5VFQ
=dxIb
-----END PGP SIGNATURE-----
--=-=-=--

--===============1247288794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1247288794==--
