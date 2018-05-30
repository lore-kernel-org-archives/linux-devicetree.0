From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 13/15] arm: dts: r8a7743: Add missing OPP properties for
 CPUs
Date: Wed, 30 May 2018 10:17:49 +0530
Message-ID: <20180530044749.ou45frhlrdykoiuq@vireshk-i7>
References: <cover.1527244200.git.viresh.kumar@linaro.org>
 <5821a6dbe413b5a217ca1e24ddf8ebfa63ba6ef0.1527244201.git.viresh.kumar@linaro.org>
 <20180528092331.3jon45nsqfdzs5ds@verge.net.au>
 <20180528105831.vesrswazlagynemq@vireshk-i7>
 <20180528115832.b2wovvanypxkgalj@verge.net.au>
 <OSBPR01MB2103A3411D0C3C5DB76F715EB86D0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2103A3411D0C3C5DB76F715EB86D0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>
Cc: Simon Horman <horms@verge.net.au>, "arm@kernel.org" <arm@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vincent Guittot <vincent.guittot@linaro.org>, "ionela.voinescu@arm.com" <ionela.voinescu@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "chris.redpath@arm.com" <chris.redpath@arm.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 29-05-18, 13:33, Biju Das wrote:
> Hi All,
> 
> I have tested this patch on RZ/G1M and I didn't find any issues.
> r8a7743 is similar to r8a7791. So I assume you will apply the same
> patch for other R-SoC devices as well.

Okay, I have sent V2 for this and it fixes all those platforms as
well.

> Apart from this, maybe we need to update the OPP binding
> documentation. i.e., extend the  operating- point usage to other
> cores in the cluster (Binding 1: operating-points).

Its already done, you need to start using operating-points-v2 property
to avoid duplication like this.

-- 
viresh
