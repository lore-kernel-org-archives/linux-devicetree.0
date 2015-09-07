From: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] QEMU fw_cfg DMA interface documentation
Date: Mon, 7 Sep 2015 13:25:20 +0200
Message-ID: <55ED7420.9080803@redhat.com>
References: <1441012133-8154-1-git-send-email-markmb@redhat.com>
 <1441012303-8261-1-git-send-email-markmb@redhat.com>
 <CAJSP0QXgiMo0ahzRQ=2iMXVmiO+R27Re17c966LX1T_Q=Rdgow@mail.gmail.com>
 <20150902103311.5335d469@markmb_rh> <1441624109.27149.18.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441624109.27149.18.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?Marc_Mar=c3=ad?= <markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Drew <drjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Kevin O'Connor <kevin-BG7uPxbsK//k1uMJSBkQmQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/07/15 13:08, Gerd Hoffmann wrote:
>   Hi,
> 
>> It's just simplicity. If you want to read a few times from the same
>> field (like in ACPI tables, read the data size and then the data), you
>> need a way to enable and disable the selector and manage the current
>> offset for that entry. This is already provided with the "old"
>> interface.
> 
> Could be handled with a 'select' control bit.  Only when set select
> entry and reset offset to zero.
> 
> Also: would it make sense to allow an *array* of FWCfgDmaAccess structs?
> With a 'more' bit in control we could indicate that there are more
> entries.  I'm not sure firmware would actually use that though ...

Seems far-fetched.

Thanks
Laszlo

> cheers,
>   Gerd
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
