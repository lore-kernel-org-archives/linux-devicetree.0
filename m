From: Harini Katakam <harinikatakamlinux@gmail.com>
Subject: Re: [PATCH v2 1/2] watchdog: Add Cadence WDT driver
Date: Thu, 29 May 2014 15:08:41 +0530
Message-ID: <CAFcVEC+X1NVZHubRWa4qUfEPiugBrp0ewZkjhrcdK1zrht+FXw@mail.gmail.com>
References: <1401185895-3677-1-git-send-email-harinik@xilinx.com>
	<20140529092106.GC24233@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140529092106.GC24233@leverpostej>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "wim@iguana.be" <wim@iguana.be>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "rob@landley.net" <rob@landley.net>, "michals@xilinx.com" <michals@xilinx.com>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Thu, May 29, 2014 at 2:51 PM, Mark Rutland <mark.rutland@arm.com> wrote:
> On Tue, May 27, 2014 at 11:18:14AM +0100, Harini Katakam wrote:
>> Add Cadence WDT driver. This is used by Xilinx Zynq.
>>
>> Signed-off-by: Harini Katakam <harinik@xilinx.com>
>> ---
>>
>> Sorry for the delay in sending v2.
>> v2 changes:
>> - Update IO helpers.
>> - Use dev_dbg instead of dev_info where possible.
>> - Use watchdog_init_timeout
>> - Spinlock for restart register where missing.
>> - Change order of probe to move reboot notifier register to the end
>> - Remove unecessary comments
>> - Do clk_prepare_enabel and clk_disable_unprepare in resume/suspend
>>   respectively.
>> - There is an input from dts to decide whether internal reset should be
>>   enabled or not. When this is enabled, reset happens wutomatically when
>>   counter reaches zero. In case this is not enabled, a message is disaplayed
>>   to indicate that the watchdog has timed out. Elaborated this message
>>   to describe the above.
>
> When is that useful?
>

Automatic reset enable is an option. When it's not selected, this is a generic
way of giving some indication. If some other action is preferred
instead of reset,
then that can be added here.

Regards,
Harini
