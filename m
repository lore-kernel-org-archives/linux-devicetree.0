From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [linux-sunxi] Re: [PATCH v4 1/6] dt-bindings: update the
 Allwinner GPADC device tree binding for H3
Date: Mon, 18 Sep 2017 23:47:25 +0800
Message-ID: <e73ead447af89031749e85207cac1e69@aosc.io>
References: <20170914145251.21784-1-icenowy@aosc.io>
 <20170914145251.21784-2-icenowy@aosc.io>
 <20170918073336.j7finend3g76chsu@flea.lan>
 <310CE549-B8CE-4C0C-95B1-B545E38BDAF5@aosc.io>
 <20170918083045.7bfiialtbm7w6i7j@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170918083045.7bfiialtbm7w6i7j-ZC1Zs529Oq4@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

在 2017-09-18 16:30，Maxime Ripard 写道：
> On Mon, Sep 18, 2017 at 03:36:43PM +0800, Icenowy Zheng wrote:
>> 于 2017年9月18日 GMT+08:00 下午3:33:36, Maxime Ripard 
>> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> 写到:
>> >On Thu, Sep 14, 2017 at 10:52:46PM +0800, Icenowy Zheng wrote:
>> >> Allwinner H3 features a thermal sensor like the one in A33, but has
>> >its
>> >> register re-arranged, the clock divider moved to CCU (originally the
>> >> clock divider is in ADC) and added a pair of bus clock and reset.
>> >>
>> >> Update the binding document to cover H3.
>> >>
>> >> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> >> Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> >> ---
>> >> Changes in v4:
>> >> - Add nvmem calibration data (not yet used by the driver)
>> >> Changes in v3:
>> >> - Clock name changes.
>> >> - Example node name changes.
>> >> - Add interupts (not yet used by the driver).
>> >>
>> >>  .../devicetree/bindings/mfd/sun4i-gpadc.txt        | 30
>> >++++++++++++++++++++--
>> >>  1 file changed, 28 insertions(+), 2 deletions(-)
>> >>
>> >> diff --git a/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
>> >b/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
>> >> index badff3611a98..6c470d584bf9 100644
>> >> --- a/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
>> >> +++ b/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
>> >> @@ -4,12 +4,26 @@ The Allwinner SoCs all have an ADC that can also
>> >act as a thermal sensor
>> >>  and sometimes as a touchscreen controller.
>> >>
>> >>  Required properties:
>> >> -  - compatible: "allwinner,sun8i-a33-ths",
>> >> +  - compatible: must contain one of the following compatibles:
>> >> +		- "allwinner,sun8i-a33-ths"
>> >> +		- "allwinner,sun8i-h3-ths"
>> >>    - reg: mmio address range of the chip,
>> >>    - #thermal-sensor-cells: shall be 0,
>> >>    - #io-channel-cells: shall be 0,
>> >>
>> >> -Example:
>> >> +Optional properties:
>> >> +  - nvmem-cells: A phandle to the calibration data provided by a
>> >nvmem device.
>> >> +                 If unspecified default values shall be used.
>> >> +  - nvmem-cell-names: Should be "calibration-data"
>> >
>> >I'd prefer to have which sensor it applies to here. It wouldn't change
>> >anything for the H3, but it definitely does for example for the A83t
>> >that has two sensors, one for each cluster, and one for the GPU, each
>> >with calibration data.
>> >
>> >What about cluster0-calibration?

I prefer sensor0-calibration to sensor3-calibration now.
(Theortically the new generation THS can support up to 4 sensors)

>> 
>> The calibration data is in fact a 2 word (8 bytes) zone,
>> which is reserved for 4 sensors on all SoCs, even on H3.
>> It's half word per sensor.
>> 
>> I prefer to just assume a 2 word cell for every SoC.
> 
> You have three different data sources, it should be reprensented as
> such.
> 
> Otherwise, the client has to get some knowledge of how the data are
> stored in the provider, which is an abstraction violation.
> 
> Maxime
> 
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
