From: Daniel Gimpelevich <daniel-R/FLGEdV95bo9U+Z1CfBt0SU0eOFXohjCypLqA8HKkk@public.gmane.org>
Subject: Re: [PATCH] MIPS: implement a "bootargs-append" DT property
Date: Mon, 13 Nov 2017 19:05:54 -0800
Message-ID: <1510628754.14209.27.camel@chimera>
References: <1510420788-25184-1-git-send-email-daniel@gimpelevich.san-francisco.ca.us>
         <20171113112312.GZ15260@jhogan-linux>
         <CAL_JsqJRVB928DVOAVQGrtT_EOuQBHkBhcd9+XFzqemutG65GA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJRVB928DVOAVQGrtT_EOuQBHkBhcd9+XFzqemutG65GA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2017-11-13 at 10:34 -0600, Rob Herring wrote:
> This is a kernel problem. What's the use case where you want the DT to
> override the kernel?
> 
> One way you could handle this is make bootargs be multiple strings.
> Well 2 specifically, the first string is prepended and the 2nd is
> appended. That complicates how you'd implement /append-property/
> though as you'd probably want to support both string cat and 2
> strings. Though the latter works more generically without knowing the
> data type.

Let's say the bootloader tells the kernel that the command line is "foo
bar" and that "baz" is in the dtb. Currently, there are kernel
configuration options to control whether this means the kernel's command
line will be "baz" or "baz foo bar" instead, but there is no way to turn
it into "foo bar baz" without either creating new kernel configuration
options or this patch. Implementing it via this patch would allow a
theoretical distro to use a generic kernel across different devices that
need the arguments from their bootloader manipulated in different ways.

Ideally, the MIPS-specific kernel configuration options for how to treat
the dtb's bootargs with respect to the bootloader's bootargs should go
away in favor of an analogous device tree property "bootargs-prepend"
for this reason. The kernel configuration options to supply a hard-coded
default command line if the bootloader does not supply one, and to
override what the bootloader and dtb supply, would remain. This would
separate the need for an alternate or "recovery" kernel to supply its
own bootargs to override the dtb from the need to have device-specific
bootargs in the dtb override a legacy bootloader, where the manner its
bootargs are overridden may be device-specific.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
