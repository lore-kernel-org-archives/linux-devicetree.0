From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] drivers/of: Add devm_of_iomap()
Date: Tue, 12 Jun 2018 11:35:17 +0300
Message-ID: <CAHp75VfJNrviiiam9p49+6_oSjW+YH8vwjcZ2hn5Ux5mHgDCQw@mail.gmail.com>
References: <23be2945b593a36d8fa1970bb579389c0f892a3e.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <23be2945b593a36d8fa1970bb579389c0f892a3e.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 12, 2018 at 3:01 AM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> There are still quite a few cases where a device might want to get to a
> different node of the device-tree, obtain the resources and map them.
>
> Drivers doing that currently open code the whole thing, which is error
> proe.

prone

>
> We have of_iomap() and of_io_request_and_map() but they both have shortcomings,
> such as not returning the size of the resource found (which can be necessary)
> and not being "managed".
>
> This adds a devm_of_iomap() that provides all of these and should probably
> replace uses of the above in most drivers.

It feels like a wrong approach.
Can OF graph help here? Would it be better approach?

-- 
With Best Regards,
Andy Shevchenko
