From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH] ARM: dts: sun7i: add pinctrl for missing uart mux options
Date: Wed, 20 Feb 2019 10:17:04 +0000
Message-ID: <yw1xbm36ydb3.fsf@mansr.com>
References: <20190216182132.12895-1-mans@mansr.com>
        <CAGb2v66C6HFKgF8kERfp2UQ5XUyNS0-prgC3sX2iobkz7SjBcw@mail.gmail.com>
        <20190220090617.aprfndnidcamwcvy@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220090617.aprfndnidcamwcvy@flea> (Maxime Ripard's message
        of "Wed, 20 Feb 2019 10:06:17 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Maxime Ripard <maxime.ripard@bootlin.com> writes:

> On Wed, Feb 20, 2019 at 04:58:49PM +0800, Chen-Yu Tsai wrote:
>> On Sun, Feb 17, 2019 at 2:21 AM Mans Rullgard <mans@mansr.com> wrote:
>> >
>> > This adds pinctrl settings for various missing uart options.
>> >
>> > Signed-off-by: Mans Rullgard <mans@mansr.com>
>> > ---
>> >  arch/arm/boot/dts/sun7i-a20.dtsi | 45 ++++++++++++++++++++++++++++++++
>> >  1 file changed, 45 insertions(+)
>> >
>> > diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
>> > index af5b067a5f83..2295ff5adf48 100644
>> > --- a/arch/arm/boot/dts/sun7i-a20.dtsi
>> > +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
>> > @@ -944,6 +944,31 @@
>> >                                 function = "uart0";
>> >                         };
>> >
>> > +                       uart0_pf_pins: uart0-pf-pins {
>> > +                               pins = "PF2", "PF4";
>> > +                               function = "uart0";
>> > +                       };
>> 
>> We've had the policy of not adding pinctrl nodes that aren't used in-tree,
>> to avoid bloating up the blob size. However DTC 1.4.7 introduced the new
>> /omit-if-no-ref/ directive, which would make the compiler discard marked
>> nodes if they aren't referenced.
>> 
>> So please add this to all the new nodes. It seems to work regardless whether
>> you add it before or after the label, though having it after the label seems
>> to make vim syntax highlighting happier.
>
> It also works (both for dtc and vim) if we put it on the previous
> line, so something like:
>
> /omit-if-no-ref/
> uart0_pf_pins: uart0-pf-pins {
> };
>
> And it does have the advantage of keeping the same line width, which
> could get pretty long on some nodes.

Thanks, I'd missed that directive.  It always seems needlessly annoying
to make everybody working on a new board to add those nodes separately.

-- 
Måns Rullgård
