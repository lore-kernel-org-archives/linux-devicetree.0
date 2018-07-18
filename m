From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH 3/6] arm64: dts: hisilicon: Add missing cooling device
 properties for CPUs
Date: Wed, 18 Jul 2018 16:32:43 +0100
Message-ID: <5B4F5D9B.8070008@hisilicon.com>
References: <cover.1527225682.git.viresh.kumar@linaro.org>
 <0754957a2c3842cf4e36fa27231d327fd8d6d499.1527225682.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0754957a2c3842cf4e36fa27231d327fd8d6d499.1527225682.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>, arm@kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ionela.voinescu@arm.com, Daniel Lezcano <daniel.lezcano@linaro.org>, chris.redpath@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Viresh,

On 2018/5/25 6:40, Viresh Kumar wrote:
> The cooling device properties, like "#cooling-cells" and
> "dynamic-power-coefficient", should either be present for all the CPUs
> of a cluster or none. If these are present only for a subset of CPUs of
> a cluster then things will start falling apart as soon as the CPUs are
> brought online in a different order. For example, this will happen
> because the operating system looks for such properties in the CPU node
> it is trying to bring up, so that it can register a cooling device.
> 
> Add such missing properties.
> 
> Do minor rearrangement as well to keep ordering consistent.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Thanks!
Applied to the hisilicon dt tree.

Best Regards,
Wei
