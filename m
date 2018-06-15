From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 5/6] arm64: dts: rockchip: Add missing cooling device properties for CPUs
Date: Fri, 15 Jun 2018 13:23:49 +0200
Message-ID: <5093249.sUvQcHjlij@diego>
References: <cover.1527225682.git.viresh.kumar@linaro.org> <d7f32cb0c3b77901cb5e37320a454e5e1dfed958.1527225682.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d7f32cb0c3b77901cb5e37320a454e5e1dfed958.1527225682.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: arm@kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Vincent Guittot <vincent.guittot@linaro.org>, ionela.voinescu@arm.com, Daniel Lezcano <daniel.lezcano@linaro.org>, chris.redpath@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 25. Mai 2018, 07:40:05 CEST schrieb Viresh Kumar:
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

applied for 4.19


Thanks
Heiko
