From: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Subject: Re: [Ksummit-discuss] Devicetree Workshop at Kernel Summit Prague (26
 Oct 2017)
Date: Wed, 18 Oct 2017 15:59:00 +0300
Message-ID: <B7292660-D602-473E-9B47-CF7B4D2449D7@antoniou-consulting.com>
References: <CACxGe6sxKzNKZbdGA-G=Th2oHwuanyC2kGYuaFcKbSRkuhep+Q@mail.gmail.com>
 <20171017114823.58476908@bbrezillon>
 <CACxGe6tPQxwzN14TZtgNhw7OOuePLJxODrn-_b4gMDGzAFEf1Q@mail.gmail.com>
 <1508257276.74236.38.camel@freebsd.org>
 <2D4E6B6D-8F07-46D0-BB36-D97916802893@linaro.org>
 <CAMuHMdW-=-CdnD5Eb_w7fc7=c64i+bu=yv9_c0cj3UM940d8EA@mail.gmail.com>
 <ECADFF3FD767C149AD96A924E7EA6EAF3E64B904@USCULXMSG01.am.sony.com>
 <CACxGe6s8CbzRY7L1znq-nQ52eHp3pOu4X3pCX35ocQShnA_Ecw@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6s8CbzRY7L1znq-nQ52eHp3pOu4X3pCX35ocQShnA_Ecw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "Bird, Timothy" <Tim.Bird-7U/KSKJipcs@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, "ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

> On Oct 18, 2017, at 15:14 , Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> 
> On Tue, Oct 17, 2017 at 8:03 PM, Bird, Timothy <Tim.Bird-7U/KSKJipcs@public.gmane.org> wrote:
>>> -----Original Message-----
>>> From Geert Uytterhoeven on Tuesday, October 17, 2017 10:24 AM
>>> On Tue, Oct 17, 2017 at 7:02 PM, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>>> I think this also gets to having bindings described in a structured way so
>>> they can be utilized for validation of dts files.  We are doing a little of this in
>>> Zephyr since we are using a structured binding spec to generate code from
>>> .dts (since we don’t utilize a runtime dtb).
>>> 
>>> So you are basically generating board files from .dts?
>>> (closing the loop ;-)
>> 
>> I think we ought to do this on Linux, as a size optimization.
>> -- Tim
>> 
>> P.S.  I think I'll leave it ambiguous whether this was meant as a joke or not. :-)
> 

As crazy that sounds it is possible using the YAML bindings, i.e. C structure definitions
and fill-up from DT automatically. Whether this is a good idea it’s another question :)

> Talk to Nicolas Pitre and Rob Herring about this. They've already made
> a bunch of progress on reducing memory footprint.
> 
> g.
> 
>> _______________________________________________
>> Ksummit-discuss mailing list
>> Ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org
>> https://lists.linuxfoundation.org/mailman/listinfo/ksummit-discuss
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
