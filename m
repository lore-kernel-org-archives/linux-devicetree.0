From: Rob Herring <robherring2@gmail.com>
Subject: Re: [RFC PATCH 1/3] dt: irq: add interrupt controller descriptor
	struct
Date: Wed, 10 Aug 2011 08:23:03 -0500
Message-ID: <4E428637.3060905@gmail.com>
References: <1312921020-6820-1-git-send-email-robherring2@gmail.com>
	<1312921020-6820-2-git-send-email-robherring2@gmail.com>
	<20110810131428.GF2680@pulham.picochip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110810131428.GF2680@pulham.picochip.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jamie Iles <jamie@jamieiles.com>
Cc: grant.likely@secretlab.ca, marc.zyngier@arm.com, devicetree-discuss@lists.ozlabs.org, thomas.abraham@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/10/2011 08:14 AM, Jamie Iles wrote:
> On Tue, Aug 09, 2011 at 03:16:58PM -0500, Rob Herring wrote:
>> From: Rob Herring <rob.herring@calxeda.com>
>>
>> In preparation to scan and initialize interrupt controllers from a
>> device-tree, create struct to pass to interrupt controller initialization
>> functions.
>>
>> irq_base should go away with dynamic linux irq assignment.
>>
>> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
>> ---
>>  include/linux/of_irq.h |    6 ++++++
>>  1 files changed, 6 insertions(+), 0 deletions(-)
>>
>> diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
>> index cd2e61c..de91ff9 100644
>> --- a/include/linux/of_irq.h
>> +++ b/include/linux/of_irq.h
>> @@ -33,6 +33,12 @@ struct of_irq {
>>  	u32 specifier[OF_MAX_IRQ_SPEC]; /* Specifier copy */
>>  };
>>  
>> +struct of_intc_desc {
>> +	struct device_node *controller;
>> +	struct device_node *parent;
> 
> Do we need parent here?  I think that of_irq_find_parent() will do the 
> job.
> 

With interrupt controller scanning code, it will avoid calling
of_irq_find_parent twice. That code will have to maintain a list of
nodes and parents anyway in order to initialize controllers with no
parent first.

Rob

> Other than that nit the series looks nice to me.
> 
> Jamie
