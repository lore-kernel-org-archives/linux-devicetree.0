From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [RESEND PATCH next v2 0/6] ARM: keystone: update dt and enable
 cpts support
Date: Thu, 5 Sep 2019 22:33:28 +0300
Message-ID: <323c1835-e6b0-9153-8d1e-06200d5e2201@ti.com>
References: <20190705151247.30422-1-grygorii.strashko@ti.com>
 <2ef8b34e-7a6e-b3e4-90e0-c4e7f16c2e99@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2ef8b34e-7a6e-b3e4-90e0-c4e7f16c2e99@oracle.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: santosh.shilimkar@oracle.com, Santosh Shilimkar <ssantosh@kernel.org>
Cc: Sekhar Nori <nsekhar@ti.com>, Murali Karicheri <m-karicheri2@ti.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Santosh,

On 06/07/2019 02:48, santosh.shilimkar@oracle.com wrote:
> On 7/5/19 8:12 AM, Grygorii Strashko wrote:
>> Hi Santosh,
>>
>> This series is set of platform changes required to enable NETCP CPTS reference
>> clock selection and final patch to enable CPTS for Keystone 66AK2E/L/HK SoCs.
>>
>> Those patches were posted already [1] together with driver's changes, so this
>> is re-send of DT/platform specific changes only, as driver's changes have
>> been merged already.
>>
>> Patches 1-5: CPTS DT nodes update for TI Keystone 2 66AK2HK/E/L SoCs.
>> Patch 6: enables CPTS for TI Keystone 2 66AK2HK/E/L SoCs.
>>
>> [1] https://patchwork.kernel.org/cover/10980037/
>>
>> Grygorii Strashko (6):
>>    ARM: dts: keystone-clocks: add input fixed clocks
>>    ARM: dts: k2e-clocks: add input ext. fixed clocks tsipclka/b
>>    ARM: dts: k2e-netcp: add cpts refclk_mux node
>>    ARM: dts: k2hk-netcp: add cpts refclk_mux node
>>    ARM: dts: k2l-netcp: add cpts refclk_mux node
>>    ARM: configs: keystone: enable cpts
>>
> Will add these for 5.4 queue. Thanks !!

Sry, that I'm disturbing you, but I do not see those patches applied?



-- 
Best regards,
grygorii
