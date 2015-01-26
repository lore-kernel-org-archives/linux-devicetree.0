From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] ARM: at91/dt: sam9263: Add ac97 device node
Date: Mon, 26 Jan 2015 17:00:41 +0100
Message-ID: <54C664A9.7090403@atmel.com>
References: <1419854922-29338-1-git-send-email-alexanders83@web.de> <1419854922-29338-3-git-send-email-alexanders83@web.de> <2066438.if5qXaBWRu@kongar> <20150108191603.GF2447@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150108191603.GF2447-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
Cc: Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 08/01/2015 20:16, Alexandre Belloni a =E9crit :
> Hi,
>=20
>=20
> On 08/01/2015 at 20:12:04 +0100, Alexander Stein wrote :
>> Now that the implementation has been applied to sound/for-next (http=
s://git.kernel.org/cgit/linux/kernel/git/tiwai/sound.git/log/?h=3Dfor-n=
ext
>> ), who is going to pick the related patches (this one and the other =
two adding documentation and default config)?
>>
>=20
> Nicolas will do it but he has not yet started to create a branch for
> 3.20.

Yes, both first patches added to at91-3.20-dt branch.

Thanks, best regards,

>> Best regards,
>> Alexander
>>
>> On Monday 29 December 2014, 13:08:41 wrote Alexander Stein:
>>> This adds the device node for the ac97 controller.
>>>
>>> Signed-off-by: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
>>> Acked-By Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>> ---
>>> Changes in v3:
>>> * Renamed the compatible string to atmel,at91sam9263-ac97c
>>> * Added 'Acked-By Alexandre Belloni <alexandre.belloni@free-electro=
ns.com>'
>>>
>>>  arch/arm/boot/dts/at91sam9263.dtsi | 21 +++++++++++++++++++++
>>>  1 file changed, 21 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/at91sam9263.dtsi b/arch/arm/boot/dts=
/at91sam9263.dtsi
>>> index 6283785..2e67e38 100644
>>> --- a/arch/arm/boot/dts/at91sam9263.dtsi
>>> +++ b/arch/arm/boot/dts/at91sam9263.dtsi
>>> @@ -700,6 +700,16 @@
>>>  					};
>>>  				};
>>> =20
>>> +				ac97 {
>>> +					pinctrl_ac97: ac97-0 {
>>> +						atmel,pins =3D
>>> +							<AT91_PIOB 0 AT91_PERIPH_A AT91_PINCTRL_NONE	/* PB12 periph=
 A AC97FS pin */
>>> +							 AT91_PIOB 1 AT91_PERIPH_A AT91_PINCTRL_NONE	/* PB13 periph=
 A AC97CK pin */
>>> +							 AT91_PIOB 2 AT91_PERIPH_A AT91_PINCTRL_NONE	/* PB14 periph=
 A AC97TX pin */
>>> +							 AT91_PIOB 3 AT91_PERIPH_A AT91_PINCTRL_NONE>;	/* PB14 peri=
ph A AC97RX pin */
>>> +					};
>>> +				};
>>> +
>>>  				pioA: gpio@fffff200 {
>>>  					compatible =3D "atmel,at91rm9200-gpio";
>>>  					reg =3D <0xfffff200 0x200>;
>>> @@ -828,6 +838,17 @@
>>>  				status =3D "disabled";
>>>  			};
>>> =20
>>> +			ac97: sound@fffa0000 {
>>> +				compatible =3D "atmel,at91sam9263-ac97c";
>>> +				reg =3D <0xfffa0000 0x4000>;
>>> +				interrupts =3D <18 IRQ_TYPE_LEVEL_HIGH 5>;
>>> +				pinctrl-names =3D "default";
>>> +				pinctrl-0 =3D <&pinctrl_ac97>;
>>> +				clocks =3D <&ac97_clk>;
>>> +				clock-names =3D "ac97_clk";
>>> +				status =3D "disabled";
>>> +			};
>>> +
>>>  			macb0: ethernet@fffbc000 {
>>>  				compatible =3D "cdns,at32ap7000-macb", "cdns,macb";
>>>  				reg =3D <0xfffbc000 0x100>;
>>>
>>
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
