From: Joel Stanley <joel@jms.id.au>
Subject: Re: [RFC-ish PATCH 00/17] Clean up ASPEED devicetree warnings
Date: Fri, 2 Aug 2019 05:51:23 +0000
Message-ID: <CACPK8Xc4Vigeu1B1Su5392BSCSKfoEDqt_tiDtgKmNH5ucAvAg@mail.gmail.com>
References: <20190726053959.2003-1-andrew@aj.id.au> <CAL_JsqJ+sFDG8eKbV3gvmqVHx+otWbki4dY213apzXgfhbXXEw@mail.gmail.com>
 <fd8e57f0-aee2-403e-b6fb-76d0c18fe306@www.fastmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fd8e57f0-aee2-403e-b6fb-76d0c18fe306@www.fastmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Adriana Kobylak <anoo@us.ibm.com>, "Alexander A. Filippov" <a.filippov@yadro.com>, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?WWFuZ0JyaWFuQy5XIOaliuWYieWBiSBUQU8=?= <yang.brianc.w@inventec.com>, Corey Minyard <minyard@acm.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Haiyue Wang <haiyue.wang@linux.intel.com>, John Wang <wangzqbj@inspur.com>, Ken Chen <chen.kenyy@inventec.com>, Linus Walleij <linus.walleij@linaro.org>"open list:GPIO SUBSYSTEM" <linux>
List-Id: devicetree@vger.kernel.org

On Tue, 30 Jul 2019 at 01:09, Andrew Jeffery <andrew@aj.id.au> wrote:

> > > The bang-for-buck is in fixing up the KCS bindings which removes all-but-two of
> > > the remaining warnings (which we can't feasibly remove), but doing so forces
> > > code changes (which I'd avoided up until this point).
> > >
> > > Reflecting broadly on the fixes, I think I've made a mistake way back by using
> > > syscon/simple-mfds to expose the innards of the SCU and LPC controllers in the
> > > devicetree. This series cleans up what's currently there, but I have half a
> > > mind to rev the SCU and LPC bindings to not use simple-mfd and instead have a
> > > driver implementation that uses `platform_device_register_full()` or similar to
> > > deal with the mess.
> > >
> > > Rob - I'm looking for your thoughts here and on the series, I've never felt
> > > entirely comfortable with what I cooked up. Your advice would be appreciated.
> >
> > The series generally looks fine to me from a quick scan. As far as
> > dropping 'simple-mfd', having less fine grained description in DT is
> > generally my preference. It comes down to whether what you have
> > defined is maintainable. As most of it is just additions, I think what
> > you have is fine. Maybe keep all this in mind for the next chip
> > depending how the SCU and LPC change.
>
> Okay, I think the timing of that suggestion is good given where things are with
> the AST2600. I'll keep that in mind.
>
> Consensus so far seems to be that the series is fine. I'll split it up and send out
> the sub-series to the relevant lists with the acks accumulated here.

The series look good. I suggest posting the KCS bindings and driver
changes as their own series to go through the IPMI tree.

Please add my tag to all the patches except the OCC one, which I need
to do some investigation in to.

Reviewed-by: Joel Stanley <joel@jms.id.au>

The others can go via the aspeed tree. Perhaps post them as their own
series too so I don't get confused and apply the wrong ones. That way
if Rob wants to send his reviewed-by he can.

Cheers,

Joel
