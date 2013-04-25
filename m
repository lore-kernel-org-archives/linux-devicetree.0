From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 2/8] metag: minimal TZ1090 (Comet) SoC infrastructure
Date: Thu, 25 Apr 2013 16:21:24 +0100
Message-ID: <517949F4.9090106@imgtec.com>
References: <1366727607-27444-1-git-send-email-james.hogan@imgtec.com> <1366727607-27444-3-git-send-email-james.hogan@imgtec.com> <201304231725.34826.arnd@arndb.de> <5176B173.40107@imgtec.com> <CAHkRjk4A5bM=Xsf=DA+OMt0M_e4Y-3XkLPyJirxV4MQOWf25gQ@mail.gmail.com> <5177F182.8050200@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <5177F182.8050200@imgtec.com>
Sender: linux-doc-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree-discuss@lists.ozlabs.org, Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 24/04/13 15:51, James Hogan wrote:
> On 24/04/13 14:26, Catalin Marinas wrote:
>> On 23 April 2013 17:06, James Hogan <james.hogan@imgtec.com> wrote:
>>> It's certainly heading in that direction a lot. For this patchset I
>>> could get away with dropping arch/metag/soc/*, and deal with anything
>>> that really requires something like it later.
>>>
>>> The machine callbacks I was planning on using in future patches are:
>>> * init_time() for calling into the appropriate common clock driver from
>>> time_init(), prior to setting up the timer so that the right frequency
>>> can be reported based on the clock hierarchy specified in DT. I guess
>>> this could be made more general, allowing any enabled clock component to
>>> be initialised at this time.
>>
>> This is driven by DT on arm64, no need for platform callback (see
>> drivers/clocksource/arch_arm_timer.c).
> 
> Right. The problem is that the frequency of the core clock in TZ1090
> (and hence the arch timer that is derived from it) isn't discoverable in
> an arch generic way. I can do something similar to tegra (see
> tegra_clocks_init()) to init the common clk stuff early and then do:
> 
> node = of_find_compatible_node(NULL, NULL, "img,meta");
> clk_core = of_clk_get_by_name(node, "core");
> rate = clk_get_rate(clk_core);
> 
> From time_init prior to setting up the arch timer, but I need a platform
> callback for that.

I take that back, I've just noticed commit
f2f6c2556dcc432e50003bc8fa4d62d95906f149 which makes clock setup
callbacks automatic using section cunningness. :-)

Cheers
James

