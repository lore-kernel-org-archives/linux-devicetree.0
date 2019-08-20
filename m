From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v4 05/10] ARM: dts: sunxi: a80: Add msgbox node
Date: Tue, 20 Aug 2019 08:17:49 -0500
Message-ID: <f3e3420e-450a-7d41-edf8-776c0cd5a320@sholland.org>
References: <20190820032311.6506-1-samuel@sholland.org>
 <20190820032311.6506-6-samuel@sholland.org>
 <20190820081528.7g2lo4njkut5lanu@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820081528.7g2lo4njkut5lanu@flea>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Jassi Brar <jassisinghbrar@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Corentin Labbe <clabbe.montjoie@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

Hi,

On 8/20/19 3:15 AM, Maxime Ripard wrote:
> On Mon, Aug 19, 2019 at 10:23:06PM -0500, Samuel Holland wrote:
>> The A80 SoC contains a message box that can be used to send messages and
>> interrupts back and forth between the ARM application CPUs and the ARISC
>> coprocessor. Add a device tree node for it.
>>
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
> 
> I think you mentionned that crust has been tested only on the A64 and
> the H3/H5, did you test the mailbox on those other SoCs as well?

No, I only have A64/H3/H5, and recently H6, hardware to test. I've looked
through the manuals to verify that the registers are all the same, but I haven't
run the driver on earlier SoCs.

On 32-bit SoCs, where there's no other user of SRAM A2, it should be easy to get
the toy firmware running. All you should need to do is:
  1) Update the MMIO base/clock addresses in drivers/msgbox/sunxi-msgbox.c
  2) Update the load address in platform/sun50i/include/platform/memory.h
  3) Load the firmware to SRAM A2 (can be done from a U-Boot shell)
  4) Initialize the reset vector (algorithm is in tools/test.c:109)
  5) Deassert AR100 reset (again, these last two steps can be done from U-Boot)

Thanks,
Samuel
