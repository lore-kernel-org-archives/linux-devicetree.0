From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH 5/6] ARM: dts: sunxi: Add Allwinner H3 DTSI
Date: Sat, 24 Oct 2015 10:39:49 +0200
Message-ID: <562B43D5.5060900@redhat.com>
References: <1445444428-4652-1-git-send-email-jenskuske@gmail.com>
 <1445444428-4652-2-git-send-email-jenskuske@gmail.com>
 <20151023181406.GK10947@lukather>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBZUHVWYQKGQE4ICGIOY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20151023181406.GK10947@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 10/23/2015 08:14 PM, Maxime Ripard wrote:
> On Wed, Oct 21, 2015 at 06:20:27PM +0200, Jens Kuske wrote:
>> +		bus_gates: clk@01c20060 {
>> +			#clock-cells = <1>;
>> +			compatible = "allwinner,sun8i-h3-bus-gates-clk";
>> +			reg = <0x01c20060 0x14>;
>> +			clock-indices = <5>, <6>, <8>,
>> +					<9>, <10>, <13>,
>> +					<14>, <17>, <18>,
>> +					<19>, <20>,
>> +					<21>, <23>,
>> +					<24>, <25>,
>> +					<26>, <27>,
>> +					<28>, <29>,
>> +					<30>, <31>, <32>,
>> +					<35>, <36>, <37>,
>> +					<40>, <41>, <43>,
>> +					<44>, <52>, <53>,
>> +					<54>, <64>,
>> +					<65>, <69>, <72>,
>> +					<76>, <77>, <78>,
>> +					<96>, <97>, <98>,
>> +					<112>, <113>,
>> +					<114>, <115>, <116>,
>> +					<128>, <135>;
>> +			clocks = <&ahb1>, <&ahb1>, <&ahb1>,
>> +				 <&ahb1>, <&ahb1>, <&ahb1>,
>> +				 <&ahb1>, <&ahb2>, <&ahb1>,
>> +				 <&ahb1>, <&ahb1>,
>> +				 <&ahb1>, <&ahb1>,
>> +				 <&ahb1>, <&ahb1>,
>> +				 <&ahb1>, <&ahb1>,
>> +				 <&ahb1>, <&ahb2>,
>> +				 <&ahb2>, <&ahb2>, <&ahb1>,
>> +				 <&ahb1>, <&ahb1>, <&ahb1>,
>> +				 <&ahb1>, <&ahb1>, <&ahb1>,
>> +				 <&ahb1>, <&ahb1>, <&ahb1>,
>> +				 <&ahb1>, <&apb1>,
>> +				 <&apb1>, <&apb1>, <&apb1>,
>> +				 <&apb1>, <&apb1>, <&apb1>,
>> +				 <&apb2>, <&apb2>, <&apb2>,
>> +				 <&apb2>, <&apb2>,
>> +				 <&apb2>, <&apb2>, <&apb2>,
>> +				 <&ahb1>, <&ahb1>;
>
> This is not really what I had in mind...

I came to the same solution independently, I took my inspiration from
the rockchip clocks driver which is dealing with this problem in the
same way, so there is precedent for doing things this way, and this
does give us lot of flexibility. Given that I expect other new allwinnner
SoCs to have the same problem I believe it is good to have that
flexibility.

> This IP has 2 parents, and only two parents.

Nope it has 4: apb1, apb2, ahb1 and ahb2.

> The mapping between the
> IPs should be done in the driver itself, not in the DT where it is
> very error prone and barely readable.

It is just as error prone and barely readable in C-code, see Jens original
patchset, he did an array of clock indices there (range 0-3 with an index
into the parent clocks array), which is arguably even more unreadable since
there is an extra level of indirection here.

The problem with the unreadability simply comes from allwinner's decision
to no longer have a gates register per bus but instead shove everything
in a single bit-array in random order, there is nothing we can do to fix
that.

Also the argument "this belongs in the driver not in the DT" is a bit
inconsistent with the moving of the mask of valid gates from the
driver into the clock-indices in devicetree. The way things are done
here actually are doing pretty much the same thing, putting info which
could be derived from the compatible string into devicetree.

Last as said already there is precedent for doing things this way
in the rockchip driver, and given that 2 people have come up
with this approach independently of of each other this clearly
seems to be the most straight-foward / logical way to deal with
this.

> And note that I never have expected you to use clk-simple-gates
> either. This is a complicated clock

No it is not complicated, have you looked at the changes to the
simple-clk-gates driver which Jean Francois Moine suggested?

Those 5 extra lines (4 new lines) are all that is needed when
going with the approach of listing a parent per gate. This is
actually still a quite simple clock, we only need to find a way
to specify a parent per gate, preferably via DT since this gives
us greater flexibility which will be quite useful when adding
support for other SoCs.

Regards,

Hans
