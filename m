From: Harini Katakam <harinikatakamlinux@gmail.com>
Subject: Re: [PATCH v4 1/2] watchdog: Add Cadence WDT driver
Date: Fri, 22 Aug 2014 13:24:54 +0530
Message-ID: <CAFcVECLuC0Xun=QSwa0Q+o2=4VMPR1=wym1W4=SJ0g9=XcKAdw@mail.gmail.com>
References: <1406788855-19074-1-git-send-email-harinik@xilinx.com>
	<20140821185722.GA17481@roeck-us.net>
	<20140822073344.GA23635@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140822073344.GA23635@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: "wim@iguana.be" <wim@iguana.be>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, "michals@xilinx.com" <michals@xilinx.com>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, svemula@xilinx.com, anirudh@xilinx.com
List-Id: devicetree@vger.kernel.org

Hi Guenter,

On Fri, Aug 22, 2014 at 1:03 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Thu, Aug 21, 2014 at 11:57:22AM -0700, Guenter Roeck wrote:
>> On Thu, Jul 31, 2014 at 12:10:54PM +0530, Harini Katakam wrote:
>> > Add Cadence WDT driver. This is used by Xilinx Zynq.
>> >
>> > Signed-off-by: Harini Katakam <harinik@xilinx.com>
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>
> Hah, that was too fast. The driver causes build errors for a number or
> architectures, including x86_64.
>
> drivers/watchdog/cadence_wdt.c: In function 'cdns_wdt_writereg':
> drivers/watchdog/cadence_wdt.c:93:2: error: implicit declaration of function
> 'writel_relaxed' [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors
> make[2]: *** [drivers/watchdog/cadence_wdt.o] Error 1
> make[1]: *** [drivers/watchdog] Error 2
>
> Please make sure that the driver is only configurable for architectures
> supporting writel_relaxed.

There were a couple of patches earlier to add relaxed helpers for all
architectures - I guess they are not applied yet.
I'll resend series adding dependency on ARM.

Regards,
Harini
