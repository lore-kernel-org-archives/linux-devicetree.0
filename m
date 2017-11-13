From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] MIPS: implement a "bootargs-append" DT property
Date: Mon, 13 Nov 2017 10:34:11 -0600
Message-ID: <CAL_JsqJRVB928DVOAVQGrtT_EOuQBHkBhcd9+XFzqemutG65GA@mail.gmail.com>
References: <1510420788-25184-1-git-send-email-daniel@gimpelevich.san-francisco.ca.us>
 <20171113112312.GZ15260@jhogan-linux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171113112312.GZ15260@jhogan-linux>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>
Cc: Daniel Gimpelevich <daniel-R/FLGEdV95bo9U+Z1CfBt0SU0eOFXohjCypLqA8HKkk@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 13, 2017 at 5:23 AM, James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org> wrote:
> On Sat, Nov 11, 2017 at 09:19:48AM -0800, Daniel Gimpelevich wrote:
>> There are two uses for this:
>>
>> 1) It may be useful to split a device-specific kernel command line between
>> a .dts file and a .dtsi file, with "bootargs" in one and "bootargs-append"
>> in the other, such as for variations of a reference board.

What Geert said.

>> 2) There are kernel configuration options for prepending "bootargs" to the
>> kernel command line that the bootloader has passed, but not for appending.
>> A new option for this would be a less future-proof solution, since things
>> like this should be in the dtb.

This is a kernel problem. What's the use case where you want the DT to
override the kernel?

One way you could handle this is make bootargs be multiple strings.
Well 2 specifically, the first string is prepended and the 2nd is
appended. That complicates how you'd implement /append-property/
though as you'd probably want to support both string cat and 2
strings. Though the latter works more generically without knowing the
data type.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
