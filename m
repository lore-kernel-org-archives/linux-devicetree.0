From: Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH v4 0/8] ARM: davinci: complete the conversion to using the
 reset framework
Date: Fri, 23 Mar 2018 19:30:31 -0500
Message-ID: <c78817f9-02fd-0ded-609e-5014efdd4a77@ti.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>, linux-remoteproc@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Russell King <linux@armlinux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Bart,

On 03/23/2018 12:16 PM, Bartosz Golaszewski wrote:
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

I will take a closer look and test on Mon. A quick glance of the
remoteproc changes seem to be fine. I will let Bjorn comment on the
patch flow.

The only reason I had to use the clock in the driver was for the reset
before, and hopefully this will allow me to actually switch to using
pm_runtime API like I do with the rest of the TI remoteproc drivers
(Keystone remoteproc driver also uses PSC for clock and reset but then
it goes through different set of drivers).

So, I see a mix of driver and dts patches in the series, are all the dts
patches coming through Sekhar?

regards
Suman

> 
> Thanks,
> Bart
> --
> To unsubscribe from this list: send the line "unsubscribe linux-remoteproc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
