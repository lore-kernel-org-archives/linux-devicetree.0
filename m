From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [RESEND PATCH v2] pwm: pxa: add device tree support to pwm driver
Date: Tue, 10 Sep 2013 10:46:49 -0600
Message-ID: <522F4CF9.3070601@wwwdotorg.org>
References: <1378751420-19227-1-git-send-email-mikedunn@newsguy.com>
 <522E3B5B.90406@wwwdotorg.org> <522F40A3.9030701@newsguy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <522F40A3.9030701@newsguy.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mike Dunn <mikedunn@newsguy.com>
Cc: Marek Vasut <marex@denx.de>, linux-pwm@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Chao Xie <chao.xie@marvell.com>, Thierry Reding <thierry.reding@gmail.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Grant Likely <grant.likely@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Robert Jarzmik <robert.jarzmik@free.fr>, linux-arm-kernel@lists.infradead.org, Ian Campbell <ian.campbell@citrix.com>
List-Id: devicetree@vger.kernel.org

On 09/10/2013 09:54 AM, Mike Dunn wrote:
> On 09/09/2013 02:19 PM, Stephen Warren wrote:
>> On 09/09/2013 12:30 PM, Mike Dunn wrote:
>>> This patch adds device tree support to the pxa's pwm driver.  Only an OF match
>>> table is added; nothing needs to be extracted from the device tree node.  The
>>> existing platform_device id table is reused for the match table data.  Support
>>> for inverted polarity is also added.
>>>
>>> Tested on a Palm Treo 680 (both platform data and DT cases).
>>
>>> diff --git a/Documentation/devicetree/bindings/pwm/pxa-pwm.txt b/Documentation/devicetree/bindings/pwm/pxa-pwm.txt
>>
>>> +Marvell pwm controller
>>
>> s/pwm/PWM/ throughout.
>>
>>> +
>>> +Required properties:
>>> +- compatible:
>>> +  for pxa25x, pxa27x, pxa168, pxa910: must be compatible = "marvell,pxa250-pwm";
>>
>> I think you want a separate compatible value for each HW, to allow for
>> any HW-specific quirks to be enabled later if required. So, you could
>> document "marvell,pxa250-pwm" as the basic compatible value that a
>> driver can bind to, yet also document the other values as being required
>> for the relevant HW?
> 
> IOW...
> - compatible: should be one of:
>   - "marvell,pxa250-pwm"
>   - "marvell,pxa270-pwm"
>   - "marvell,pxa168-pwm"
>   - "marvell,pxa910-pwm"
> 
> Even though the driver makes no functional distinction currently?

Yes (although it's fine to make the driver only look for the first of
those, since you say they're all compatible, and currently the driver
doesn't care about exactly which HW is in use).

>>> +- reg: physical base address and length of the registers used by the pwm channel
>>> +  NB: One device instance must be created for each pwm that is used, so the
>>> +  length covers only the register window for one pwm output, not that of the
>>> +  entire pwm controller.  Currently length is 0x10 for all supported devices.
>>> +- #pwm-cells: should be 3.
>>> +   cell 1: the per-chip index of the PWM to use,
>>
>> That cell shouldn't be needed if you really want to have one DT node per
>> PWM channel.
> 
> Yes, but I was afraid to deviate from the format used by the other PWM
> controllers.  (But in that case, it should at least be documented as "must be
> zero". Thanks.)  If going my owm way is acceptable, I'll define my own
> of_xlate() parser and remove this cell.

I don't think there's any issue with deviating; that's exactly what
#pwm-cells is for.
