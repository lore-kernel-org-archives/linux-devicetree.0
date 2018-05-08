Return-Path: <robherring2@gmail.com>
Date: Tue, 8 May 2018 10:42:07 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 resend] PM / OPP: dt-bindings: Make "opp-hz" optional
 for power domains
Message-ID: <20180508154207.GA27069@rob-hp-laptop>
References: <cover.1523273291.git.viresh.kumar@linaro.org>
 <525112ef4e6148d8fc46d92c0554bd516e24952f.1525750390.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <525112ef4e6148d8fc46d92c0554bd516e24952f.1525750390.git.viresh.kumar@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, May 08, 2018 at 09:04:42AM +0530, Viresh Kumar wrote:
> The "opp-hz" property is not relevant across all the devices that use
> the OPP tables now. For example, for a power domain a frequency value
> wouldn't mean anything. Though they must have another property, which
> may be implementation defined, which uniquely identifies the OPP nodes.
> 
> Make "opp-hz" optional for such devices.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
> Resending to get Ack from Rob.
> 
>  Documentation/devicetree/bindings/opp/opp.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
