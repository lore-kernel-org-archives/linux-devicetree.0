From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 4/5] drm/vc4: Add DPI driver
Date: Thu, 24 Mar 2016 17:02:34 -0700
Message-ID: <871t6za0h1.fsf@eliezer.anholt.net>
References: <1458355366-7073-1-git-send-email-eric@anholt.net> <1458355366-7073-5-git-send-email-eric@anholt.net> <20160321125745.GA16407@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160321125745.GA16407@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

> On Fri, Mar 18, 2016 at 07:42:45PM -0700, Eric Anholt wrote:
>> The DPI interface involves taking a ton of our GPIOs to be used as
>> outputs, and routing display signals over them in parallel.
>>=20
>> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
>> ---
>>  .../devicetree/bindings/display/brcm,bcm-vc4.txt   |  67 +++
>>  drivers/gpu/drm/vc4/Kconfig                        |   1 +
>>  drivers/gpu/drm/vc4/Makefile                       |   1 +
>>  drivers/gpu/drm/vc4/vc4_debugfs.c                  |   1 +
>>  drivers/gpu/drm/vc4/vc4_dpi.c                      | 518 ++++++++++++++=
+++++++
>>  drivers/gpu/drm/vc4/vc4_drv.c                      |   1 +
>>  drivers/gpu/drm/vc4/vc4_drv.h                      |   5 +
>>  7 files changed, 594 insertions(+)
>>  create mode 100644 drivers/gpu/drm/vc4/vc4_dpi.c
>>=20
>> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt =
b/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
>> index 56a961a..1782c3f 100644
>> --- a/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
>> +++ b/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
>> @@ -35,6 +35,44 @@ Optional properties for HDMI:
>>  		  as an interrupt/status bit in the HDMI controller
>>  		  itself).  See bindings/pinctrl/brcm,bcm2835-gpio.txt
>>=20=20
>> +Required properties for DPI:
>> +- compatible:		Should be "brcm,bcm2835-dpi"
>> +- reg:			Physical base address and length of the registers
>> +- clocks:		a) core: The core clock the unit runs on
>> +			b) pixel: The pixel clock that feeds the pixelvalve
>> +- port:			Port node with a single endpoint connecting to the
>> +			  panel device, as defined in [1]
>> +- brcm,output-format:	Output data format, must be one of:
>> +			0) disabled
>> +			1) 00000000rrrrrggggggbbbbb
>> +			2) 000rrrrr00gggggg000bbbbb
>> +			3) 00rrrrr000gggggg00bbbbb0
>> +			4) 000000rrrrrrggggggbbbbbb
>> +			5) 00rrrrrr00gggggg00bbbbbb
>> +			6) rrrrrrrrggggggggbbbbbbbb
>> +
>> +Optional properties for DPI:
>> +- brcm,rgb-order:		RGB reordering, must be one of:
>> +				0) RGB
>> +				1) BGR
>> +				2) GRB
>> +				3) BRG
>
>> +- brcm,hsync-disable:		Disables the hsync signal
>> +- brcm,vsync-disable:		Disables the vsync signal
>> +- brcm,output-enable-disable:	Disables the output enable signal
>> +- brcm,hsync-falling:		Outputs the hsync signal on the falling clk edge
>> +- brcm,vsync-falling:		Outputs the vsync signal on the falling clk edge
>> +- brcm,output-enable-falling:	Outputs the output enable signal on the
>> +				  falling clk edge
>> +- brcm,output-enable-invert:	Inverts the polarity of the output enable
>> +				  signal
>> +- brcm,pixel-clk-invert:	Inverts the polarity of the pixel clk signal
>> +- brcm,output-enable-mode:	Sets output enable when (vsync | hsync)
>> +				  instead of (hactive & vactive)
>
> These are all really properties of what the panel requires and we=20
> already have video timings binding that would cover some of these.
>
> Also, do you have actual users? Some of these seem like they would be=20
> rare or never. I've not seen panels caring about which clock edge the=20
> sync signals are on.

I was using output-format, rgb_order, output-enable-mode to get my panel
to work.  I'm suspicious that the !output_enable_mode is not useful,
though (Note: I had documented it backwards: false is hsync|vsync, true
is hactive&vactive).  That just left me with output-format.  I think
.bus_format in the panel_desc can cover that, so I've now dropped all of
these brcm properties.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW9IAaAAoJELXWKTbR/J7o/LkP/01VVP/Cdr67QC+uG59foshJ
NrmZh+dL2iMQDYTSHedhjEPZBTZ3XSXLG0or2NEfhS9MTmf900gemzCZC21LsRWN
CyCS8wafoccCdbhb8NWST6WvM3rNW6Cm8V1X2S+toD/osMOfgwI01OhvovZ1T7pc
JwUbIZ37Fct5QERYYspL3nfXW+NPGSEjfG87vQyVyFlD/jcngiwtkrzuUvTJYinI
u/bGGe/W60zaepMNxl8USyDiKRjLK2RNWaAxddlyG0EiPG89tllrf0Wz5M9OHYXb
OQ/yzW1EPd4VFtxQ05iVZ2wFs8hl3qAIKvQypKCqYH/IlXvVe26nKq+DqiJlieR/
eCY82M3VBUExoXOqkraN7ChZ24Yl1CGzHkgqEEJ9C+V2qiMqB6OUmhPZxMPmcMvm
E3wJaXUOzYYvzwRjRQIlttHdIc5o8ixW6i7lLrQAWoZbtpdP/O4XHSSciA7tFNps
6E43U89vwqSQ6TVJGWsmQQi5Xk58DgqtttLhTNrzn1YXqEFI5tLJavz4h6lYU/ht
fwcgFbaP3Tgc7qXIoCoBwweQ4XxKRPcC911QYzPUSQsHBdI5UH45f1z1ySguCnRp
txyDirT0MZ9rZSM61BuaI4QEbj0+WYglRkiYd96dGt0N24RXwmczxoEP972m8rbd
i3GkS9cZ2Oc923okg/lo
=kE5S
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
