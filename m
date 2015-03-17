From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCHv3 0/5] arm-cci400: PMU monitoring support on ARM64
Date: Tue, 17 Mar 2015 18:54:49 +0000
Message-ID: <20150317185449.GF8399@arm.com>
References: <1426000735-14375-1-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1426000735-14375-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Nicolas Pitre <nico@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene@kernel.org>, Abhilash Kesavan <a.kesavan@samsung.com>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Olof Johansson <olof@lixom.net>, Pawel Moll <Pawel.Moll@arm.com>, Punit Agrawal <Punit.Agrawal@arm.com>, Sudeep Holla <Sudeep.Holla@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 10, 2015 at 03:18:50PM +0000, Suzuki K. Poulose wrote:
> From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>
> 
> This series enables the PMU monitoring support for CCI400 on ARM64.
> The existing CCI400 driver code is a mix of PMU driver and the MCPM
> driver code. The MCPM driver is only used on ARM(32) and contains
> arm32 assembly and hence can't be built on ARM64. This patch splits
> the code to
> 
>  - ARM_CCI400_PORT_CTRL driver - depends on ARM && V7
>  - ARM_CCI400_PMU driver

If you repost this with acks added and my feedback addressed, then I'm
happy to put together a branch for arm-soc along with your other CCI PMU
fix for event validation.

Will
