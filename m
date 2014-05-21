From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH RESEND 2/2] Documentation: add Broadcom STB Level-2
 interrupt controller binding
Date: Tue, 20 May 2014 19:24:16 -0700
Message-ID: <537C0E50.4050409@gmail.com>
References: <1400613229-19049-1-git-send-email-f.fainelli@gmail.com>
 <1400613229-19049-3-git-send-email-f.fainelli@gmail.com>
 <20140521013027.GD8664@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140521013027.GD8664@titan.lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Randy Dunlap <rdunlap@infradead.org>, DOCUMENTATION <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, arm@kernel.org, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Brian Norris <computersforpeace@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Le 20/05/2014 18:30, Jason Cooper a =E9crit :
> On Tue, May 20, 2014 at 12:13:49PM -0700, Florian Fainelli wrote:
>> This patch adds the Device Tree binding document for the Broadcom
>> Set-top-box Level 2 interrupt controller hardware.
>>
>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>   .../bindings/interrupt-controller/brcm,l2-intc.txt | 29 ++++++++++++++=
++++++++
>>   1 file changed, 29 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/interrupt-control=
ler/brcm,l2-intc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm=
,l2-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,=
l2-intc.txt
>> new file mode 100644
>> index 000000000000..448273a30a11
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,l2-int=
c.txt
>> @@ -0,0 +1,29 @@
>> +Broadcom Generic Level 2 Interrupt Controller
>> +
>> +Required properties:
>> +
>> +- compatible: should be "brcm,l2-intc"
>> +- reg: specifies the base physical address and size of the registers
>> +- interrupt-controller: identifies the node as an interrupt controller
>> +- #interrupt-cells: specifies the number of cells needed to encode an
>> +  interrupt source. Should be 1.
>> +- interrupt-parent: specifies the phandle to the parent interrupt contr=
oller
>> +  this controller is cacaded from
>> +- interrupts: specifies the interrupt line in the interrupt-parent irq =
space
>> +  to be used for cascading
>> +
>> +Optional properties:
>> +
>> +- brcm,irq-can-wake: If present, this means the L2 controller can be us=
ed as a
>> +  wakeup source for system suspend/resume.
>
> Do we need a vendor-specific property here?  I'd much prefer to see a
> generic implementation.

Is there an usable generic property? We came up with a custom one =

because there is not a generic one AFAICT.
