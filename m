From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] MIPS: implement a "bootargs-append" DT property
Date: Mon, 13 Nov 2017 14:18:55 +0100
Message-ID: <CAMuHMdUN-3ycB8qgZw62V_18ZjjMnuCe1HdKqf0MT5cE3qy5nQ@mail.gmail.com>
References: <1510420788-25184-1-git-send-email-daniel@gimpelevich.san-francisco.ca.us>
 <20171113112312.GZ15260@jhogan-linux> <CAMuHMdUtHhSLbrgmOW7gkEUg8pif+Ddc-zZgWzCZ4WL3JTeOKg@mail.gmail.com>
 <1510576953.9806.1.camel@chimera>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510576953.9806.1.camel@chimera>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Gimpelevich <daniel-R/FLGEdV95bo9U+Z1CfBt0SU0eOFXohjCypLqA8HKkk@public.gmane.org>
Cc: James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>, Linux MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Mon, Nov 13, 2017 at 1:42 PM, Daniel Gimpelevich
<daniel-R/FLGEdV95bo9U+Z1CfBt0SU0eOFXohjCypLqA8HKkk@public.gmane.org> wrote:
> On Mon, 2017-11-13 at 13:31 +0100, Geert Uytterhoeven wrote:
>> I've seen other use cases, e.g. the extension of the du node's
>> "clocks" and
>> "clock-names" properties from arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> to
>> arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts.
>>
>> To avoid the proliferation of "-append" versions of existing
>> properties, what
>> about handling this in dtc, by adding support for an
>> "/append-property/"
>> keyword?
>
> That would not address use case #2 that I mentioned, where the dtb would
> have a "bootargs-append" property but no "bootargs" property.

For use case #2, you were talking about kernel configuration?
Isn't that something completely different?

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
