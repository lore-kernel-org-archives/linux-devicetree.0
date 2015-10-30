From: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH v2 1/4] DT: nvmem: Add NXP LPC18xx EEPROM memory binding
 documentation
Date: Fri, 30 Oct 2015 09:45:16 -0300
Message-ID: <5633665C.5050107@vanguardiasur.com.ar>
References: <1445275946-32653-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1445275946-32653-2-git-send-email-ariel@vanguardiasur.com.ar>
 <CAGhQ9VyCBTWh6qgZ__eNLqooNURsYr9ZVtDz2qCKoa0MoVgXtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGhQ9VyCBTWh6qgZ__eNLqooNURsYr9ZVtDz2qCKoa0MoVgXtA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Joachim,

El 24/10/15 a las 18:44, Joachim Eastwood escribi=C3=B3:
> Hi Ariel,
>=20
> On 19 October 2015 at 19:32, Ariel D'Alessandro
> <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org> wrote:
>> Add the devicetree binding document for NXP LPC18xx EEPROM memory.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
>> ---
>>  .../devicetree/bindings/nvmem/lpc1857-eeprom.txt   | 26 +++++++++++=
+++++++++++
>>  1 file changed, 26 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/nvmem/lpc1857-=
eeprom.txt
>>
>> diff --git a/Documentation/devicetree/bindings/nvmem/lpc1857-eeprom.=
txt b/Documentation/devicetree/bindings/nvmem/lpc1857-eeprom.txt
>> new file mode 100644
>> index 0000000..01cde0d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/nvmem/lpc1857-eeprom.txt
>> @@ -0,0 +1,26 @@
>> +* NXP LPC18xx EEPROM memory NVMEM driver
>> +
>> +Required properties:
>> +  - compatible: Should be "nxp,lpc1857-eeprom"
>> +  - reg: Must contain an entry with the physical base address and l=
ength
>> +    for each entry in reg-names.
>> +  - reg-names: Must include the following entries.
>> +    - reg: EEPROM registers.
>> +    - mem: EEPROM address space.
>> +  - clocks: Must contain an entry for each entry in clock-names.
>> +  - clock-names: Must include the following entries.
>> +    - eeprom: EEPROM operating clock.
>> +  - interrupts: Should contain EEPROM interrupt.
>=20
> You should document the 'reset' property as well.

Ok. Will do.

>=20
>> +Example:
>> +
>> +  eeprom: eeprom@4000e000 {
>> +    compatible =3D "nxp,lpc1857-eeprom";
>> +    reg =3D <0x4000e000 0x1000>,
>> +          <0x20040000 0x4000>;
>> +    reg-names =3D "reg", "mem";
>> +    clocks =3D <&ccu1 CLK_CPU_EEPROM>;
>> +    clock-names =3D "eeprom";
>> +    resets =3D <&rgu 27>;
>> +    interrupts =3D <4>;
>> +  };
>=20
> Other than that this looks good to me.
>=20
> Acked-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20

Great, thanks.

--=20
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
