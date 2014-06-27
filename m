From: Noralf Tronnes <notro-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: Re: Initial register settings in Device Tree?
Date: Fri, 27 Jun 2014 15:50:51 +0200
Message-ID: <53AD76BB.5040802@tronnes.org>
References: <53A71474.7030704@tronnes.org> <9567058.OVFbhFdhBE@wuerfel> <53A9ACE4.9040506@tronnes.org> <4617934.0IxWlTMVfd@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4617934.0IxWlTMVfd@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Den 25.06.2014 12:06, skrev Arnd Bergmann:
> On Tuesday 24 June 2014 18:52:52 Noralf Tronnes wrote:
>> Den 23.06.2014 15:38, skrev Arnd Bergmann:
>>> On Sunday 22 June 2014 21:27:52 Noralf Tr=C3=B8nnes wrote:
>>>> Den 22.06.2014 20:18, skrev Arnd Bergmann:
>>>>> On Sunday 22 June 2014 19:37:56 Noralf Tr=C3=B8nnes wrote:
>>>> Or should each register have it's own property?
>>>> st7735r,pwctr1 =3D <C5 C2 0A 00>
>>> Each user-serviceable property should be abstract and use the norma=
l
>>> units that you'd expect to see in a data sheet: milivolts, nanoseco=
nds,
>>> etc. See if some other display controller already has picked names
>>> for these properties, then use the same. If nobody has done this
>>> before, try to use property names that would also make sense on a
>>> different controller. If we get a couple of these, we can split out
>>> the property parsing code into a separate helper module.
>> I found this example that uses regulators to specify voltage:
>> Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
>> - dsi: display serial interface
>> - avdd-dsi-supply: phandle of a supply that powers the DSI controlle=
r
>>
>> If I should use regulators, I would need to have a controller driver=
 and
>> a panel driver, so to avoid that I just specify the millivolt/factor
>> directly.
>> This way the DT controller node will contain the panel description.
>> (I could add a generic panel driver if regulators is the way to go)
>>
>> This is how the setup could be for a ST7735R controller:
>>
>> st7735r,avdd-millivolt =3D <4900> /* 4.9v */
>> st7735r,vrhp-millivolt =3D <4600> /* 4.6v */
>> st7735r,vrhn-millivolt =3D <4600> /* -4.6 */
>> st7735r,pwr-mode =3D <2> /* 0=3D2x, 1=3D3x, 2=3Dauto (the datasheet =
doesn't say
>> what this is) */
>> st7735r,vgh25-millivolt =3D <2400>
>> st7735r,vgh-factor =3D <1> /* 0=3D2*AVDD+VGH25, 1=3D3*AVDD, 2=3D3*AV=
DD+VGH25 */
>> st7735r,vgl-millivolt =3D <10000> /* -10v */
>> /* ap,sap,pwr-freqX have to do with power consumption vs. image qual=
ity. */
>> st7735r,ap-factor =3D <1> /* Current in source driver op-amp: 0=3Dsm=
all,
>> 1=3Dmedium low, 2=3Dmedium, 3=3Dmedium high, 4=3Dlarge */
>> st7735r,sap-factor =3D <0> /* Current in source driver op-amp: 0=3Ds=
mall,
>> 1=3Dmedium low, 2=3Dmedium, 3=3Dmedium high, 4=3Dlarge */
>> /* Booster circuit Step-up cycle in Normal mode/ full colors */
>> st7735r,pwr-freq1-factor-normal =3D <1> /* BCLK/{1, 1.5, 2, 4} */
>> st7735r,pwr-freq2-factor-normal =3D <1>
>> st7735r,pwr-freq3-factor-normal =3D <1>
>> st7735r,pwr-freq4-factor-normal =3D <1>
>> st7735r,vcom-millivolt =3D <775> /* -0.775v */
>> st7735r,rotation =3D <0> /* Display rotation: 0,90,180,270 */
>> st7735r,gamma-positive =3D <0f 1a 0f 18 2f 28 20 22 1f 1b 23 37 00 0=
7 02 10>
>> st7735r,gamma-negative =3D <0f 1b 0f 17 33 2c 29 2e 30 30 39 3f 00 0=
7 03 10>
>>
>>
>> For a ILI9325 controller:
>>
>> ili9325,gamma-ap-factor =3D <100> /* Gamma driver amplifiers constan=
t
>> current ratio: 0=3D1.00, 1=3D0.75, 2=3D0.50 */
>> ili9325,source-ap-factor =3D <75> /* Source driver amplifiers consta=
nt
>> current ratio: 0=3D1.00, 1=3D0.75, 2=3D0.50 */
>> ili9325,vgh-factor =3D <4> /* Vci1 x {4,5,6} */
>> ili9325,vgl-factor =3D <3> /* -Vci x {3,4,5} */
>> ili9325,vci1-factor =3D <100> /* Vci x {1.00 - 0.70} */
>> ili9325,pwr-freq1-factor =3D <1> /* Fosc / {1, 2, 4, 8, 16, 32, 64} =
*/
>> ili9325,pwr-freq2-factor =3D <4> /* Fosc / {4, 8, 16, 32, 64, 128, 2=
56} */
>> ili9325,vci-internal /* use internal 2.5V for Vci reference, default=
 is
>> Vci pin */
>> ili9325,vreg1out-factor =3D <160> /* Vci x {1.60 - 2.00} */
>> ili9325,vcom-amplitude-factor =3D <100> /* VREG1OUT x {0.70 - 1.24} =
*/
>> ili9325,vcomh-factor =3D <> /* VREG1OUT x {0.685 - 1.000} */
>> ili9325,rotation =3D <0> /* Display rotation: 0,90,180,270 */
>> ili9325,gamma-positive =3D <10 values>
>> ili9325,gamma-negative =3D <10 values>
> This doesn't feel right to me at all, though I have a hard time
> coming up with the correct solution since I still don't understand
> enough of the subject matter.
I found this driver that has the same kind of initialization that I nee=
d:
Documentation/devicetree/bindings/panel/samsung,ld9040.txt
drivers/gpu/drm/panel/panel-ld9040.c

I guess I'll do something similar.

Thanks for your time Arnd.


Noralf.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
