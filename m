From: David Collins <collinsd@codeaurora.org>
Subject: Re: [PATCH v1 0/5] Solve postboot supplier cleanup and optimize probe
 ordering
Date: Fri, 31 May 2019 16:27:10 -0700
Message-ID: <bddb15c9-0195-13ca-e829-0a511595c84e@codeaurora.org>
References: <20190524010117.225219-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524010117.225219-1-saravanak@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

Hello Saravana,

On 5/23/19 6:01 PM, Saravana Kannan wrote:
...
> Having functional dependencies explicitly called out in DT and
> automatically added before the devices are probed, provides the
> following benefits:
...
> - Supplier devices like clock providers, regulators providers, etc
>   need to keep the resources they provide active and at a particular
>   state(s) during boot up even if their current set of consumers don't
>   request the resource to be active. This is because the rest of the
>   consumers might not have probed yet and turning off the resource
>   before all the consumers have probed could lead to a hang or
>   undesired user experience.
This benefit provided by the sync_state() callback function introduced in
this series gives us a mechanism to solve a specific problem encountered
on Qualcomm Technologies, Inc. (QTI) boards when booting with drivers
compiled as modules.  QTI boards have a regulator that powers the PHYs for
display, camera, USB, UFS, and PCIe.  When these boards boot up, the boot
loader enables this regulator along with other resources in order to
display a splash screen image.  The regulator must remain enabled until
the Linux display driver has probed and made a request with the regulator
framework to keep the regulator enabled.  If the regulator is disabled
prematurely, then the screen image is corrupted and the display hardware
enters a bad state.

We have observed that when the camera driver probes before the display
driver, it performs this sequence: regulator_enable(), camera register IO,
regulator_disable().  Since it is the first consumer of the shared
regulator, the regulator is physically disabled (even though display
hardware still requires it to be enabled).  We have solved this problem
when compiling drivers statically with a downstream regulator
proxy-consumer driver.  This proxy-consumer is able to make an enable
request for the shared regulator before any other consumer.  It then
removes its request at late_initcall_sync.

Unfortunately, when drivers are compiled as modules instead of compiled
statically into the kernel image, late_initcall_sync is not a meaningful
marker of driver probe completion.  This means that our existing proxy
voting system will not work when drivers are compiled as modules.  The
sync_state() callback resolves this issue by providing a notification that
is guaranteed to arrive only after all consumers of the shared regulator
have probed.

QTI boards have other cases of shared resources such as bus bandwidth
which must remain at least at a level set by boot loaders in order to
properly support hardware blocks that are enabled before the Linux kernel
starts booting.

Take care,
David

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
