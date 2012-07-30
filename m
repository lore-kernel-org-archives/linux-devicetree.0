From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 2/3] mfd: twl6040: Add twl6040-gpio child
Date: Mon, 30 Jul 2012 17:13:17 +0300
Message-ID: <5016967D.2020104@ti.com>
References: <1342603220-13287-1-git-send-email-peter.ujfalusi@ti.com> <1342603220-13287-3-git-send-email-peter.ujfalusi@ti.com> <CACRpkdZJcy5HOZkjMCVJW5beExoCHOBb=BiB4GOGR7sM+5Xsww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZJcy5HOZkjMCVJW5beExoCHOBb=BiB4GOGR7sM+5Xsww@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, Samuel Ortiz <sameo@linux.intel.com>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org, Sergio Aguirre <saaguirre@ti.com>
List-Id: devicetree@vger.kernel.org

Hello Linus,

On 07/28/2012 01:50 AM, Linus Walleij wrote:
> On Wed, Jul 18, 2012 at 11:20 AM, Peter Ujfalusi <peter.ujfalusi@ti.c=
om> wrote:
>=20
> I think you need to CC DT bindings to devicetree-discuss.
>=20
>> diff --git a/Documentation/devicetree/bindings/mfd/twl6040.txt b/Doc=
umentation/devicetree/bindings/mfd/twl6040.txt
>> index c855240..2a3d55c 100644
>> --- a/Documentation/devicetree/bindings/mfd/twl6040.txt
>> +++ b/Documentation/devicetree/bindings/mfd/twl6040.txt
>> @@ -10,6 +10,8 @@ Required properties:
>>  - reg: must be 0x4b for i2c address
>>  - interrupts: twl6040 has one interrupt line connecteded to the mai=
n SoC
>>  - interrupt-parent: The parent interrupt controller
>> +- gpio-controller:
>> +- #gpio-cells =3D <1>: twl6040 provides GPO lines.
>>  - twl6040,audpwron-gpio: Power on GPIO line for the twl6040
>>
>>  - vio-supply: Regulator for the twl6040 VIO supply
>> @@ -29,6 +31,8 @@ Required properties:
>>  - ti,viblmotor-res: Resistance parameter for left motor
>>  - ti,viblmotor-res: Resistance parameter for right motor
>>
>> +- ti,use-gpo: Set it to <1> if the GPO functionality is in use
>> +
>=20
> It's not like I'm sort of expert on bindings, but I've seen the
> pattern status =3D "okay" used for this kind of boolean stuff,
> and if that node is not there it's implicitly not OK.

Yes I have also seen status =3D "okay" in dts files, but usually they w=
ere
associated with sections with compatible flag.
Here I'm not sure how to use it to indicate that the core driver should=
 create
the mfd child for the GPIO driver.
I do not have parameters for the GPIO driver.

I could, if this is working do this:

ti,twl6040-gpo {
	status =3D "okay";
};

If the board needs the gpo driver, but in the driver(s) I need to check=
 for
the existence of the "ti,twl6040-gpo" node and check if the status is "=
okay".
I think it is easier to just get the value of "ti,use-gpo", if it exist=
 and it
is 1 I enable the GPIO driver otherwise I don't.


Regards,
P=E9ter
