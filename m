From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Question about "unit address format error" of DTC
Date: Thu, 9 Nov 2017 08:15:11 -0600
Message-ID: <CAL_Jsq+eZkCQTEHLb62Le3e6eLxt=N7EWGk7dsPAfLF9-73soQ@mail.gmail.com>
References: <CAK7LNARujG8J_z62bc+PQOz34rf-Bo=+M54kvtokZxnktn2Y+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNARujG8J_z62bc+PQOz34rf-Bo=+M54kvtokZxnktn2Y+A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 9, 2017 at 6:14 AM, Masahiro Yamada
<yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
> Hi Rob, David,
>
>
> I am just curious about a DTC warning.
>
>
> For example,
>
> soc {
>     compatible = "simple-bus";
>     #address-cells = <1>;
>     #size-cells = <1>;
>     ranges;
>
>     foo@11111111 {
>          compatible = "foo";
>          reg = <0x54006800 0x40>;
>     };
> };
>
> This emits the following warning.
>
> Warning (simple_bus_reg): Node /soc/foo@11111111 simple-bus unit
> address format error, expected "54006800"
>
>
> But, if I replace "simple-bus" with "simple-mfd",
> DTC is completely happy.

We could probably add simple-mfd to the check. Though, if you have
addresses, then you probably should use simple-bus. I'm not a bit fan
of simple-mfd in general.

> Why is this check limited to simple bus / PCI bus?

Because bus types are free to define their own unit address format to
some extent.

> For other cases, is mismatching @<address>  allowed?

No, but it is not checked. Most other cases such as I2C and SPI buses
aren't checked because we have no generic way to key off of them. We
need schema data with compatible strings of those bus controllers to
do the checking.

Any bus type needs to define its unit address format. Generally, it
must match data fields in reg property and distinct fields are
separated by commas.

Rob
