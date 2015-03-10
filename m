From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCHv3 0/5] arm-cci400: PMU monitoring support on ARM64
Date: Tue, 10 Mar 2015 16:21:09 +0000
Message-ID: <54FF19F5.1020309@arm.com>
References: <1426000735-14375-1-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426000735-14375-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Suzuki K. Poulose" <suzuki.poulose@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Nicolas Pitre <nico@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene@kernel.org>, Abhilash Kesavan <a.kesavan@samsung.com>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Olof Johansson <olof@lixom.net>, Pawel Moll <Pawel.Moll@arm.com>, Punit Agrawal <Punit.Agrawal@arm.com>, Will Deacon <Will.Deacon@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>
List-Id: devicetree@vger.kernel.org



On 10/03/15 15:18, Suzuki K. Poulose wrote:
> From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>
>
> This series enables the PMU monitoring support for CCI400 on ARM64.
> The existing CCI400 driver code is a mix of PMU driver and the MCPM
> driver code. The MCPM driver is only used on ARM(32) and contains
> arm32 assembly and hence can't be built on ARM64. This patch splits
> the code to
>
>   - ARM_CCI400_PORT_CTRL driver - depends on ARM && V7
>   - ARM_CCI400_PMU driver
>
> Accessing the Peripheral ID2 register(PID2) on CCI-400, to detect
> the revision of the chipset, is a secure operation. Hence, it prevents
> us from running this on non-secure platforms. The issue is overcome by
> explicitly mentioning the revision number of the CCI PMU in the device tree
> binding. The device-tree binding has been updated with the new bindings.
>
> i.e,	arm-cci-400-pmu,r0 => revision 0
> 	arm-cci-400-pmu,r1 => revision 1
> 	arm-cci-400-pmu => (old) DEPRECATED
>
> The old binding has been DEPRECATED and must be used only on ARM32
> system with secure access. We don't have a reliable dynamic way to detect
> if the system is running secure. This series tries to use the best safe
> method by relying on the availability of MCPM(as it was prior to the series).
> It is upto the MCPM platform driver to decide, if the system is secure before
> it goes ahead and registers its drivers and pokes the CCI. This series doesn't
> address/solve the problem of MCPM. I will be happy to use a better approach,
> if there is any.
>
> Tested on (non-secure)TC2 and A53x2.
>

For the series,
Tested-by: Sudeep Holla <sudeep.holla@arm.com>
(Tested on secure TC2 using MCPM)

Regards,
Sudeep
