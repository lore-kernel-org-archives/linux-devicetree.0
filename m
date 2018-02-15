From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] rtc: isl12026: Add driver.
Date: Thu, 15 Feb 2018 16:35:38 +0200
Message-ID: <CAHp75VcnR2U3DgSCv5Lpj=UBQnzX7YCbvbxzv__cZmW_+VcidQ@mail.gmail.com>
References: <20180214005536.22739-1-david.daney@cavium.com>
 <CAHp75VcQm-gr0GRszBSRJSZOpdSutRyhVkw-BN_YAwhjaPM4yg@mail.gmail.com> <20180215131533.GL8219@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180215131533.GL8219@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: David Daney <david.daney@cavium.com>, Alessandro Zummo <a.zummo@towertech.it>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-rtc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 15, 2018 at 3:15 PM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> On 15/02/2018 at 14:45:11 +0200, Andy Shevchenko wrote:
>> On Wed, Feb 14, 2018 at 2:55 AM, David Daney <david.daney@cavium.com> wrote:

>> > +#ifdef CONFIG_OF
>>
>> Remove this ugly #ifdef. Your driver OF only one.
>>
>
> Well, it is DT only because you asked for that on v1.

Yes, and I asked to remove these #ifdef:s there as well.

-- 
With Best Regards,
Andy Shevchenko
