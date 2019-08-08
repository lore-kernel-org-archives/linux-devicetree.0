From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH 05/15] arm: dts: msm8974: thermal: Add thermal zones for
 each sensor
Date: Thu, 8 Aug 2019 16:49:03 -0400
Message-ID: <20190808204903.GA29281@onstation.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org>
 <9e2948528c789225bf8a6ef458b83a5350a7ea26.1564091601.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9e2948528c789225bf8a6ef458b83a5350a7ea26.1564091601.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, Andy Gross <agross@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 26, 2019 at 03:48:40AM +0530, Amit Kucheria wrote:
> msm8974 has 11 sensors connected to a single TSENS IP. Define a thermal
> zone for each of those sensors to expose the temperature of each zone.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>

Tested-by: Brian Masney <masneyb@onstation.org> # msm8974
