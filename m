From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v4 0/8] ARM: davinci: complete the conversion to using the
 reset framework
Date: Tue, 27 Mar 2018 11:39:54 +0530
Message-ID: <6c55e081-57ba-6c39-8494-cda5022aa927@ti.com>
References: <20180323130455.11470-1-brgl@bgdev.pl>
 <152182378792.178046.3747112581117251857@swboyd.mtv.corp.google.com>
 <CAMRc=MfEebDk4D=t-ybRgbn+HaY7RUfOFCDAf9H8F3cZRchJmA@mail.gmail.com>
 <152182490783.178046.1191965992600877708@swboyd.mtv.corp.google.com>
 <CAMRc=MdmTAwPAAnL1+n+OXSycnyjuQ1hKmts158mPcgat1NUYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMRc=MdmTAwPAAnL1+n+OXSycnyjuQ1hKmts158mPcgat1NUYQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-remoteproc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Bart,

On Friday 23 March 2018 10:46 PM, Bartosz Golaszewski wrote:
> 2018-03-23 18:08 GMT+01:00 Stephen Boyd <sboyd@kernel.org>:
>> Quoting Bartosz Golaszewski (2018-03-23 09:55:47)
>>> 2018-03-23 17:49 GMT+01:00 Stephen Boyd <sboyd@kernel.org>:
>>>> Quoting Bartosz Golaszewski (2018-03-23 06:04:47)
>>>>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>>>
>>>>> This series converts the only user of the handcoded, mach-specific reset
>>>>> routines in the davinci platform to using the reset framework.
>>>>>
>>>>> Patch 1 modifies the way lookup entries are registered with the reset
>>>>> framework.
>>>>>
>>>>> Patches 2-4 add necessary lookups/DT-properties.
>>>>>
>>>>> Patches 5-7 convert the davinci-rproc driver to the reset framework.
>>>>>
>>>>> Patch 8 removes now dead code.
>>>>>
>>>>> Philipp: it turned out that it's indeed better to use the reset
>>>>> controller's device name for the entry lookup.
>>>>>
>>>>> Tested both in DT and legacy modes by booting the examples from
>>>>> ti-ipc-rtos recipe in meta-ti.
>>>>>
>>>>> This series applies on top of David Lechner's common-clk-v9 branch[1]
>>>>> with Philipp Zabel's reset/next branch[2] pulled in.
>>>>>
>>>>> It can be found in my github tree as well[3].
>>>>>
>>>>
>>>> What's the merge strategy for the rest of the patches? I should apply
>>>> the clk ones after the next -rc1?
>>>
>>> Or maybe Philipp can provide us with an immutable branch with the reset patches?
>>>
>>> The you could apply the driver patches and let Sekhar take all the
>>> platform code?
>>>
>>
>> Ok that could work too.
> 
> Ohad, Bjorn can you ack the remoteproc patches? Are you OK with
> Stephen taking them through the clock tree? Otherwise it would get
> complicated since they depend on the first clk patch and the last clk
> patch depends on them.

I will not be queuing the DTS patches for v4.17. They depend on clock
framework DTS patches which itself I plan to queue for v4.18. Given
this, I think the best bet is:

Ohad/Bjorn queue remoteproc patches already acked by Suman and having no
dependencies. That is, 5/8 and 6/8.

If Philipp can provide an immutable branch with reset changes, it will
be great and Stephen can queue 4/8. If not, its best to resend that
patch to Stephen once v4.17-rc1 is out.

The remaining patches need to wait till v4.18 (or even v4.19 if
dependencies don't pan out well).

Thanks,
Sekhar
