From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Device tree hardware auto-configuration
Date: Tue, 25 Oct 2016 12:15:56 +0200
Message-ID: <cd2a1ee8-388e-f10d-2c0d-3c0e2b46439d@redhat.com>
References: <52F917CEA1B9C64C94833D53889D478C014C6CD7@dor-sms-xch01.digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52F917CEA1B9C64C94833D53889D478C014C6CD7-tnWY20uW8+Bm0VuiGEAYKDbuus4N2nEH@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Palacios, Hector" <Hector.Palacios-i7dp0qKlBMg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 25-10-16 12:07, Palacios, Hector wrote:
> Hello,
>
> Last ELCE 2016 I attended the conference "Device Tree hardware
> auto-configuration" by Hans de Goede. Although the room was not very big, it was fully crowded, sign of the big interest in the embedded sector to find a  convenient solution to manage hardware changes based on self-detection of the platform.
>
> Hans also started a thread recently going over this [1].
>
> Examples of what we try to solve are:
> - The same hardware platform has some hardware differences, for example because there are different revisions of the hardware.
> - A platform has several slightly different models but a 95% of the device tree
> is the same (a different GPIO is used to power a regulator, a different model of touch screen controller is used...) and we want to avoid multiple yet very similar DTs.
>
> There is no agreement on where these things should be solved.
> Neither U-Boot nor the kernel are straightforward options.
>
> I would like to share an idea. It is just a sketch and I do apologize if it
> looks naive, but maybe it can be used as foundation for a better solution.
> In the DT, we have the 'compatible' property to match nodes to drivers.
> In a similar way, I was wondering if we could have a new property 'hardware-compatible' that matches nodes to variants of the hardware.
>
> A simple example:
> - Board model A with an I2C touchscreen controller
> - Board model B with a different I2C touchscreen controller (same address)
>
> &i2c1 {
> 	/* Touchscreen for model A */
> 	touch_modelA@28 {
> 		compatible = "aaa,touch";
> 		hardware-compatible = "model" "A"
> 		reg = <0x28>;
> 	};
>
> 	/* Touchscreen for model B */
> 	touch_modelB@28 {
> 		compatible = "bbb,touch";
> 		hardware-compatible = "model" "B"
> 		reg = <0x28>;
> 	};
> };
>
> Then, it would be a question of fixing up the DT at run-time with the hardware identified properties (not with the touch nodes themselves). Let's say we  identify that we're running on model A, revision 3 (in e-fuses, eeprom, or by heuristics), so we fixup the DT with root-level properties about the hardware variant:
>
> / {
> 	hardware,model = "A";
> 	hardware,revision = "3";
> };
>
> The names of the properties (after the 'hardware,' prefix) could be anything.
> The match would need to be made between the remaining property name and its value. The DT fixup might be done by the boot loader or by a misc kernel driver as in Hans' patch. Then the driver's probe would only be called if the hardware-compatible property values are satisfied.
>
> The idea behind is to not heavily fixup the DT with devices, but instead limit the fixup to a reduced set of properties. Or in other words, you can still tell what hardware you are supposed to have by looking at the DT, and the fixup (whether done the boot loader or the kernel) simply fills in the variables that determine it.
>
> As I said, it's just a sketch-idea that I had floating around since ELCE, and that I wanted to share.

This idea has been discussed before, the more or less common name for it now is devicetree quirks, see:

http://www.spinics.net/lists/devicetree/msg69490.html
http://www.spinics.net/lists/devicetree/msg69494.html

For an initial attempt at implementing this.

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
