From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V5] clk: bcm: Add driver for BCM53573 ILP clock
Date: Mon, 5 Sep 2016 14:12:47 +0200
Message-ID: <CACna6ry6-Fn7bJS8jz1kF42RPQBaH_OgzP5VEhFW=C1-183NHg@mail.gmail.com>
References: <20160823061745.8162-1-zajec5@gmail.com> <20160823062613.13865-1-zajec5@gmail.com>
 <20160823195528.GA17844@rob-hp-laptop> <CACna6rzeLdAW_mEpUN355Xrr3v-zjBtQW_4z-gV1kOrPS=wr8A@mail.gmail.com>
 <20160831161651.GA32012@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160831161651.GA32012@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 31 August 2016 at 18:16, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Aug 25, 2016 at 02:42:52PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> On 23 August 2016 at 21:55, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> > On Tue, Aug 23, 2016 at 08:25:59AM +0200, Rafa=C5=82 Mi=C5=82ecki wrot=
e:
>> >> From: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>> >>
>> >> This clock is present on BCM53573 devices (including BCM47189) that u=
se
>> >> Cortex-A7. ILP is a part of PMU (Power Management Unit) and so it sho=
uld
>> >> be defined as one of its subnodes (subdevices). For more details see
>> >> Documentation entry.
>> >>
>> >> Unfortunately there isn't a set of registers related to ILP clock onl=
y.
>> >> We use registers 0x66c, 0x674 and 0x6dc and between them there are e.=
g.
>> >> "retention*" and "control_ext" regs. This is why this driver maps all
>> >> 0x1000 B of space.
>> >
>> > Then describe the block as a syscon which has several functions of
>> > which clocks are one.
>>
>> This isn't clear to me, sorry, could you describe it? Would you like
>> me to update commit message or documentation? Is code fine as is?
>
> Let me put it another way, when you need to use the other registers, how
> do you plan to describe them in DT? We don't really want a node per
> register, nor do I want to get binding docs one by one as you add each
> function. Instead describe the block with all the misc functions as a
> whole. What would you call that block? Still ILP or something else?
>
> Also, you if you do have multiple drivers all needing to access this
> single block, then that is when you need syscon and regmap.

I got this now, thanks for your patience.

One last question: what is preferred register reference:
1) Parent-child (of_get_parent + syscon_node_to_regmap)
or
2) DT property (syscon_regmap_lookup_by_phandle(dt, "foo"))

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
