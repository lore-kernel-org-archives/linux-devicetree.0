From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] regulator: max8973: add DT binding details for
 junction warn temp
Date: Fri, 4 Mar 2016 22:30:22 -0600
Message-ID: <20160305043022.GE13525@rob-hp-laptop>
References: <1457087274-15785-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1457087274-15785-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: broonie@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 04, 2016 at 03:57:53PM +0530, Laxman Dewangan wrote:
> The driver MAX8973 supports the driver for Maxim MAX77621.
> MAX77621 supports the junction temp warning at 120 degC and
> 140 degC which is configurable. It generates alert signal when
> junction temperature crosses these threshold.
> 
> Add DT properties and its binding details to make this
> configuration from DT.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
>  Documentation/devicetree/bindings/regulator/max8973-regulator.txt | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
