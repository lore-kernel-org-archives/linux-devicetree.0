From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/6] arm64: dts: amlogic: Add missing cooling device
 properties for CPUs
Date: Mon, 28 May 2018 16:43:58 +0530
Message-ID: <20180528111358.meyle364fy6wuruf@vireshk-i7>
References: <cover.1527225682.git.viresh.kumar@linaro.org>
 <2a2eb28da9fecf129f6bc0ab3d3748d9f4d25a29.1527225682.git.viresh.kumar@linaro.org>
 <20180525211025.c73zdcdtyuvlewng@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180525211025.c73zdcdtyuvlewng@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, arm@kernel.org, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, chris.redpath@arm.com, linux-amlogic@lists.infradead.org, ionela.voinescu@arm.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 25-05-18, 14:10, Olof Johansson wrote:
> On Fri, May 25, 2018 at 11:10:01AM +0530, Viresh Kumar wrote:
> > The cooling device properties, like "#cooling-cells" and
> > "dynamic-power-coefficient", should either be present for all the CPUs
> > of a cluster or none. If these are present only for a subset of CPUs of
> > a cluster then things will start falling apart as soon as the CPUs are
> > brought online in a different order. For example, this will happen
> > because the operating system looks for such properties in the CPU node
> > it is trying to bring up, so that it can register a cooling device.
> > 
> > Add such missing properties.
> 
> This seems awkward compared to just having one cooling-cells in the /cpus node
> instead.

Well, we don't allow that property to be present in /cpus node right
now and it is per device. And then we may not want all the CPUs to be
cooling devices really.

> What's it used for? I don't see any properties in the device nodes on meson-gxm
> that have any cooling-foo cells in them? So why should #cooling-cells be
> needed?

This property is required to declare a device as a cooling-device and
the device here is CPU. We use it as a cooling device by limiting its
higher range of frequencies, so that it doesn't generate too much
heat.

It is already there for CPU0 and CPU4, but it should really be there
for all the CPUs, like we have clock, supply, caches, etc.

-- 
viresh
