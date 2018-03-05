From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH] arm64: dts: stratix10: enable i2c, add i2c periperals
Date: Mon, 5 Mar 2018 09:25:04 -0600
Message-ID: <6661d0f4-79b5-91d2-7507-e15e7004ebe5@kernel.org>
References: <20180221202541.3258-1-atull@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180221202541.3258-1-atull@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Tull <atull@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Alan,

On 02/21/2018 02:25 PM, Alan Tull wrote:
> Add clock for i2c
> Enable i2c1
> Set the i2c bus speed to 100KHz
> Add the following i2c peripherals
> * ds1339 RTC
> * 24c32 EEPROM
> * max1619 temperature monitor
> * ltc2497 ADC
>   * Add a fixed regulator for the ADC's Vref.
> 
> This requires Dinh Nguyen's Stratix10 clock driver
> ("clk: socfpga: stratix10: add clock driver for Stratix10 platform")
> 

Thanks for the patch! I've staged this patch based on the clock driver
patch.

Dinh
