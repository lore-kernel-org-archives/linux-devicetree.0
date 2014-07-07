From: sundeep subbaraya <sundeep.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] usb: gadget: Add xilinx axi usb2 device support
Date: Mon, 7 Jul 2014 11:58:43 +0530
Message-ID: <CALHRZurX_-80OP0GngujZE88=SRkEAt+y=nvZcJPc8W8iQJ+8A@mail.gmail.com>
References: <20140421160802.GA22794@saruman.home>
	<Pine.LNX.4.44L0.1404211228190.1201-100000@iolanthe.rowland.org>
	<CALHRZur7+MaYXbWOfbvjggPN7_eYAE+th5VNbcLP=ehvm0HGsA@mail.gmail.com>
	<20140422144944.GF5524@saruman.home>
	<CALHRZuoq32qoh70hbb2LtVJNgkwB1j6bvzmYONmxcn3mBnGONQ@mail.gmail.com>
	<20140430165437.GO23679@saruman.home>
	<CALHRZur13jLsszV8m_2q1nnBcd00P+2jO60Bvn48aKeu0f7yNQ@mail.gmail.com>
	<20140702164629.GI5541@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140702164629.GI5541-HgARHv6XitL9zxVx7UNMDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Felipe,

On Wed, Jul 2, 2014 at 10:16 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> Hi,
>
> On Sun, May 25, 2014 at 11:10:30PM +0530, sundeep subbaraya wrote:
>> Hi Felipe,
>>
>> Please take a look at below about how this IP works:
>>
>> IN:
>>       req.buf ---> DMA (transfers from ddr to IP buffer, raise DMA
>> done interrupt and set Buffer ready to transfer data to Host)---->Host
>> PC
>>   buffer sent interrupt
>>
>> OUT:
>>      Host PC--->buffer ready interrupt--->DMA (transfer from IP buffer
>> to DDR,DMA done interrupt, set Buffer ready to receive next data from
>> Host)-->req.buf
>>
>> I written logic to call completion in DMA done handler because it
>> works for both IN and OUT eps. But I see significant performance
>> degradation (by copying a file to mass storage gadget). DMA can handle
>> unaligned address too but it has ep max limit (say 512 for bulk).
>> Hence it is SW job to split packets and to drive DMA till req.length
>> completes. I feel polling for a while is faster than switching between
>> interrupt handler back and forth rapidly. Moreover, DMA may or may not
>> be present in IP based on user configuration at design time.
>>
>> I fixed all other comments expect this one if you do not agree for
>> polling then I may have to create threads and do this stuff. What do
>> you suggest?
>
> Can you resend your driver so we can review again everything you have
> fixed ? I guess you have no other way... polling it is.

Sure. I will resend the driver.

Thanks,
Sundeep.B.S.

>
> cheers
>
> --
> balbi
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
