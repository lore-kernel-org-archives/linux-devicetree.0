Return-Path: <robherring2@gmail.com>
Date: Tue, 8 May 2018 10:38:06 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] Documentation: mmc: addtional description for
 post-power-on-delay-ms
Message-ID: <20180508153806.GA22616@rob-hp-laptop>
References: <1525741460-109455-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1525741460-109455-1-git-send-email-shawn.lin@rock-chips.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Adrian Hunter <adrian.hunter@intel.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, May 08, 2018 at 09:04:19AM +0800, Shawn Lin wrote:
> post-power-on-delay-ms woule be reused to substitute the hard-coded 10ms
> delay waiting for power supply to be stable, specificed by individual
> platform/board. Default to 10ms as before, if no available.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> 
> ---
> 
> Changes in v3:
> - reused post-power-on-delay-ms suggested by Rob
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/mmc/mmc.txt | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
