From: Faiz Abbas <faiz_abbas@ti.com>
Subject: Re: [PATCH v2 0/2] Support for eMMC in AM65x-evm
Date: Thu, 17 Jan 2019 14:35:09 +0530
Message-ID: <488c457b-efc0-1006-ad2d-a29cd455d979@ti.com>
References: <20190110073355.3382-1-faiz_abbas@ti.com>
 <20190115142948.3fq2i6vav7jn4ulq@kahuna>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190115142948.3fq2i6vav7jn4ulq@kahuna>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, robh+dt@kernel.org, t-kristo@ti.com
List-Id: devicetree@vger.kernel.org

Nishanth,

On 15/01/19 7:59 PM, Nishanth Menon wrote:
> On 13:03-20190110, Faiz Abbas wrote:
>> The following patches add eMMC support on TI's AM65x-evm.
>>
>> v2:
>>  1. The SD card node is under debug for some usecases.
>>     Only upstreaming eMMC support for now.
>>  2. Rebased to latest mainline.
>>  3. Removed status = "disabled" from dtsi patch
>>  4. Fixed node name to not include '_'s
>>
>> Faiz Abbas (2):
>>   arm64: dts: ti: k3-am654: Add Support for MMC/SD
>>   arm64: dts: ti: k3-am654-base-board: Add MMC/SD support
> 
> Once the $subject changes in the above two patches (should be emmc
> instead of MMC/SD):
> 
> Acked-by: Nishanth Menon <nm@ti.com>
> 

Ok. Sending next version with fixes.

Thanks,
Faiz
