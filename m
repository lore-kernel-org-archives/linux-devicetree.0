From: Ludovic BARRE <ludovic.barre@st.com>
Subject: Re: [PATCH 01/11] irqchip: stm32: Optimizes and cleans up stm32-exti
 irq_domain
Date: Fri, 11 May 2018 09:47:18 +0200
Message-ID: <364a4b45-0276-8e99-4902-f6dfc2aaff2d@st.com>
References: <1524759514-12392-1-git-send-email-ludovic.Barre@st.com>
 <1524759514-12392-2-git-send-email-ludovic.Barre@st.com>
 <20a1b5f0-7494-01a9-635f-c46c337a23b3@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20a1b5f0-7494-01a9-635f-c46c337a23b3@arm.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, radek <radoslaw.pietrzyk@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Loic PALLARDY <loic.pallardy@st.com>, linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Gerald BAEZA <gerald.baeza@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 05/08/2018 04:47 PM, Marc Zyngier wrote:
> On 26/04/18 17:18, Ludovic Barre wrote:
>> From: radek <radoslaw.pietrzyk@gmail.com>
>>
>> - In stm32_exti_alloc function, discards irq_domain_set_info
>>    with handle_simple_irq. This overwrite the setting defined while init
>>    of generic chips. Exti controller manages edge irq type.
>> - Removes acking in chained irq handler as this is done by
>>    irq_chip itself inside handle_edge_irq
>> - removes unneeded irq_domain_ops.xlate callback
>>
>> Signed-off-by: Radoslaw Pietrzyk <radoslaw.pietrzyk@gmail.com>
>> Acked-by: Ludovic Barre <ludovic.barre@st.com>
>> Tested-by: Ludovic Barre <ludovic.barre@st.com>
>> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> 
> Nit: the "From:" should match the SoB line (the address does, but not
> the name). I can fix that up when I apply the series.
> 

Thanks

> Thanks,
> 
> 	M.
> 
