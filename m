From: "Shenhar, Talel" <talel@amazon.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: soc: al-pos: Amazon's Annapurna Labs
 POS
Date: Sun, 6 Oct 2019 12:10:50 +0300
Message-ID: <ee5a0727-6cc0-062b-0797-20fecdf1a450@amazon.com>
References: <1570102361-11696-1-git-send-email-talel@amazon.com>
 <1570102361-11696-2-git-send-email-talel@amazon.com>
 <CAL_JsqJDJF7h=nSw3dkNF=H3ghJeLR=MUgrEh+qxw0jhDnfxFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJDJF7h=nSw3dkNF=H3ghJeLR=MUgrEh+qxw0jhDnfxFw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, James Morse <james.morse@arm.com>, David Miller <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Paul E. McKenney" <paulmck@linux.ibm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-edac <linux-edac@vger.kernel.org>, "Woodhouse, David" <dwmw@amazon.co.uk>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "Hawa, Hanna" <hhhawa@amazon.com>, "Krupnik, Ronen" <ronenk@amazon.com>, Jonathan Chocron <jonnyc@amazon.com>, "Hanoch, Uri" <hanochu@amazon.com>, amirkl@amazon.com, "Wasserstrom, Barak" <barakw@ama>
List-Id: devicetree@vger.kernel.org

thanks for the review.

On 10/4/2019 6:05 PM, Rob Herring wrote:
> On Thu, Oct 3, 2019 at 6:33 AM Talel Shenhar <talel@amazon.com> wrote:
>
> Fails 'make dt_binding_check' (drop the '-'):
ack, shall be part of v5
>
>> +
>> +examples:
>> +  - |
>> +    al_pos_edac@f0070084 {
> edac@...
ack, shall be part of v5
>
>> +      compatible = "amazon,al-pos-edac";
>> +      reg = <0x0 0xf0070084 0x0 0x00000008>;
>> +      interrupt-parent = <&amazon_system_fabric>;
>> +      interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
> Not documented.

looks good?

    interrupts:

     description: Interrupt for the error event.
     maxItems: 1
