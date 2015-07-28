From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFCv2 1/3] docs: dts: Added documentation for Xilinx Zynq Reset
 Controller bindings.
Date: Mon, 27 Jul 2015 21:55:10 -0700
Message-ID: <CAAtXAHeWtXVe4c5z_6AxMS0CggA2pN57mNArJsKG9=QxWs-zRw@mail.gmail.com>
References: <1437783682-13632-1-git-send-email-moritz.fischer@ettus.com>
	<1437783682-13632-2-git-send-email-moritz.fischer@ettus.com>
	<55B5BD08.60802@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55B5BD08.60802-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Michal,

On Sun, Jul 26, 2015 at 10:09 PM, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:
> On 07/25/2015 02:21 AM, Moritz Fischer wrote:
>> Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/reset/zynq-reset-pl.txt | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/reset/zynq-reset-pl.txt
>>
>> diff --git a/Documentation/devicetree/bindings/reset/zynq-reset-pl.txt b/Documentation/devicetree/bindings/reset/zynq-reset-pl.txt
>> new file mode 100644
>> index 0000000..ac4499e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/reset/zynq-reset-pl.txt
>> @@ -0,0 +1,13 @@
>> +Xilinx Zynq PL Reset Manager
>
> here
>
>> +
>> +Required properties:
>> +- compatible: "xlnx,zynq-reset-pl"
>
> Currently it is not just PL reset controller.
>
>> +- syscon <&slcr>;
>
>
> missing : and please be more descriptive here.
>
>> +- #reset-cells: 1
>> +
>> +Example:
>> +     rstc: rstc@240 {
>> +             #reset-cells = <1>;
>> +             compatible = "xlnx,zynq-reset-pl";
>
> Compatible property should go first.
>
> I am missing that reg property
>
>> +             syscon = <&slcr>;
>> +     };
>>
>
Would something like this work:

Xilinx Zynq Reset Manager

The Zynq AP-SoC has several different resets.

See Chapter 26 of the Zynq TRM (UG585) for more information about Zynq resets.

Required properties:
- compatible: "xlnx,zynq-reset"
- reg: SLCR offset and size taken via syscon <0x200 0x50>
- syscon: <&slcr>
  This should be a phandle to the Zynq's SLCR register.
- #reset-cells: Must be 1

The Zynq Reset Manager needs to be a child node of the SLCR.

Example:
        rstc: rstc@200 {
                compatible = "xlnx,zynq-reset";
                reg = <0x200 0x50>;
                #reset-cells = <1>;
                syscon = <&slcr>;
        };

> Thanks,
> Michal
>
>
> --
> Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
> w: www.monstr.eu p: +42-0-721842854
> Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
> Maintainer of Linux kernel - Xilinx Zynq ARM architecture
> Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform
>
>

Thanks for your feedback,

Moritz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
