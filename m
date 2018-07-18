From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 14/15] arm: dts: qcom: Add missing OPP properties for CPUs
Date: Wed, 18 Jul 2018 11:38:12 +0530
Message-ID: <20180718060812.vgmb33zws5nbwjd6@vireshk-i7>
References: <cover.1527244200.git.viresh.kumar@linaro.org>
 <9f9cc23d1fd17503c9056d62f7757fb9c412d1f9.1527244201.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9f9cc23d1fd17503c9056d62f7757fb9c412d1f9.1527244201.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ionela.voinescu@arm.com, Daniel Lezcano <daniel.lezcano@linaro.org>, chris.redpath@arm.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 25-05-18, 16:02, Viresh Kumar wrote:
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
>  arch/arm/boot/dts/qcom-ipq4019.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Qcom maintainers, can you please apply this one ?

-- 
viresh
