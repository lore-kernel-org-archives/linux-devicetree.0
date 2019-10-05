From: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.2 17/42] MIPS: lantiq: update the clock alias'
 for the mainline PCIe PHY driver
Date: Sat, 5 Oct 2019 19:00:36 -0400
Message-ID: <20191005230036.GB25255@sasha-vm>
References: <20190929173244.8918-1-sashal@kernel.org>
 <20190929173244.8918-17-sashal@kernel.org>
 <fe9161b3-2402-e5a8-959b-63c807be3e08@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fe9161b3-2402-e5a8-959b-63c807be3e08@hauke-m.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, john@phrozen.org, kishon@ti.com, ralf@linux-mips.org, robh+dt@kernel.org, mark.rutland@arm.com, ms@dev.tdt.de
List-Id: devicetree@vger.kernel.org

On Sun, Sep 29, 2019 at 07:39:49PM +0200, Hauke Mehrtens wrote:
>On 9/29/19 7:32 PM, Sasha Levin wrote:
>> From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>
>> [ Upstream commit ed90302be64a53d9031c8ce05428c358b16a5d96 ]
>>
>> The mainline PCIe PHY driver has it's own devicetree node. Update the
>> clock alias so the mainline driver finds the clocks.
>>
>> The first PCIe PHY is located at 0x1f106800 and exists on VRX200, ARX300
>> and GRX390.
>> The second PCIe PHY is located at 0x1f700400 and exists on ARX300 and
>> GRX390.
>> The third PCIe PHY is located at 0x1f106a00 and exists onl on GRX390.
>> Lantiq's board support package (called "UGW") names these registers
>> "PDI".
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Signed-off-by: Paul Burton <paul.burton@mips.com>
>> Cc: linux-mips@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>> Cc: john@phrozen.org
>> Cc: kishon@ti.com
>> Cc: ralf@linux-mips.org
>> Cc: robh+dt@kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: hauke@hauke-m.de
>> Cc: mark.rutland@arm.com
>> Cc: ms@dev.tdt.de
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>>  arch/mips/lantiq/xway/sysctrl.c | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
>
>Hi Sasha,
>
>This change only makes sense with the new upstream PCIe phy driver which
>was added to kernel 5.4 [0], older kernel versions do not have this PCIe
>PHY driver. I would not backport these changes to older kernel versions.

I'll drop it, thank you!

-- 
Thanks,
Sasha
