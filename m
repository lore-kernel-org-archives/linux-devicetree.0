From: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/7] arm: dt: zynq: Add 'cpus' node
Date: Wed, 13 Nov 2013 09:54:19 +0000
Message-ID: <52834C4B.2080501@arm.com>
References: <1383945677-29674-1-git-send-email-soren.brinkmann@xilinx.com> <1383945677-29674-3-git-send-email-soren.brinkmann@xilinx.com> <528128A8.9060400@arm.com> <91c27955-2d9f-4e85-8d9e-b8a178b76cdb@CO9EHSMHS026.ehs.local> <d439357d-2451-405d-acf5-8514c50c779a@AM1EHSMHS002.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d439357d-2451-405d-acf5-8514c50c779a-dAX9Bq04yCSCJ4rNFYUysLjjLBE8jN/0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/11/13 21:58, S=C3=B6ren Brinkmann wrote:
> On Tue, Nov 12, 2013 at 10:06:05AM -0800, S=C3=B6ren Brinkmann wrote:
>> On Mon, Nov 11, 2013 at 06:57:44PM +0000, Sudeep KarkadaNagesha wrot=
e:
>>> On 08/11/13 21:21, Soren Brinkmann wrote:
>>>> Add a 'cpus' node to describe the CPU cores of Zynq.
>>>>
>>>> Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>>> Acked-by: Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>>  arch/arm/boot/dts/zynq-7000.dtsi | 27 +++++++++++++++++++++++++++
>>>>  1 file changed, 27 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/=
zynq-7000.dtsi
>>>> index 27ebc1ba9671..37fc04525142 100644
>>>> --- a/arch/arm/boot/dts/zynq-7000.dtsi
>>>> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
>>>> @@ -15,6 +15,33 @@
>>>>  / {
>>>>  	compatible =3D "xlnx,zynq-7000";
>>>> =20
>>>> +	cpus {
>>>> +		#address-cells =3D <1>;
>>>> +		#size-cells =3D <0>;
>>>> +
>>>> +		cpu@0 {
>>>> +			compatible =3D "arm,cortex-a9";
>>>> +			device_type =3D "cpu";
>>>> +			reg =3D <0>;
>>>> +			clocks =3D <&clkc 3>;
>>>> +			i-cache-size =3D <0x8000>;
>>>> +			i-cache-line-size =3D <0x20>;
>>>> +			d-cache-size =3D <0x8000>;
>>>> +			d-cache-line-size =3D <0x20>;
>>>
>>> These cache properties can be identified through CCSIDR(Cache Size =
ID Registers)
>>> on ARMv7 Cortex implementations. It's better not to have these in D=
T if they can
>>> be identified runtime.
>> Sounds good to me. I'll go ahead an remove them.
> BTW: Documentation/devicetree/booting-without-of.txt lists those
> properties at least as recommended. That should probably be updated.
>=20

Correct, thanks for pointing at that. IMO it definitely needs an update=
 with
respect to ARM/ARM64. E.g. the cpu topology bindings for ARM is now @
Documentation/devicetree/bindings/arm/cpus.txt and
Documentation/devicetree/bindings/arm/topology.txt, the cache propertie=
s can be
determined runtime so not a required property.

This document looks more general and specifics may not be applicable ev=
erywhere.
More over specific bindings are getting defined for many sections in th=
is document.

Regards,
Sudeep

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
