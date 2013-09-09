From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2] pwm: pxa: add device tree support to pwm driver
Date: Mon, 09 Sep 2013 12:35:33 -0600
Message-ID: <522E14F5.1020909@wwwdotorg.org>
References: <1378669218-10944-1-git-send-email-mikedunn@newsguy.com>
 <20130909120845.GB22197@ulmo> <522E0D72.3080805@newsguy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <522E0D72.3080805@newsguy.com>
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

On 09/09/2013 12:03 PM, Mike Dunn wrote:
> On 09/09/2013 05:08 AM, Thierry Reding wrote:
>> On Sun, Sep 08, 2013 at 12:40:18PM -0700, Mike Dunn wrote:
>>> This patch adds device tree support to the pxa's pwm driver.  Only an OF match

>>> diff --git a/Documentation/devicetree/bindings/pwm/pxa-pwm.txt b/Documentation/devicetree/bindings/pwm/pxa-pwm.txt

>>> +Marvell pwm controller
>>> +
>>> +Required properties:
>>> +- compatible:
>>> +  for pxa25x, pxa27x, pxa168, pxa910: must be compatible = "marvell,pxa250-pwm";
>>> +- reg: physical base address and length of the registers used by the pwm channel
>>
>> "pwm" -> "PWM". There are a few more occurrences that I haven't
>> explicitly pointed out.
>>
>>> +  NB: One device instance must be created for each pwm that is used, so the
>>> +  length covers only the register window for one pwm output, not that of the
>>> +  entire pwm controller.  Currently length is 0x10 for all supported devices.
>>
>> I'm not sure I like that very much. It seems a wrong representation of
>> the hardware for the sake of modifying a smaller number of lines in the
>> driver.
> 
> I don't like it either, but this is an existing driver defect that will need to
> be corrected.  To do so, I will need to to survey all the supported processors
> to determine how many pwm outputs is posessed by each.  And there may be some
> confusion in that regard; the driver says "pxa25x" has one, but my pxa255
> developer's manual makes no mention of a pwm.  The pxa270 I am testing on has
> four, but the driver says "pxa27x" has two, so currently (using platform_data
> with existing driver) two devices are instantiated, each with two pwms.  It
> seems that there are many variations within a single generation of the processor
> family, so to correctly identify the number of pwms, processor identification
> will have to be made on a finer granularity than the current "pxa25x", for
> example.  I'm guessing that the hardware designers had this
> one-device-instance-per-pwm approach in mind when they made the decision to
> segregate the register sets of each pwm.  I really hope that this sin can be
> forgiven :)

The DT binding is an ABI, so it needs to correctly represent the HW. As
such, I'd say that if the binding is wrong, we need to fix it even if it
means a lot of work.

That said, if each PWM truly is a *completely* independent block, with
non-overlapping register spaces, there's certainly an argument that it's
perfectly acceptable to represent each PWM as a separate DT node...
