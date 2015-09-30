From: Pratyush Anand <panand@redhat.com>
Subject: Re: [PATCH v7 0/8] Watchdog: introduce ARM SBSA watchdog driver
Date: Wed, 30 Sep 2015 22:43:38 +0530
Message-ID: <20150930171338.GC15745@dhcppc0.redhat.com>
References: <=fu.wei@linaro.org>
 <1440435683-7343-1-git-send-email-fu.wei@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1440435683-7343-1-git-send-email-fu.wei@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: fu.wei@linaro.org
Cc: Suravee.Suthikulpanit@amd.com, hanjun.guo@linaro.org, linaro-acpi@lists.linaro.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, tekkamanninja@gmail.com, graeme.gregory@linaro.org, al.stone@linaro.org, arnd@arndb.de, linux@roeck-us.net, vgandhi@codeaurora.org, wim@iguana.be, jcm@redhat.com, leo.duran@amd.com, corbet@lwn.net, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, rjw@rjwysocki.net, dyoung@redhat.com
List-Id: devicetree@vger.kernel.org

Hi Fu Wei,

On 25/08/2015:01:01:15 AM, fu.wei@linaro.org wrote:
> From: Fu Wei <fu.wei@linaro.org>
> 
> This patchset:
>     (1)Introduce Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt
>     for FDT info of SBSA Generic Watchdog, and give two examples of
>     adding SBSA Generic Watchdog device node into the dts files:
>     foundation-v8.dts and amd-seattle-soc.dtsi.
> 
>     (2)Introduce "pretimeout" into the watchdog framework, and update
>     Documentation/watchdog/watchdog-kernel-api.txt to introduce:
>         (1)the new elements in the watchdog_device and watchdog_ops struct;
>         (2)the new API "watchdog_init_timeouts".
> 
>     (3)Introduce ARM SBSA watchdog driver:
>         a.Use linux kernel watchdog framework;
>         b.Work with FDT on ARM64;
>         c.Use "pretimeout" in watchdog framework;
>         d.Support getting timeout and pretimeout from parameter and FDT
>           at the driver init stage.
>         e.In the first timeout, do panic to save system context;
>         f.In the second stage, user can still feed the dog without
>           cleaning WS0. By this feature, we can avoid the panic infinite
>           loops, while backing up a large system context in a server.
>         g.In the second stage, can trigger WS1 by setting pretimeout = 0
>           if necessary.
> 
>     (4)Introduce ACPI GTDT parser: drivers/acpi/gtdt.c
>     Parse SBSA Generic Watchdog Structure in GTDT table of ACPI,
>     and create a platform device with that information.
>     This platform device can be used by This Watchdog driver.
>     drivers/clocksource/arm_arch_timer.c is simplified by this GTDT support.
> 
> This patchset has been tested with watchdog daemon
> (ACPI/FDT, module/build-in) on the following platforms:
>     (1)ARM Foundation v8 model
> 

I tested it with kdump on fedora-arm64 Seattle platform. I enabled watchdog
using systemd (with 30s timeout), insured that watchdog is active and then
crashed the system. I can see that kdump kernel loads sbsa_wdt and activates
watchdog, still vmcore copy is done successfully.
My test kernel is here [1]

~Pratyush

[1] https://github.com/pratyushanand/linux/commits/wdt/sbsa-test-kexec 
