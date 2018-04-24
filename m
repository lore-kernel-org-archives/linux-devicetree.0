Return-Path: <robherring2@gmail.com>
Date: Tue, 24 Apr 2018 08:04:21 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3] of: Don't create device for OPP tables
Message-ID: <20180424130421.vdjr26ekwmmaoccd@rob-hp-laptop>
References: <152389202198.51482.3779874474342173946@swboyd.mtv.corp.google.com>
 <832f494b89b80c97702bee084bab7000a3ec0854.1523946361.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <832f494b89b80c97702bee084bab7000a3ec0854.1523946361.git.viresh.kumar@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Vincent Guittot <vincent.guittot@linaro.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 17, 2018 at 11:57:34AM +0530, Viresh Kumar wrote:
> The OPP tables are present as separate nodes, whose phandle is used in
> the "operating-points-v2" property of devices. Currently the OF core
> creates a device for the OPP table unconditionally, which is not used by
> any kernel code.
> 
> This patch creates another OF device_id table for the nodes which must
> be skipped while creating devices and OPP is the only user of it for now.
> 
> Reported-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> ---
> V2->V3:
> - Staticize of_skipped_node_table
> 
> V1->V2:
> - Added Reviewed-by from Stephen.
> - Created a table for nodes to be skipped.
> 
>  drivers/of/platform.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Applied, thanks.

Rob
