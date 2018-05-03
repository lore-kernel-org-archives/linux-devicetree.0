From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v9 07/27] ARM: davinci: dm355: add new clock init using
 common clock framework
Date: Thu, 3 May 2018 10:44:08 -0500
Message-ID: <18b7b217-7ccb-d2dd-8f2c-ba3ba0e5d893@lechnology.com>
References: <20180427001745.4116-1-david@lechnology.com>
 <20180427001745.4116-8-david@lechnology.com>
 <d9633747-0c50-2934-d3b2-ba745f021077@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d9633747-0c50-2934-d3b2-ba745f021077@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05/03/2018 10:34 AM, Sekhar Nori wrote:
> On Friday 27 April 2018 05:47 AM, David Lechner wrote:
>> This adds the new board-specific clock init in mach-davinci/dm355.c
>> using the new common clock framework drivers.
>>
>> The #ifdefs are needed to prevent compile errors until the entire
>> ARCH_DAVINCI is converted.
>>
>> Also clean up the #includes since we are adding some here.
>>
>> Signed-off-by: David Lechner <david@lechnology.com>
> 
> I am having trouble booting DM355 EVM with the series applied.
> Still to debug what is going wrong.

Can you dump the PLL registers using /sys/kernel/debug/clk/... ?
