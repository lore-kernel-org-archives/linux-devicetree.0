From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v2 3/3] leds: leds-pwm: Add device tree bindings
Date: Thu, 6 Dec 2012 13:36:11 +0100
Message-ID: <50C0913B.9070802@ti.com>
References: <1352731270-27534-1-git-send-email-peter.ujfalusi@ti.com> <1352731270-27534-4-git-send-email-peter.ujfalusi@ti.com> <20121206100052.EC8293E0E22@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121206100052.EC8293E0E22@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Thierry Reding <thierry.reding@avionic-design.de>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

On 12/06/2012 11:00 AM, Grant Likely wrote:
> On Mon, 12 Nov 2012 15:41:10 +0100, Peter Ujfalusi <peter.ujfalusi@ti=
=2Ecom> wrote:
>> Support for device tree booted kernel.
>> When the kernel is booted with DeviceTree blob we support one led pe=
r
>> leds-pwm device to have cleaner integration with the PWM subsystem.
>>
>> For usage see:
>> Documentation/devicetree/bindings/leds/leds-pwm.txt
>>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
>> ---
>>  .../devicetree/bindings/leds/leds-pwm.txt          |  34 ++++++
>>  drivers/leds/leds-pwm.c                            | 125 ++++++++++=
+++++------
>>  2 files changed, 127 insertions(+), 32 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.=
txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.txt b/D=
ocumentation/devicetree/bindings/leds/leds-pwm.txt
>> new file mode 100644
>> index 0000000..9fe3040
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-pwm.txt
>> @@ -0,0 +1,34 @@
>> +LED connected to PWM
>> +
>> +Required properties:
>> +- compatible : should be "pwm-leds".
>> +- pwms : PWM property, please refer to:=20
>> +  Documentation/devicetree/bindings/pwm/pwm.txt
>> +- pwm-names : (optional) Name to be used by the PWM subsystem for t=
he PWM device
>> +- label : (optional) The label for this LED.  If omitted, the label=
 is
>> +  taken from the node name (excluding the unit address).
>> +- max-brightness : Maximum brightness possible for the LED
>> +- linux,default-trigger :  (optional) This parameter, if present, i=
s a
>> +  string defining the trigger assigned to the LED.  Current trigger=
s are:
>> +    "backlight" - LED will act as a back-light, controlled by the f=
ramebuffer
>> +		  system
>> +    "default-on" - LED will turn on, but see "default-state" below
>> +    "heartbeat" - LED "double" flashes at a load average based rate
>> +    "ide-disk" - LED indicates disk activity
>> +    "timer" - LED flashes at a fixed, configurable rate
>=20
> The binding mostly looks good. However, it seems to be gratuitously
> different from the gpio-leds binding and it duplicates property
> definitions. Please match the gpio-leds behaviour with each led defin=
ed
> as a sub node of the pwm-leds node.

The GPIO and PWM bindings are substantially different. For start in pwm=
 we do
not have of_get_pwm* helpers. To get the PWM itself we need to use wpm_=
get()
which uses the pwms =3D <>; pwm-names =3D <>; properties on the device'=
s main node.
This is what I could do at the moment:

twl_pwm: pwm {
	compatible =3D "ti,twl4030-pwm";
	#pwm-cells =3D <2>;
};

twl_led: pwmled {
	compatible =3D "ti,twl4030-pwmled";
	#pwm-cells =3D <2>;
};

pwmleds {
	compatible =3D "pwm-leds";
	pwms =3D <&twl_pwm 0 7812500
		&twl_pwmled 0 7812500>;
	pwm-names =3D "omap4::keypad",
		    "omap4:green:chrg";
	kpad {
		label =3D "omap4::keypad";
		max-brightness =3D <127>;
	};

	charging {
		label =3D "omap4:green:chrg";
		max-brightness =3D <255>;
	};


};

The string in pwm-names and under the led section's label must match in=
 order
to be able to get the correct PWM for the led to drive it.
If this is good, I can make the change and resend the series soon.

> Also, please reference the common properties in bindings/leds/common.=
txt
> (This is a new file in linux-next. See how leds-gpio references it).

Will do that.

--=20
P=E9ter
