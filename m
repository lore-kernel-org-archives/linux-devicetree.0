Return-Path: <robherring2@gmail.com>
Date: Fri, 27 Apr 2018 09:30:52 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] Documentation: mmc: add optional
 cd-debounce-delay-ms
Message-ID: <20180427143052.72hnqcitoborx5su@rob-hp-laptop>
References: <1524530577-183915-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1524530577-183915-1-git-send-email-shawn.lin@rock-chips.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 24, 2018 at 08:42:56AM +0800, Shawn Lin wrote:
> cd-gpios uses a fixed delay, 200ms, before detecting card after the card
> is inserted. 200ms doesn't work for some platforms, so some host drivers
> added their own properties for parsing that from DT, for instance,
> dw_mmc and pxamci. That being said, it should also be tunable when using
> cd-gpios.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> 
> ---
> 
> Changes in v4:
> - rename to cd-debounce-delay-ms suggested by Ulf
> 
> Changes in v3:
> - fix misleading typo in commit msg
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/mmc/mmc.txt | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
