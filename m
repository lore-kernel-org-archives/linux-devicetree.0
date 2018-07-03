From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 2/6] arm64: dts: freescale: Add missing cooling device
 properties for CPUs
Date: Tue, 3 Jul 2018 15:34:31 +0800
Message-ID: <CAAQ0ZWRsroAAKRyxdd9ZCreriAjdBecmJy01sRy+6i_iQsMKgw@mail.gmail.com>
References: <cover.1527225682.git.viresh.kumar@linaro.org> <e4504945d2b684fae2850bbcf03a6d02917a8c8a.1527225682.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e4504945d2b684fae2850bbcf03a6d02917a8c8a.1527225682.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: arm@kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, catalin.marinas@arm.com, Will Deacon <will.deacon@arm.com>, Vincent Guittot <vincent.guittot@linaro.org>, ionela.voinescu@arm.com, Daniel Lezcano <daniel.lezcano@linaro.org>, chris.redpath@arm.com, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 25, 2018 at 1:40 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
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

Applied, thanks.

Please use my kernel.org email address for future patches.

Shawn
