From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2 1/4] ARM: davinci: fix cpufreq registration on
 da850-evm
Date: Wed, 27 Mar 2019 16:44:29 +0530
Message-ID: <bb734e20-d2c7-73f4-e2c5-3b810ccf4c81@ti.com>
References: <20190322133105.5945-1-brgl@bgdev.pl>
 <20190322133105.5945-2-brgl@bgdev.pl>
 <CAHCN7xJj_aA8XFR6=ZxO-WrfkJRY5fS6NgjHbeqpdfhUnn1apA@mail.gmail.com>
 <CAMpxmJVBTny7kzADSZHQXk_ZUjnRaNWu0Ly3WC8v+zPmR8Dizg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMpxmJVBTny7kzADSZHQXk_ZUjnRaNWu0Ly3WC8v+zPmR8Dizg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Adam Ford <aford173@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Bart,

On 26/03/19 11:21 PM, Bartosz Golaszewski wrote:
> wt., 26 mar 2019 o 15:00 Adam Ford <aford173@gmail.com> napisał(a):
>>
>> On Fri, Mar 22, 2019 at 8:31 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>>
>>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>
>>> The system_rev variable is never set on davinci and is always 0, so
>>> we're using the default max operating point of 300MHz. The cvdd supply
>>> comes from the tps6507 pmic and the voltage can go all the way to 1.3V
>>> so the maximum supported rate should be 456MHz.
>>
>> My understanding is that only certain revisions of the silicon can go
>> to 456MHz.   The L138's Datasheet lists both a 456 and 375 version.  I
>> cannot find a way to read a register to determine which version of the
>> silicon is available. Maybe Sekhar can confirm.
>>
> 
> Commit 28bd2c341120 ("davinci: am18x/da850/omap-l138 evm: add support
> for higher speed grades") mentions the following:
> 
> ---
> U-Boot on the EVM sets up ATAG_REVISION to inform the OS
> regarding the speed grade supported by the silicon. We use
> this information to pass on the speed grade information to
> the SoC code.
> ---
> 
> Should the system_rev somehow reflect that revision? Any way I can check it?

Can you check if the procedure in doc/README.davinci in U-Boot sources 
still works?

Environment Variables
=====================

The DA850 EVM allows the user to specify the maximum cpu clock allowed by the
silicon, in Hz, via an environment variable "maxcpuclk".

The maximum clock rate allowed depends on the silicon populated on the EVM.
Please make sure you understand the restrictions placed on this clock in the
device specific datasheet before setting up this variable. This information is
passed to the Linux kernel using the ATAG_REVISION atag.

If "maxcpuclk" is not defined, the configuration CONFIG_DA850_EVM_MAX_CPU_CLK
is used to obtain this information.

Thanks,
Sekhar
