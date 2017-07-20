From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2] ARC: reset: introduce HSDKv1 reset driver
Date: Thu, 20 Jul 2017 15:58:33 +0200
Message-ID: <1500559113.2354.77.camel@pengutronix.de>
References: <20170719184511.18497-1-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170719184511.18497-1-Eugeniy.Paltsev@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, 2017-07-19 at 21:45 +0300, Eugeniy Paltsev wrote:
> The HSDK v1 periphery IPs can be reset by accessing some registers
> from the CGU block.
> 
> The list of available reset lines is documented in the DT bindings.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
> Changes v1 -> v2:
>  - Remove defines of the unused registers.
>  - Map io memory only for single CGU_SYS_RST_CTRL register instead
>    of CGU_SYS_*_CTRL, as we use only CGU_SYS_RST_CTRL.

Thank you, I have applied this patch to the reset/next branch.

regards
Philipp
