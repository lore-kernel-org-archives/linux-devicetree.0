From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Device Tree Binding for Intel FPGA Video and Image Processing Suite
Date: Fri, 7 Apr 2017 16:53:15 -0500
Message-ID: <CAL_JsqLFbHHcVYs4a+-WS7yUEMsFR6-Y_4gootxoAwxD+RRF1A@mail.gmail.com>
References: <1490949905.21575.8.camel@intel.com> <CAL_JsqJa6rdk=fxHVkHdjFrkBx-E6hGUfoZt2cAzaMvq2TJkNw@mail.gmail.com>
 <FB1B748C9B55D647AEE382CBB370D20F064744@PGSMSX109.gar.corp.intel.com> <1491460951.2483.2.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491460951.2483.2.camel-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ong, Hean Loong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 6, 2017 at 1:42 AM, Ong, Hean Loong
<hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> Hi Rob,
>
> Any comments on the patch?

Yes, the same ones I provided 5 months ago to you. Repeated below.

>
> BR
>
> Hean Loong
>
> On Tue, 2017-04-04 at 03:57 +0000, Ong, Hean Loong wrote:
>> Hi Rob,
>>
>> Apologies for the mistake. Below are the bindings
>>
>> From 23a9e274bb517b8e232c5aa4cf9737de1644b708 Mon Sep 17 00:00:00
>> 2001
>> From: Ong, Hean Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>> Date: Thu, 30 Mar 2017 17:59:37 +0800
>> Subject: [PATCHv0] Intel FPGA Video and Image Processing Suite device
>> tree binding

This is still not how you email patches. The easiest way is git-send-email.

>>         Device tree binding for Intel FPGA Video and Image
>>         Processing Suite. The binding involved would be generated
>>         from the Altera (Intel) Qsys system. The bindings would
>>         set the max width, max height, buts per pixel and memory
>>         port width. The device tree binding only supports the Intel
>>         Arria10 devkit and its variants. Vendor name retained as
>>         altr.

There should be no indentation here.

>>
>> Signed-off-by: Ong, Hean Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>> ---
>>  .../devicetree/bindings/gpu/altr,vip-fb2.txt       |   24
>> ++++++++++++++++++++

bindings/display/. This is not a GPU.

>>  1 files changed, 24 insertions(+), 0 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/gpu/altr,vip-
>> fb2.txt
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/altr,vip-fb2.txt
>> b/Documentation/devicetree/bindings/gpu/altr,vip-fb2.txt
>> new file mode 100644
>> index 0000000..9ba3209
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpu/altr,vip-fb2.txt
>> @@ -0,0 +1,24 @@
>> +Intel Video and Image Processing(VIP) Frame Buffer II bindings
>> +
>> +Supported hardware:  Arria 10 and above with display port IP
>> +
>> +Required properties:
>> +- compatible: "altr,vip-frame-buffer-2.0"
>> +- reg: Physical base address and length of the framebuffer
>> controller's
>> +  registers.

>> +- max-width: The width of the framebuffer in pixels.
>> +- max-height: The height of the framebuffer in pixels.
>> +- bits-per-symbol: only "8" is currently supported

Why do these need to be in DT?

>> +- mem-port-width = the bus width of the avalon master port on the
>> frame reader

Still needs a vendor prefix.

>> +
>> +Example:
>> +
>> +dp_0_frame_buf: vip@0x100000280 {

display-controller@100000280

>> +       compatible = "altr,vip-frame-buffer-2.0";
>> +       reg = <0x00000001 0x00000280 0x00000040>;
>> +       altr,max-width = <1280>;
>> +       altr,max-height = <720>;
>> +       altr,bits-per-symbol = <8>;
>> +       altr,mem-port-width = <128>;
>> +};
>> +
>> --
>> 1.7.1
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
