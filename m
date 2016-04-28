From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 01/13] dt-bindings: Add Renesas R-Car FCP DT bindings
Date: Thu, 28 Apr 2016 10:00:10 +0200
Message-ID: <CAMuHMdXHYGTNSV-7JAo8Fp_q3z-WPcJEB7CuenaRuhZJABxc0A@mail.gmail.com>
References: <1461620198-13428-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
	<1461620198-13428-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
	<20160428025429.GA11679@rob-hp-laptop>
	<7242073.I0M81bb6ct@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7242073.I0M81bb6ct@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 28, 2016 at 8:36 AM, Laurent Pinchart
<laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:
>> > diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.txt
>> > b/Documentation/devicetree/bindings/media/renesas,fcp.txt new file mode
>> > 100644
>> > index 000000000000..0c72ca24379f
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/media/renesas,fcp.txt
>> > @@ -0,0 +1,31 @@
>> > +Renesas R-Car Frame Compression Processor (FCP)
>> > +-----------------------------------------------
>> > +
>> > +The FCP is a companion module of video processing modules in the Renesas
>> > R-Car +Gen3 SoCs. It provides data compression and decompression, data
>> > caching, and +conversion of AXI transactions in order to reduce the
>> > memory bandwidth. +
>> > +There are three types of FCP whose configuration and behaviour highly
>> > depend +on the module they are paired with.
>>
>> 3 types?, but I only see one compatible and no relationship with said
>> module described.
>
> The bindings currently support a single type, as that's all the driver
> currently supports and I'm not comfortable merging bindings without at least
> one test implementation. Should I clarify that with something as "These DT
> bindings currently support the "FCP for Video" type only" ?

Yes please.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
