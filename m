From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] drivers/of: Add devm_of_iomap()
Date: Wed, 13 Jun 2018 11:18:51 +0300
Message-ID: <CAHp75Vey4sVb=VHRXCB3WHDwuwBUM24gbnjt+hHTJuTmUoQgQA@mail.gmail.com>
References: <23be2945b593a36d8fa1970bb579389c0f892a3e.camel@kernel.crashing.org>
 <CAHp75VfJNrviiiam9p49+6_oSjW+YH8vwjcZ2hn5Ux5mHgDCQw@mail.gmail.com>
 <53ef03b26a17738dc1465ce85562c9611ad415f8.camel@kernel.crashing.org>
 <CAHp75Vcdaejn=eq740YNdscSv9zX9xj3RzYp=AFs8HFprw34_Q@mail.gmail.com>
 <5d932502d9985cdfa6540480ea5ce6b0730502a1.camel@kernel.crashing.org>
 <CAHp75VfV7actoXkMUbh9KwAXR1FKR_VZ5RAuaL-pKLSynFi-3g@mail.gmail.com> <ddc9a616517f8c4255efe2f57d13d3b3ba81ee89.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ddc9a616517f8c4255efe2f57d13d3b3ba81ee89.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 13, 2018 at 3:18 AM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:

> But there are many other uses of things like of_iomap() which could
> benefit from switching to devm_of_iomap() and thus getting the
> automated cleanup on exit and appropriate request of the memory
> resource.

Fine, fine.

-- 
With Best Regards,
Andy Shevchenko
