From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v2 3/5] dt-bindings: arm: Extend SCMI to support new
 reset protocol
Date: Wed, 7 Aug 2019 11:18:08 +0100
Message-ID: <20190807101808.GF16546@e107155-lin>
References: <20190806170208.6787-1-sudeep.holla@arm.com>
 <20190806170208.6787-4-sudeep.holla@arm.com>
 <1565166410.5048.5.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1565166410.5048.5.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>, linux-kernel@vger.kernel.org, Bo Zhang <bozhang.zhang@broadcom.com>, Jim Quinlan <james.quinlan@broadcom.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Gaku Inami <gaku.inami.xh@renesas.com>, aidapala@qti.qualcomm.com, pajay@qti.qualcomm.com, Etienne Carriere <etienne.carriere@linaro.org>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, wesleys@xilinx.com, Felix Burton <fburton@xilinx.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 07, 2019 at 10:26:50AM +0200, Philipp Zabel wrote:
> On Tue, 2019-08-06 at 18:02 +0100, Sudeep Holla wrote:
> > SCMIv2.0 adds a new Reset Management Protocol to manage various reset
> > states a given device or domain can enter. Extend the existing SCMI
> > bindings to add reset protocol support by re-using the reset bindings
> > for bothe reset providers and consumers.
>           ^
> typo
>

Thanks, fixed now.

--
Regards,
Sudeep
