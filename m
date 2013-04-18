From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [RFC PATCH] drivers: bus: add ARM CCI support
Date: Thu, 18 Apr 2013 11:11:53 -0700
Message-ID: <51703769.10908@codeaurora.org>
References: <1365691679-28674-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1365691679-28674-2-git-send-email-lorenzo.pieralisi@arm.com>
 <51702B70.9000908@codeaurora.org>
 <alpine.LFD.2.03.1304181341020.17375@syhkavp.arg>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <alpine.LFD.2.03.1304181341020.17375@syhkavp.arg>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Jon Medhurst <tixy@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Dave Martin <dave.martin@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Arnd Bergmann <arnd@arndb.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Amit Kucheria <amit.kucheria@linaro.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

On 04/18/13 10:54, Nicolas Pitre wrote:
> On Thu, 18 Apr 2013, Stephen Boyd wrote:
>
>> On 04/11/13 07:47, Lorenzo Pieralisi wrote:
>>> diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
>>> new file mode 100644
>>> index 0000000..81953de
>>> --- /dev/null
>>> +++ b/drivers/bus/arm-cci.c
>> [...]
>>> +static void notrace cci_port_control(unsigned int port, bool enable)
>>> +{
>>> +	void __iomem *base = ports[port].base;
>>> +
>>> +	if (!base)
>>> +		return;
>>> +
>>> +	writel_relaxed(enable, base + CCI_PORT_CTRL);
>>> +	while (readl_relaxed(cci_ctrl_base + CCI_CTRL_STATUS) & 0x1)
>>> +			;
>> cpu_relax()?
> In some cases there is no more cache coherence when this is called and 
> the hardware might not be in a good state to cope with whatever action 
> people might be tempted to insert into cpu_relax().  After the CCI is 
> disabled it is important to keep a low profile and not touch anything 
> global. With some early hardware revision, even a DMB here was harmful.

Fair enough. Perhaps the code could use a comment to that effect.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
