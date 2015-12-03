From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: add SMP enable-method for Broadcom NSP
Date: Thu, 03 Dec 2015 13:18:45 -0800
Message-ID: <5660B1B5.5000702@gmail.com>
References: <1448987049-17041-1-git-send-email-kapilh@broadcom.com>
 <1448987049-17041-2-git-send-email-kapilh@broadcom.com>
 <20151202152604.GA20467@rob-hp-laptop> <565F16F1.9070809@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <565F16F1.9070809@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kapil Hali <kapilh@broadcom.com>, Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kever Yang <kever.yang@rock-chips.com>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com, Hauke Mehrtens <hauke@hauke-m.de>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jon Mason <jonmason@broadcom.com>, Ray Jui <rjui@broadcom.com>, Gregory Fong <gregory.0xf0@gmail.com>, linux-arm-kernel@lists.infradead.org, Paul Walmsley <paul@pwsan.com>, Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On 02/12/15 08:06, Kapil Hali wrote:
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
>>> @@ -0,0 +1,39 @@
>>> +Broadcom Northstar Plus SoC CPU Enable Method
>>> +---------------------------------------------
>>> +This binding defines the enable method used for starting secondary
>>> +CPUs in the following Broadcom SoCs:
>>> +  BCM58522, BCM58525, BCM58535, BCM58622, BCM58623, BCM58625, BCM88312
>>> +
>>> +The enable method is specified by defining the following required
>>> +properties in the "cpus" device tree node:
>>> +  - enable-method = "brcm,bcm-nsp-smp";
>>> +  - secondary-boot-reg = <...>;
>>
>> Both of these are supposed to be per cpu core.
> 
> 'enable-method' if not found in 'cpu' node is looked at in the 'cpus' 
> node. Except for two-three SoC families, 'enable-method' is within 
> 'cpus' node. Is my interpretation incorrect? Did I miss anything here?

So, what do we do from here? I would appreciate a timely answer from the
DT maintainers here so we can decide on the fate of this patch series
for 4.5.

Thank you
-- 
Florian
