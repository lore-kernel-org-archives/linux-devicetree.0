From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 12/15] arm: dts: highbank: Add missing OPP properties for CPUs
Date: Mon, 2 Jul 2018 14:25:40 -0600
Message-ID: <CAL_JsqJRKMREfJ8LoDfuda8BU3g5Eq1AX5cPZGzO3uN3vUhrAQ@mail.gmail.com>
References: <cover.1527244200.git.viresh.kumar@linaro.org> <f8a4e5c3062397736475ec599de730206846cb9b.1527244201.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f8a4e5c3062397736475ec599de730206846cb9b.1527244201.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>, ARM-SoC Maintainers <arm@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincent Guittot <vincent.guittot@linaro.org>, ionela.voinescu@arm.com, Daniel Lezcano <daniel.lezcano@linaro.org>, chris.redpath@arm.com, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 25, 2018 at 4:32 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> The OPP properties, like "operating-points", should either be present
> for all the CPUs of a cluster or none. If these are present only for a
> subset of CPUs of a cluster then things will start falling apart as soon
> as the CPUs are brought online in a different order. For example, this
> will happen because the operating system looks for such properties in
> the CPU node it is trying to bring up, so that it can create an OPP
> table.
>
> Add such missing properties.
>
> Fix other missing property (clock latency) as well to make it all
> work.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  arch/arm/boot/dts/highbank.dts | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>

ARM-SOC maintainers, Please apply this.

Rob
