From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [Patch v3 2/3] ARM: dts: Document the CCI PMU DT bindings
Date: Fri, 30 Aug 2013 11:17:08 -0500
Message-ID: <938AAABA-BE7E-48ED-82D6-61A35B6D9774@codeaurora.org>
References: <1377183748-5717-1-git-send-email-punit.agrawal@arm.com>
 <1377183748-5717-3-git-send-email-punit.agrawal@arm.com>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1377183748-5717-3-git-send-email-punit.agrawal@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Punit Agrawal <punit.agrawal@arm.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


On Aug 22, 2013, at 10:02 AM, Punit Agrawal wrote:

> The CCI PMU can profile bus transactions at the master and slave
> interfaces of the CCI. The PMU can be used to observe an aggregated
> view of the bus traffic between the various components connected to the
> CCI.
> 
> Introduce a binding for the CCI PMU. The PMU node will be a sub-node of
> the CCI node.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Nicolas Pitre <nicolas.pitre@linaro.org>
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Cc: Kumar Gala <galak@codeaurora.org>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Signed-off-by: Punit Agrawal <punit.agrawal@arm.com>
> ---
> Documentation/devicetree/bindings/arm/cci.txt |   46 +++++++++++++++++++++++++
> 1 file changed, 46 insertions(+)

Acked-by: Kumar Gala <galak@codeaurora.org>

- k

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
