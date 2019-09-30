From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 00/11] of: dma-ranges fixes and improvements
Date: Mon, 30 Sep 2019 14:54:56 +0200
Message-ID: <807a4f96-cbda-da4d-a3f1-2bfe5788105b@gmail.com>
References: <20190927002455.13169-1-robh@kernel.org>
 <106d5b37-5732-204f-4140-8d528256a59b@gmail.com>
 <40bdf7cf-3bb1-24f8-844d-3eefbc761aba@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <40bdf7cf-3bb1-24f8-844d-3eefbc761aba@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Frank Rowand <frowand.list@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Oza Pawandeep <oza.oza@broadcom.com>
List-Id: devicetree@vger.kernel.org

On 9/30/19 2:52 PM, Robin Murphy wrote:
> On 30/09/2019 13:40, Marek Vasut wrote:
>> On 9/27/19 2:24 AM, Rob Herring wrote:
>>> This series fixes several issues related to 'dma-ranges'. Primarily,
>>> 'dma-ranges' in a PCI bridge node does correctly set dma masks for PCI
>>> devices not described in the DT. A common case needing dma-ranges is a
>>> 32-bit PCIe bridge on a 64-bit system. This affects several platforms
>>> including Broadcom, NXP, Renesas, and Arm Juno. There's been several
>>> attempts to fix these issues, most recently earlier this week[1].
>>>
>>> In the process, I found several bugs in the address translation. It
>>> appears that things have happened to work as various DTs happen to use
>>> 1:1 addresses.
>>>
>>> First 3 patches are just some clean-up. The 4th patch adds a unittest
>>> exhibiting the issues. Patches 5-9 rework how of_dma_configure() works
>>> making it work on either a struct device child node or a struct
>>> device_node parent node so that it works on bus leaf nodes like PCI
>>> bridges. Patches 10 and 11 fix 2 issues with address translation for
>>> dma-ranges.
>>>
>>> My testing on this has been with QEMU virt machine hacked up to set PCI
>>> dma-ranges and the unittest. Nicolas reports this series resolves the
>>> issues on Rpi4 and NXP Layerscape platforms.
>>
>> With the following patches applied:
>>        https://patchwork.ozlabs.org/patch/1144870/
>>        https://patchwork.ozlabs.org/patch/1144871/
> 
> Can you try it without those additional patches? This series aims to
> make the parsing work properly generically, such that we shouldn't need
> to add an additional PCI-specific version of almost the same code.

Seems to work even without those.

-- 
Best regards,
Marek Vasut
