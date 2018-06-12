From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] drivers/of: Add devm_of_iomap()
Date: Tue, 12 Jun 2018 20:28:48 +1000
Message-ID: <53ef03b26a17738dc1465ce85562c9611ad415f8.camel@kernel.crashing.org>
References: <23be2945b593a36d8fa1970bb579389c0f892a3e.camel@kernel.crashing.org>
         <CAHp75VfJNrviiiam9p49+6_oSjW+YH8vwjcZ2hn5Ux5mHgDCQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfJNrviiiam9p49+6_oSjW+YH8vwjcZ2hn5Ux5mHgDCQw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2018-06-12 at 11:35 +0300, Andy Shevchenko wrote:
> On Tue, Jun 12, 2018 at 3:01 AM, Benjamin Herrenschmidt
> <benh@kernel.crashing.org> wrote:
> > There are still quite a few cases where a device might want to get to a
> > different node of the device-tree, obtain the resources and map them.
> > 
> > Drivers doing that currently open code the whole thing, which is error
> > proe.
> 
> prone
> 
> > 
> > We have of_iomap() and of_io_request_and_map() but they both have shortcomings,
> > such as not returning the size of the resource found (which can be necessary)
> > and not being "managed".
> > 
> > This adds a devm_of_iomap() that provides all of these and should probably
> > replace uses of the above in most drivers.
> 
> It feels like a wrong approach.
> Can OF graph help here? Would it be better approach?

I don't quite understand what your objection is nor what "OF graph"
is...

This is a direct replacement for the open coded equivalent that a
number of drivers do, almost always without using devm_* or forgetting
to request the resources etc... Ie, a less bug-prone tool in the
toolbox.

So there's a real use case here.

In fact a driver I'm going to submit soon uses it, which is why I wrote
it in the first place, rather than adding yet another open-coded case.

And to reply to the inevitable next reaction, NO this is not a case for
creating yet another 237 layers of abstractions. Sometimes, a driver
needs to directly access (no regmap overhead please) some regions
represented by a specific DT node (it could be a child of the device
for example representing a portion of its register space, or it could
be a separate piece of HW that needs to be used by the device but
doesn't fit in any abstract model and shouldn't).

Ben.
