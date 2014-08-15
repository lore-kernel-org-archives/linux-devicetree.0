From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: Specifying the console device using an alias
Date: Thu, 14 Aug 2014 22:02:10 -0600
Message-ID: <CAPnjgZ1S-HVZJ7kzt=YKT+jjZEtLdmZSnr6kmNVf+paGKdrgoQ@mail.gmail.com>
References: <CAPnjgZ2A=DkGSnFLy1En8bH0pZAUAEWCWz_jQ941g3QQEUN9NQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPnjgZ2A=DkGSnFLy1En8bH0pZAUAEWCWz_jQ941g3QQEUN9NQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Devicetree Discuss <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

(correct list)

On 14 August 2014 21:42, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> Hi,
>
> In U-Boot we currently specify the console device (typically serial)
> using something like:
>
> aliases {
>    console = "/serial@1234";
> }
>
> But the question has come up as to whether this should be done another
> way. I see the "linux.stdout" property in the /chosen node.
>
> I am concerned that making use of the /chosen node in U-Boot might
> confuse a lot of people, since this node is normally used to provide
> selections for the OS to use when booting. If we did use /chosen, then
> linux,stdout seems plain wrong but perhaps u-boot,stdout could be used
> instead.
>
> Does anyone have an opinion about this? It would be good to work this
> out soon before it proliferates into more code.
>
> Regards,
> Simon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
