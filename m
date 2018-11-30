From: Lina Iyer <ilina@codeaurora.org>
Subject: Re: [RFC v3 2/3] dt-bindings: sdm845-pinctrl: add wakeup interrupt
 parent for GPIO
Date: Fri, 30 Nov 2018 11:33:17 -0700
Message-ID: <20181130183317.GL18262@codeaurora.org>
References: <20181121000648.29262-1-ilina@codeaurora.org>
 <20181121000648.29262-3-ilina@codeaurora.org>
 <154283618199.88331.10217252750356423959@swboyd.mtv.corp.google.com>
 <20181126161455.GA28236@codeaurora.org>
 <154330994255.88331.11409511159882116164@swboyd.mtv.corp.google.com>
 <20181127182123.GC28236@codeaurora.org>
 <154335513853.88331.9713562640538396853@swboyd.mtv.corp.google.com>
 <20181128173959.GC18262@codeaurora.org>
 <20181129002457.GJ24969@minitux>
 <20181129214539.GG18262@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181129214539.GG18262@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>, evgreen@chromium.org, marc.zyngier@arm.com, linux-kernel@vger.kernel.org, rplsssn@codeaurora.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, thierry.reding@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, Nov 29 2018 at 14:45 -0700, Lina Iyer wrote:
>On Wed, Nov 28 2018 at 17:25 -0700, Bjorn Andersson wrote:
>>On Wed 28 Nov 09:39 PST 2018, Lina Iyer wrote:
>>
>>>On Tue, Nov 27 2018 at 14:45 -0700, Stephen Boyd wrote:
>>>> Quoting Lina Iyer (2018-11-27 10:21:23)
>>>> > On Tue, Nov 27 2018 at 02:12 -0700, Stephen Boyd wrote:

[...]
>BTW, I am discussing with the internal folks here on if we need to mask
>TLMM when the wakeup-parent is MPM. If we don't have to, we should be
>able to follow the same model as we done in this patch and don't even
>have to check the compatible or use the approach suggested by Stephen.
>
The TLMM and the MPM are not active at the same time. However, there is
a small chance they might be (a few clock cycles) when the system is
going down, but even then, since we replay the interrupt from the MPM
driver before the interrupts are serviced by Linux, we would not see
multiple GPIO interrupts.

The way we have MPM working downstream, for a wakeup GPIO IRQ -

a. Application cores gets a wakeup interrupt either from RPM or GIC (if
TLMM was not powered down) while still in the interrupt locked context.

b. In the hardware, apps core handshakes with the RPM and then starts
resuming from the platform's system idle driver.

c. The first CPU to wake up calls MPM driver from the idle driver, which
reads the shared memory to find the MPM pins that are set. Converts the
MPM pins to their corresponding linux interrupt and replays the
interrupt.

d. Idle driver exits and wakeup GPIO interrupt is handled.

The MPM pins are not updated after the RPM lets the application core to
run. Since TLMM is functional after the RPM handshake, it takes over.

Note, the downstream design is predicated on the OS-Initiated support
for all MPM based SoCs which serializes the last CPU going down and the
first CPU coming out of idle.

Thanks,
Lina
