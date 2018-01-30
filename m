From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] of: convert unittest overlay devicetree source to
 sugar syntax
Date: Mon, 29 Jan 2018 16:14:45 -0800
Message-ID: <f3af3f81-da51-6534-2ebd-0adf88677d47@gmail.com>
References: <1517194414-19932-1-git-send-email-frowand.list@gmail.com>
 <1517194414-19932-3-git-send-email-frowand.list@gmail.com>
 <CAMuHMdVSDj2MmTzbxgZeBx94EKdcRr6B_3Bh+Mb35XhBRPPGXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdVSDj2MmTzbxgZeBx94EKdcRr6B_3Bh+Mb35XhBRPPGXw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/29/18 02:37, Geert Uytterhoeven wrote:
> Hi Frank,
> 
> On Mon, Jan 29, 2018 at 3:53 AM,  <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>
>> The unittest-data overlays have been pulled into proper overlay
>> devicetree source files without changing their format.  The
>> next step is to convert them to use sugar syntax instead of
>> hand coding overlay fragments structure.
> 
> Cool! I had heard about the new syntax, but hadn't realized it was merged in
> v4.15-rc1.
> 
> Have you used your overlay_convert_old_to_new script to convert them?
> 
>> A few of the overlays can not be converted because they test
>> absolute target paths in the overlay fragment.  dtc does not
>> generate this type of target:
>>   overlay_0.dts
>>   overlay_1.dts
>>   overlay_12.dts
>>   overlay_13.dts
> 
> And I guess you want to keep at least a few tests using the non-sugar syntax
> anyway?

Not really.  But not something I care about at the moment.


> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
