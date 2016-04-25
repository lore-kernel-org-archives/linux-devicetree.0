From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 19/41] Documentation: dt: opp: fix spelling mistake
Date: Mon, 25 Apr 2016 08:32:56 +0530
Message-ID: <20160425030256.GG22726@vireshk-i7>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
 <1461543878-3639-20-git-send-email-eric@engestrom.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461543878-3639-20-git-send-email-eric@engestrom.ch>
Sender: linux-pm-owner@vger.kernel.org
To: Eric Engestrom <eric@engestrom.ch>
Cc: linux-kernel@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 25-04-16, 01:24, Eric Engestrom wrote:
> Signed-off-by: Eric Engestrom <eric@engestrom.ch>
> ---
>  Documentation/devicetree/bindings/opp/opp.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/opp/opp.txt b/Documentation/devicetree/bindings/opp/opp.txt
> index 601256f..ee91cbd 100644
> --- a/Documentation/devicetree/bindings/opp/opp.txt
> +++ b/Documentation/devicetree/bindings/opp/opp.txt
> @@ -45,7 +45,7 @@ Devices supporting OPPs must set their "operating-points-v2" property with
>  phandle to a OPP table in their DT node. The OPP core will use this phandle to
>  find the operating points for the device.
>  
> -If required, this can be extended for SoC vendor specfic bindings. Such bindings
> +If required, this can be extended for SoC vendor specific bindings. Such bindings
>  should be documented as Documentation/devicetree/bindings/power/<vendor>-opp.txt
>  and should have a compatible description like: "operating-points-v2-<vendor>".

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
