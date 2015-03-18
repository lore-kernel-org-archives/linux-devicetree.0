From: "Suzuki K. Poulose" <Suzuki.Poulose@arm.com>
Subject: Re: [PATCHv3 0/5] arm-cci400: PMU monitoring support on ARM64
Date: Wed, 18 Mar 2015 10:09:49 +0000
Message-ID: <55094EED.6060804@arm.com>
References: <1426000735-14375-1-git-send-email-suzuki.poulose@arm.com> <20150317185449.GF8399@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150317185449.GF8399@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Nicolas Pitre <nico@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene@kernel.org>, Abhilash Kesavan <a.kesavan@samsung.com>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Olof Johansson <olof@lixom.net>, Pawel Moll <Pawel.Moll@arm.com>, Punit Agrawal <Punit.Agrawal@arm.com>, Sudeep Holla <Sudeep.Holla@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>
List-Id: devicetree@vger.kernel.org

On 17/03/15 18:54, Will Deacon wrote:
> On Tue, Mar 10, 2015 at 03:18:50PM +0000, Suzuki K. Poulose wrote:
>> From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>
>>
>> This series enables the PMU monitoring support for CCI400 on ARM64.
>> The existing CCI400 driver code is a mix of PMU driver and the MCPM
>> driver code. The MCPM driver is only used on ARM(32) and contains
>> arm32 assembly and hence can't be built on ARM64. This patch splits
>> the code to
>>
>>   - ARM_CCI400_PORT_CTRL driver - depends on ARM && V7
>>   - ARM_CCI400_PMU driver
>
> If you repost this with acks added and my feedback addressed, then I'm
> happy to put together a branch for arm-soc along with your other CCI PMU
> fix for event validation.

Sure, I will do that.

Thanks
Suzuki

>
> Will
>
