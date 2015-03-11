From: punnaiah choudary kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] dma: Add Xilinx ZDMA device tree Binding Documentation
Date: Wed, 11 Mar 2015 08:21:01 +0530
Message-ID: <CAGnW=BZpDjoX0tHncmzsMapppi9LKXe9SjCe7M4G3-js0Jm2JQ@mail.gmail.com>
References: <BN1AFFO11FD032F933FA09686353911532C8180@BN1AFFO11FD032.protection.gbl>
	<BN1BFFO11FD01214F9392FD94A0D30D9E28C190@BN1BFFO11FD012.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BN1BFFO11FD01214F9392FD94A0D30D9E28C190-fm2tX0oQAVzat3LGO86d6+hlVc3/7hDbVaz/vdPVXQ4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, punnaiah choudary kalluri <kalluripunnaiahchoudary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 11, 2015 at 5:31 AM, S=C3=B6ren Brinkmann
<soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> On Tue, 2015-03-10 at 07:46PM +0530, Punnaiah Choudary Kalluri wrote:
>> Device-tree binding documentation for Xilinx ZDMA Engine
>>
>> Signed-off-by: Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> ---
>>  .../devicetree/bindings/dma/xilinx/zdma.txt        |   76 +++++++++=
+++++++++++
>>  1 files changed, 76 insertions(+), 0 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/dma/xilinx/zdm=
a.txt
>>
>> diff --git a/Documentation/devicetree/bindings/dma/xilinx/zdma.txt b=
/Documentation/devicetree/bindings/dma/xilinx/zdma.txt
>> new file mode 100644
>> index 0000000..399a3bc
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/xilinx/zdma.txt
>> @@ -0,0 +1,76 @@
>> +Xilinx ZDMA engine, it does support memory to memory transfers,
>> +memory to device and device to memory transfers. It also has flow
>> +control and rate control support for slave/peripheral dma access.
>> +
>> +Xilinx ZynqMP has two instances of general purpose DMA(ZDMA).
>> +one is located in FPD(full power domain) and other is located in
>> +LPD(low power domain).
>> +
>> +ZDMA instance located in FPD is referred as FPDMA and instance loca=
ted
>> +in LPD is referred as LPDMA.
>> +
>> +FPDMA is configured with 8 DMA channels and AXI bus width is 128 by=
te.
>> +LPDMA is configured with 8 DMA channels and AXI bus width is 64 byt=
e.
>
> All these implementation details are good background information, but
> shouldn't be part of the binding.

Ok. i will remove then.

Thanks.
Punnaiah
>
>         S=C3=B6ren
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
