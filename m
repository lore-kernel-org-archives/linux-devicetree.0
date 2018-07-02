Return-Path: <SRS0=NzkR=JS=zonque.org=daniel@kernel.org>
Subject: Re: [PATCH v4 0/2] clk: Add driver for MAX9485
References: <20180617120535.2529-1-daniel@zonque.org>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <da1c76ab-0c83-d160-24d9-96c8ec93821e@zonque.org>
Date: Mon, 2 Jul 2018 09:58:03 +0200
MIME-Version: 1.0
In-Reply-To: <20180617120535.2529-1-daniel@zonque.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

On Sunday, June 17, 2018 02:05 PM, Daniel Mack wrote:
> This is v4 of the driver for Maxim's MAX9485 programmable audio clock
> generator.

Is there a chance to get this merged for 4.19?


Thanks,
Daniel


> 
> v3 → v4:
> * Rebased to 4.18-rc1
> 
> v2 → v3:
> 
> * Addressed a lot of issues pointed out by Stephen Boyd:
>    * Dropped local register caching
>    * Implement own OF clk_hw getter in favor of the onecell helper
>    * Implemented recalc_rate() properly by reading from the hardware
>    * Dropped input clock frequency validation
>    * Style issues
> 
> * Fixed a gpio line handling bug in resume
> * Added Rob's Revied-by to 1/2
> 
> v1 → v2:
> 
> * Now served as two patches, one for the DT bits, and one for the actual
>    implementation. The DT bits are put in the 1st patch because the
>    implementation depends on the shared header file.
> 
> * Added support for suspend/resume
> 
> Daniel Mack (2):
>    dts: clk: add devicetree bindings for MAX9485
>    clk: Add driver for MAX9485
> 
>   .../bindings/clock/maxim,max9485.txt          |  59 +++
>   drivers/clk/Kconfig                           |   6 +
>   drivers/clk/Makefile                          |   1 +
>   drivers/clk/clk-max9485.c                     | 402 ++++++++++++++++++
>   include/dt-bindings/clock/maxim,max9485.h     |  18 +
>   5 files changed, 486 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/maxim,max9485.txt
>   create mode 100644 drivers/clk/clk-max9485.c
>   create mode 100644 include/dt-bindings/clock/maxim,max9485.h
> 
