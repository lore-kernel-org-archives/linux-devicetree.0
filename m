From: "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Subject: Re: [PATCH v1 0/2] pinctrl: Add new pinctrl/GPIO driver
Date: Mon, 23 Sep 2019 11:37:22 +0800
Message-ID: <639ea457-5c40-92ac-9696-14d615b3f43c@linux.intel.com>
References: <cover.1568274587.git.rahul.tanwar@linux.intel.com>
 <CACRpkdb7bPo7oH9w5OhAsOoQXx=MWjJELd5JvBt3R1sPdMjnpw@mail.gmail.com>
 <20190913081807.GB27291@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190913081807.GB27291@lahna.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Andriy Shevchenko <andriy.shevchenko@intel.com>, qi-ming.wu@intel.com, yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com, Mathias Nyman <mathias.nyman@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org


Hi Mika,

On 13/9/2019 4:18 PM, Mika Westerberg wrote:
> On Thu, Sep 12, 2019 at 11:11:32AM +0100, Linus Walleij wrote:
>> Hi Rahul,
>>
>> thanks for your patches!
>>
>> On Thu, Sep 12, 2019 at 8:59 AM Rahul Tanwar
>> <rahul.tanwar@linux.intel.com> wrote:
>>
>>> This series is to add pinctrl & GPIO controller driver for a new SoC.
>>> Patch 1 adds pinmux & GPIO controller driver.
>>> Patch 2 adds the dt bindings document & include file.
>>>
>>> Patches are against Linux 5.3-rc5 at below Git tree:
>>> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
>> OK nice, I think you need to include Mika Westerberg on this review
>> as well, because I think he likes to stay on top of all things intel
>> in pin control. (Also included two other Intel folks in Finland who usually
>> take an interest in these things.)
> Thanks Linus for looping me in.
>
> Even if this is not directly based on the stuff we have under
> drivers/pinctrl/intel/*, I have a couple of comments. I don't have this
> patch series in my inbox so I'm commenting here.
>
> Since the driver name is equilibrium I suggest you to name
> intel_pinctrl_driver and the like (probe, remove) to follow that
> convention to avoid confusing this with the Intel pinctrl drivers under
> drivers/pinctrl/intel/*.
>
> Maybe use eqbr prefix so then intel_pinctrl_driver becomes
> eqbr_pinctrl_driver and so on. Also all the structures like
> intel_pinctrl_drv_data should be changed accordingly.
>
> Ditto for:
>
> MODULE_DESCRIPTION("Intel Pinctrl Driver for LGM SoC");
>
> I think better would be:
>
> MODULE_DESCRIPTION("Pinctrl Driver for LGM SoC (Equilibrium)");
>
> Anyway you get the idea :)

Yes, i understand your point. Will update in v2. Thanks.

Regards,
Rahul
