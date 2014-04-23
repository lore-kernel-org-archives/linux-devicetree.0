From: sundeep subbaraya <sundeep.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] usb: gadget: Add xilinx axi usb2 device support
Date: Wed, 23 Apr 2014 09:57:52 +0530
Message-ID: <CALHRZuoq32qoh70hbb2LtVJNgkwB1j6bvzmYONmxcn3mBnGONQ@mail.gmail.com>
References: <20140421160802.GA22794@saruman.home>
	<Pine.LNX.4.44L0.1404211228190.1201-100000@iolanthe.rowland.org>
	<CALHRZur7+MaYXbWOfbvjggPN7_eYAE+th5VNbcLP=ehvm0HGsA@mail.gmail.com>
	<20140422144944.GF5524@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140422144944.GF5524-HgARHv6XitL9zxVx7UNMDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Apr 22, 2014 at 8:19 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> Hi,
>
> On Tue, Apr 22, 2014 at 12:58:41PM +0530, sundeep subbaraya wrote:
>> Hi,
>>
>> On Mon, Apr 21, 2014 at 10:09 PM, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org> wrote:
>> > On Mon, 21 Apr 2014, Felipe Balbi wrote:
>> >
>> >> Hi,
>> >>
>> >> On Fri, Apr 18, 2014 at 07:34:08PM +0530, sundeep subbaraya wrote:
>> >>
>> >> <snip>
>> >>
>> >> > >> in ep_queue driver starts dma transfer from/to IP buffer to/from req->buf.
>> >> > >> If transfer is completed then request is not added to ep request queue
>> >> > >> and returns from ep_queue.
>> >> > >> If transfer is not completed (actual < length) then request is added
>> >> > >> to queue and returns from ep_queue.
>> >> > >
>> >> > > This is wrong. Why wouldn't you give gadget driver the chance to decide
>> >> > > if it needs to queue the request again or not ?
>> >> >
>> >> > When does gadget driver decides to queue the same request again?
>> >> > if -EBUSY is returned from ep_queue or req.status != 0 in completion
>> >> > routine?
>> >>
>> >> whenever it so decides. Different gadget drivers might have different
>> >> requirements. The code is open and sits under drivers/usb/gadget/ why
>> >> don't you have a read ?
>> >
>> > I get the impression that the two of you are arguing past each other.
>> > It appears that Sundeep is talking about transferring data from the
>> > gadget driver's buffer to an internal buffer in the UDC hardware, but
>> > Felipe is talking about transferring data from the UDC to the host.
>> >
>> > As I understand it, Sundeep said that when the gadget driver queues a
>> > data-IN request, the UDC driver copies as much of the data buffer as
>> > possible into a hardware FIFO.  If it succeeds in copying all the data
>> > into the FIFO then the request's completion routine gets called
>> > immediately, even though the data doesn't get sent from the FIFO to the
>> > host until the host asks for it.
>> >
>> > If only part of the data can be copied into the FIFO then the request
>> > is added to the ep's request queue before the usb_ep_queue() call
>> > returns.  When space becomes available in the FIFO, the data will be
>> > copied and eventually sent to the host.  When all the data has been
>> > copied to the FIFO, the request's completion routine will be called.
>
> there seems to be a slight problem with this approach: how will the IP
> know that even though you copied X bytes into the FIFO, it should wait
> for another Y bytes before shifting data to the wire ? How will it know
> that it shouldn't generate CRC yet because there's still data to be
> added ?

No. IP does/need not know that it has to wait for Y bytes.We just
write X bytes into
HW buffer and count as X in buffer count register. IP generates CRC
for bytes based
on Count register and sends data to Host. Let us consider this
scenario of bulk IN transfer:
req.length = 5120 and   wMaxPacketSize = 512, ep_queue is called once
and is returned with
status 0. In ep_queue this code snippet,
               if (xudc_write_fifo(ep, req) == 1)
                        req = NULL;
               if(req != NULL)
                         list_add_tail(&req->queue, &ep->queue);

xudc_write_fifo does the following if HW buffers not busy:
     copies 512 bytes to HW buffer
     set count and ready registers so that IP can start data transfer to host
     changes req.actual to 512 and returns 0(if req.length >
wMaxPacketSize) and 1(if req.length < wMaxPacketSize).
Since return is zero this request is added to queue. When data
transfer to host is completed IP generates
an interrupt. In the interrupt handler we again call write_fifo if
request list is not empty.
       if (list_empty(&ep->queue))
                req = NULL;
        else
                req = list_entry(ep->queue.next, struct xusb_req, queue);
        if (!req)
                return;

        if (ep->is_in)
                xudc_write_fifo(ep, req);
        else
                xudc_read_fifo(ep, req);

This happens 10 times(since length 5120) and completion is called.

> If there's no space in the FIFO yet, why copy data at all ?

If HW buffers are busy(IP is still transferring previous data to Host
from buffer) then xudc_write_fifo returns
0 without changing req.actual. When previous data transfer completes
then Interrupt then again write_fifo
from handler.

>> > Thus there never is any need for the gadget driver to queue the request
>> > again.

Yes

>> >An incomplete transfer means the FIFO didn't have enough room
>> > when the request was submitted; it doesn't mean that the data didn't
>> > eventually get sent to the host.
>>
>> Exactly Alan,this is what I was trying to say. Probably I was not
>> clear in explaining. I didnt see any harm this way and even this
>> implementation is same like at91_udc.c. I have been reading
>> mas_storage to understand when does gadget driver tries to enqueue a
>> request again. Since different gadget drivers might have different
>> requirements (agree with Felipe), wanted to know criteria for queuing
>> a same request again.
>>
>> I will change this implementation as per Felipe comments and test with
>> some of the gadgets.
>
> Let's see, please help me understand the questions above.

Hope this helps.

Thanks,
Sundeep.B.S.

>
> --
> balbi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
