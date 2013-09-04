From: Punit Agrawal <punit.agrawal@arm.com>
Subject: Re: [Patch v3 2/3] ARM: dts: Document the CCI PMU DT bindings
Date: Wed, 04 Sep 2013 13:26:17 +0100
Message-ID: <522726E9.8050406@arm.com>
References: <1377183748-5717-1-git-send-email-punit.agrawal@arm.com>
 <1377183748-5717-3-git-send-email-punit.agrawal@arm.com>
 <938AAABA-BE7E-48ED-82D6-61A35B6D9774@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <938AAABA-BE7E-48ED-82D6-61A35B6D9774@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kumar Gala <galak@codeaurora.org>, Will Deacon <Will.Deacon@arm.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

(adding Will, as these patches will be going via his tree.)

Hi Will,

On 30/08/13 17:17, Kumar Gala wrote:
>
> On Aug 22, 2013, at 10:02 AM, Punit Agrawal wrote:
>
>> The CCI PMU can profile bus transactions at the master and slave
>> interfaces of the CCI. The PMU can be used to observe an aggregated
>> view of the bus traffic between the various components connected to the
>> CCI.
>>
>> Introduce a binding for the CCI PMU. The PMU node will be a sub-node of
>> the CCI node.
>>
>> Cc: devicetree@vger.kernel.org
>> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
>> Cc: Nicolas Pitre <nicolas.pitre@linaro.org>
>> Cc: Stephen Warren <swarren@wwwdotorg.org>
>> Cc: Kumar Gala <galak@codeaurora.org>
>> Cc: Rob Herring <rob.herring@calxeda.com>
>> Signed-off-by: Punit Agrawal <punit.agrawal@arm.com>
>> ---
>> Documentation/devicetree/bindings/arm/cci.txt |   46 +++++++++++++++++++++++++
>> 1 file changed, 46 insertions(+)
>
> Acked-by: Kumar Gala <galak@codeaurora.org>
>

Can you pick Kumar's ack for the second patch before you send a pull 
request for the CCI PMU patches? Let me know if you prefer for me to 
post patches with the Acks applied.

Cheers,
Punit

> - k
>
