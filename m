From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH RFC PoC 0/2] platform: different approach to early
 platform drivers
Date: Fri, 27 Apr 2018 13:59:39 +0530
Message-ID: <6194511c-b649-8c02-7db0-3514bfb292f5@ti.com>
References: <20180426152920.21569-1-brgl@bgdev.pl>
 <20180426173151.GJ3094@brightrain.aerifal.cx>
 <6d1f9114-f1d1-961f-4f36-74adff059dc3@lechnology.com>
 <CAK8P3a0oCH7zyBs8nQd4p+xLrFwDQiJsaKKCF1m04nyXsZxk=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK8P3a0oCH7zyBs8nQd4p+xLrFwDQiJsaKKCF1m04nyXsZxk=g@mail.gmail.com>
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
To: Arnd Bergmann <arnd@arndb.de>, David Lechner <david@lechnology.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>, Jan Kiszka <jan.kiszka@siemens.com>, Michael Turquette <mturquette@baylibre.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Frank Rowand <frowand.list@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Kevin Hilman <khilman@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Michal Suchanek <msuchanek@suse.de>, DTML <devicetree@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Arend van Spriel <aspriel@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Friday 27 April 2018 01:22 PM, Arnd Bergmann wrote:
> On Fri, Apr 27, 2018 at 4:28 AM, David Lechner <david@lechnology.com> wrote:
>> On 04/26/2018 12:31 PM, Rich Felker wrote:
>>>
>>> On Thu, Apr 26, 2018 at 05:29:18PM +0200, Bartosz Golaszewski wrote:
>>>>
>>>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>>
>>>> This is a follow to my series[1] the aim of which was to introduce device
>>>> tree
>>>> support for early platform devices.
>>>>
>>>> It was received rather negatively. Aside from using device tree to pass
>>>> implementation specific details to the system, two important concerns
>>>> were
>>>> raised: no probe deferral support and the fact that currently the early
>>>> devices
>>>> never get converted to actual platform drivers. This series is a
>>>> proof-of-concept that's trying to address those issues.
>>>>
>>>> The only user of the current version of early platform drivers is the
>>>> SuperH
>>>> architecture. If this series eventually gets merged, we could simply
>>>> replace
>>>> the other solution.
>>>
>>>
>>> Looking at a quick output of:
>>>
>>>         grep -r -A10 early_devices[[] arch/sh/kernel/
>>>
>>> it looks like all of the existing early platform devices are serial
>>> ports, clocks, and clocksources. The switch to device tree should pick
>>> them all up from CLK_OF_DECLARE, TIMER_OF_DECLARE, and
>>> EARLYCON_DECLARE. Until that's complete, the existing code works
>>> as-is. I don't see what problem you're trying to solve.
>>
>>
>> The problem for us is that clk maintainers don't want new drivers to use
>> CLK_OF_DECLARE and instead use platform devices. I have just written such
>> a new driver that is shared by 6 different SoCs. For some combinations of
>> SoCs and clocks, using a platform device is fine but on others we need to
>> register early, so the drivers now have to handle both cases, which is
>> kind of messy and fragile. If there is a generic way to register platform
>> devices early, then the code is simplified because we only have to handle
>> one method of registering the clocks instead of two.
> 
> The early_platform code is certainly not a way to make things simpler,
> it just adds one more way of doing the same thing that OF_CLK_DECLARE
> already does. We removed the last early_platform users on ARM a few
> years ago, and I would hope to leave it like that.
> 
> I haven't seen the discussion about your clock drivers, but I know that
> usually only a very small subset of the clocks on an SoC are needed
> that 'early', and you should use a regular platform driver for the rest.

Its true that the subset is small, but they are either PLL bypass clocks
or clocks derived out of the main clock gate controller on the Soc
(DaVinci PSC). So we need some non-platform-device based initialization
support in the two main clock drivers used on mach-davinci anyway.

> Can you elaborate on which devices need to access your clocks before
> you are able to initialize the clk driver through the regular platform_driver
> framework? Do any of these need complex interactions with the clk
> subsystem, or do you just need to ensure they are turned on?

Its just the timer IP. There is no complex interaction, just need to
ensure that the clock is registered with the framework and also switched
on when there is a gate clock.

The latest attempt by David for this was posted last night here:

https://lkml.org/lkml/2018/4/26/1093

Thanks,
Sekhar
