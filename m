From: punnaiah choudary kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 1/3] mtd: arasan: Add device tree binding documentation
Date: Fri, 6 Nov 2015 07:59:45 +0530
Message-ID: <CAGnW=BZBBwvaCBzqic9R6KA-guFzRSYizNOMTL2+ow-rLkYx2w@mail.gmail.com>
References: <1446691722-8338-1-git-send-email-punnaia@xilinx.com>
	<20151105234909.GA711@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151105234909.GA711@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Punnaiah Choudary <kpc528-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 6, 2015 at 5:19 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Nov 05, 2015 at 08:18:42AM +0530, Punnaiah Choudary Kalluri wrote:
>> This patch adds the dts binding document for arasan nand flash
>> controller.
>>
>> Signed-off-by: Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> ---
>> Changes in v4:
>> - Added num-cs property
>> - Added clock support
>> Changes in v3:
>> - None
>> Changes in v2:
>> - None
>> ---
>>  .../devicetree/bindings/mtd/arasan_nfc.txt         | 34 ++++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/arasan_nfc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/arasan_nfc.txt b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
>> new file mode 100644
>> index 0000000..02e1ce3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
>> @@ -0,0 +1,34 @@
>> +Arasan Nand Flash Controller with ONFI 3.1 support
>> +
>> +Required properties:
>> +- compatible: Should be "arasan,nfc-v3p10"
>
> There should also be a chip specific property. Vendors are known to
> integrate IP blocks in different and interesting ways.

This IP used in xilinx Zynq UltraScale+ MPSoC and we have not observed
any deviations
 to the original IP as of today. We will add chip specific property if
we observe any deviation
to the original IP spec.

Regards,
Punnaiah
>
> Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
