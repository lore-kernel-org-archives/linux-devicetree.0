From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v2 08/11] ARM: dts: zynq: Add VDMA to Parallella
Date: Fri, 25 Jul 2014 11:47:05 +0200
Message-ID: <53D22799.8050903@suse.de>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de> <1406242820-20140-9-git-send-email-afaerber@suse.de> <b4c4e060-2efb-4b82-be12-32c00897ec93@BY2FFO11FD023.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b4c4e060-2efb-4b82-be12-32c00897ec93-neA4ZlFjCT3bHPOQ8RbMe2YJ4DzVTqeXkX/xN29GLwg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Andreas Olofsson <andreas-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>, Matteo Vit <matteo.vit-WGsyu9ztxDWovDFt+AQlJdBPR1lH4CV8@public.gmane.org>, Sean Rickerd <srickerd-IBi9RG/b67k@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi S=C3=B6ren,

Am 25.07.2014 01:22, schrieb S=C3=B6ren Brinkmann:
> On Fri, 2014-07-25 at 01:00AM +0200, Andreas F=C3=A4rber wrote:
>> Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
>> ---
>>  v2: New
>> =20
>>  arch/arm/boot/dts/zynq-parallella.dts | 25 ++++++++++++++++++++++++=
+
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/d=
ts/zynq-parallella.dts
>> index e60a0a9..8beaacc 100644
>> --- a/arch/arm/boot/dts/zynq-parallella.dts
>> +++ b/arch/arm/boot/dts/zynq-parallella.dts
>> @@ -32,6 +32,31 @@
>>  		bootargs =3D "console=3DttyPS0,115200 earlyprintk root=3D/dev/mmc=
blk0p2 rootfstype=3Dext4 rw rootwait";
>>  		linux,stdout-path =3D "/amba/serial@e0001000";
>>  	};
>> +
>> +	fpga {
> Do you really want FPGA components in this DT?
> If somebody tries booting with this DT without programming with a
> corresponding bitstream, the whole system might hang.
> Just something to consider.

Well, that's related to a question that remained unanswered on v1:
whether we may need to turn this into a .dtsi to cope with variations.

The Parallella has an on-board =C2=B5HDMI connector, and two bitstreams=
 are
delivered - one for HDMI and one for headless usage. In my testing I am
using the original HDMI bitstream but serial console for lack of
upstream HDMI drivers. Do you think we need to provide
zynq-parallella-hdmi.dts and zynq-parallella-headless.dts? (It gets
worse if at some point we need to handle variations of the on-board
Epiphany chip plus the bitstreams - at least the Z7010 vs. Z7020 doesn'=
t
affect DT AFAICT.)

Since, as noted in the cover letter, these FPGA patches are not yet
fully testable, I wouldn't mind deferring them, but wanted to get them
out for review early.

http://www.parallella.org/2014/07/14/new-parallella-product-offerings/
indicates there will be a new variation in gen2 without USB/HDMI. Would
it be valid to #include a .dts (rather than .dtsi) to override status
and keep number of Parallella files low?

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
