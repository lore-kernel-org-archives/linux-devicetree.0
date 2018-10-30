From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2] dt-bindings: arm: Explain capacities-dmips-mhz
 calculations in example
Date: Tue, 30 Oct 2018 17:14:27 -0500
Message-ID: <20181030221427.GA27075@bogus>
References: <1cd2594fff3fb54948dcd2af65ae1867dd1c541a.1540806119.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1cd2594fff3fb54948dcd2af65ae1867dd1c541a.1540806119.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: catalin.marinas@arm.com, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, Vincent Guittot <vincent.guittot@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 29, 2018 at 03:13:05PM +0530, Viresh Kumar wrote:
> The example contains two values for the capacity currently, 446 in text
> and 578 in code. The numbers are all correct but can confuse some of the
> readers. This patch tries to explain how the numbers are calculated to
> avoid same confusion going forward.
> 
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V1->V2:
> - The numbers weren't incorrect in the example, just that it needs a
>   bit more explanation for some people.
> 
>  Documentation/devicetree/bindings/arm/cpu-capacity.txt | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Applied.
