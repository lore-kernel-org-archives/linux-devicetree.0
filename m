From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH 2/3] clk: bcm: Update and add tingray clock entries
Date: Fri, 1 Jun 2018 17:47:34 -0700
Message-ID: <fc69e9e4-c223-512f-e76c-d9f1062d9d35@broadcom.com>
References: <1527266717-8406-1-git-send-email-ray.jui@broadcom.com>
 <1527266717-8406-3-git-send-email-ray.jui@broadcom.com>
 <20180531162556.GA955@rob-hp-laptop>
 <a354f3d1-051d-8b68-e6b3-ce7a739c10c9@broadcom.com>
 <CAL_Jsq+YX01CwCycqeu5mxTUiWtnG3HKPJP5mvJO2OHcPF6v6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+YX01CwCycqeu5mxTUiWtnG3HKPJP5mvJO2OHcPF6v6g@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Pramod Kumar <pramod.kumar@broadcom.com>
List-Id: devicetree@vger.kernel.org



On 6/1/2018 12:02 PM, Rob Herring wrote:
> On Fri, Jun 1, 2018 at 12:56 PM, Ray Jui <ray.jui@broadcom.com> wrote:
>> Hi Rob,
>>
>> On 5/31/2018 9:25 AM, Rob Herring wrote:
>>>
>>> On Fri, May 25, 2018 at 09:45:16AM -0700, Ray Jui wrote:
>>>>
>>>> Update and add Stingray clock definitions and tables so they match the
>>>> binding document and the latest ASIC datasheet
>>>>
>>>> Signed-off-by: Pramod Kumar <pramod.kumar@broadcom.com>
>>>> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
>>>> ---
>>>>    drivers/clk/bcm/clk-sr.c           | 135
>>>> ++++++++++++++++++++++++++++++++-----
>>>>    include/dt-bindings/clock/bcm-sr.h |  24 +++++--
>>>
>>>
>>> This goes in the 1st patch.
>>
>>
>> Please help to confirm. You want 1st patch and 2nd patch to be combined into
>> a single patch?
> 
> No. include/dt-bindings/* is part of the DT binding, so it goes with
> patch 1. The driver in patch 2.
> 
> Rob
> 

Okay got it. Thanks!
