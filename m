From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v2] arm64: zynqmp: Add ZynqMP SDHCI compatible string
Date: Fri, 2 Aug 2019 07:23:52 +0200
Message-ID: <51225f83-ea4e-74d7-840f-35a44659d0e2@xilinx.com>
References: <1561959452-22915-1-git-send-email-manish.narani@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561959452-22915-1-git-send-email-manish.narani@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Manish Narani <manish.narani@xilinx.com>, robh+dt@kernel.org, michal.simek@xilinx.com, mark.rutland@arm.com, sudeep.holla@arm.com, rrichter@cavium.com, gregory.clement@bootlin.com, amit.kucheria@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01. 07. 19 7:37, Manish Narani wrote:
> Add the new compatible string for ZynqMP SD Host Controller for its use
> in the Arasan SDHCI driver for some of the ZynqMP specific operations.
> Add required properties for the same.
> 
> Signed-off-by: Manish Narani <manish.narani@xilinx.com>
> ---
> This patch depends on the below series of patches:
> https://lkml.org/lkml/2019/7/1/25
> 
> Changes in v2:
> 	- Added clock-names for SD card clocks for getting clocks in the driver

Just for a record. I am waiting till binding is Acked.

M
