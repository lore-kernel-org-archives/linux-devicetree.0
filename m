From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH 0/7] K2G: Add QSPI support
Date: Wed, 2 Aug 2017 10:19:49 -0700
Message-ID: <ff8e0f4f-eb26-85dc-b5b2-8f6ddd39145b@oracle.com>
References: <20170801045434.8733-1-vigneshr@ti.com>
 <29c0e8ec-1f9f-cfc9-2d0e-e4d31890b699@oracle.com>
 <00b2b8b8-3f3d-d563-bebc-f37f67362aa0@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <00b2b8b8-3f3d-d563-bebc-f37f67362aa0@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh R <vigneshr@ti.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

8/1/2017 10:52 PM, Vignesh R wrote:
> Hi,
> 
> On Tuesday 01 August 2017 11:31 PM, Santosh Shilimkar wrote:
>> On 7/31/2017 9:54 PM, Vignesh R wrote:
>>> This series adds support for Cadence QSPI for 66AK2G SoC. The first
>>> three patches enhance the cadence-quadspi driver to support loopback
>>> clock and pm_runtime and tweaks for 66AK2G SoC. Remaining patches add
>>> DT nodes and enable the driver in defconfig.
>>>
>>> Tested on 66AK2G GP and ICE boards.
>>>
>>> Vignesh R (7):
>>>     mtd: spi-nor: cadence-quadspi: add a delay in write sequence
>>>     mtd: spi-nor: cadence-quadspi: Add support to enable loopback clock
>>>       circuit
>>>     mtd: spi-nor: cadence-quadspi: Add runtime PM support
>>>     ARM: dts: keystone-k2g: Add QSPI DT entry
>>>     ARM: dts: keystone-k2g-evm: Add QSPI node
>>>     ARM: dts: keystone-k2g-ice: Add QSPI node
>>>     ARM: configs: keystone: Enable Cadence QSPI driver
>>>
>> Please separate dts and driver patches in its own series
>> while posting next time since they go throgh different
>> subsystem trees. Get your driver patch queed
>> first before adding DTS and enabling config option.
> 
> Okay. I thought it would be easy for you to know when driver patches are
> queued, if DTS changes are part of the same series. Will post DT nodes
> separately from next time or if I need to do a v2 of this series.
> 
Thanks !!
