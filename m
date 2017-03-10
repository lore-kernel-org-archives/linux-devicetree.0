From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 07/39] ARM: dts: imx6qdl-sabrelite: remove erratum
 ERR006687 workaround
Date: Fri, 10 Mar 2017 16:17:28 -0300
Message-ID: <CAOMZO5BNrSEyrbWbCBCbsy4yTrh4AHfk2Too0qHuffxqUCgADg@mail.gmail.com>
References: <1489121599-23206-1-git-send-email-steve_longerbeam@mentor.com>
 <1489121599-23206-8-git-send-email-steve_longerbeam@mentor.com> <9f5d0ac4-0602-c729-5c00-1d9ef49247c1@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9f5d0ac4-0602-c729-5c00-1d9ef49247c1-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Troy Kisky <troy.kisky-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Cc: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Nick Dyer <nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org>, markus.heiser-m1Uo1GnMJf0b1SvskN2V4Q@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, bparrot-l0cyMroinI0@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sudip Mukherjee <sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jean-Christophe TROTIN <jean-christophe.trotin-qxv4g6HH51o@public.gmane.org>, horms+rene
List-Id: devicetree@vger.kernel.org

On Fri, Mar 10, 2017 at 3:59 PM, Troy Kisky
<troy.kisky-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org> wrote:
> On 3/9/2017 8:52 PM, Steve Longerbeam wrote:
>> There is a pin conflict with GPIO_6. This pin functions as a power
>> input pin to the OV5642 camera sensor, but ENET uses it as the h/w
>> workaround for erratum ERR006687, to wake-up the ARM cores on normal
>> RX and TX packet done events. So we need to remove the h/w workaround
>> to support the OV5642. The result is that the CPUidle driver will no
>> longer allow entering the deep idle states on the sabrelite.
>>
>> This is a partial revert of
>>
>> commit 6261c4c8f13e ("ARM: dts: imx6qdl-sabrelite: use GPIO_6 for FEC
>>                       interrupt.")
>> commit a28eeb43ee57 ("ARM: dts: imx6: tag boards that have the HW workaround
>>                       for ERR006687")
>>
>> Signed-off-by: Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/imx6qdl-sabrelite.dtsi | 4 ----
>>  1 file changed, 4 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
>> index 8413179..89dce27 100644
>> --- a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
>> +++ b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
>> @@ -270,9 +270,6 @@
>>       txd1-skew-ps = <0>;
>>       txd2-skew-ps = <0>;
>>       txd3-skew-ps = <0>;
>
> How about
>
> +#if !IS_ENABLED(CONFIG_VIDEO_OV5642)

Or maybe just create a new device tree for using the camera, like
imx6q-sabrelite-camera.dts.

This way we can keep the FEC erratum for the existing sabrelite dtb's.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
