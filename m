From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] drivers/of: Add devm_of_iomap()
Date: Wed, 13 Jun 2018 02:16:05 +0300
Message-ID: <CAHp75VfV7actoXkMUbh9KwAXR1FKR_VZ5RAuaL-pKLSynFi-3g@mail.gmail.com>
References: <23be2945b593a36d8fa1970bb579389c0f892a3e.camel@kernel.crashing.org>
 <CAHp75VfJNrviiiam9p49+6_oSjW+YH8vwjcZ2hn5Ux5mHgDCQw@mail.gmail.com>
 <53ef03b26a17738dc1465ce85562c9611ad415f8.camel@kernel.crashing.org>
 <CAHp75Vcdaejn=eq740YNdscSv9zX9xj3RzYp=AFs8HFprw34_Q@mail.gmail.com> <5d932502d9985cdfa6540480ea5ce6b0730502a1.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5d932502d9985cdfa6540480ea5ce6b0730502a1.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 13, 2018 at 1:58 AM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Tue, 2018-06-12 at 19:53 +0300, Andy Shevchenko wrote:
>>
>> > > It feels like a wrong approach.
>> > > Can OF graph help here? Would it be better approach?
>> >
>> > I don't quite understand what your objection is nor what "OF graph"
>> > is...
>>
>> There is no objection per se, just a doubt that this is a right thing to do.
>> I might be wrong, of course.
>>
>> OF graph nodes is a special API that allows you to access like you
>> said "different node of device-tree".
>> https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/graph.txt
>
> So I had a look and this is just an example on how to use phandles to
> link ports and endpoints... I fail to see how that relates to what this
> patch does.

Because your patch does nothing except another layring of the existing APIs.

> In the driver I'm doing for example, I do use a similar technique to
> "point" to the other node. In this case, this is a coprocessor in the
> SoC and I'm linking to the node that represent its interrupt controller
> (and its not a full fledged OS running there so we don't have a full
> interrupt tree for it).

Hmm... So, you are trying to solve problem with other methods which
might be not so suitable at all?

-- 
With Best Regards,
Andy Shevchenko
