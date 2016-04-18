From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH 2/4] pinctrl: iproc: Allow certain PINCONF functions to be
 disabled
Date: Mon, 18 Apr 2016 12:22:44 -0700
Message-ID: <1295d10e-79b3-5fc6-48c0-93560824e779@broadcom.com>
References: <1460506523-6249-1-git-send-email-ray.jui@broadcom.com>
 <1460506523-6249-3-git-send-email-ray.jui@broadcom.com>
 <CACRpkdbgpPZrJ-HWF32CEuMT7Ua=Du6KrfZ5ya__Zw-Lf-XM+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbgpPZrJ-HWF32CEuMT7Ua=Du6KrfZ5ya__Zw-Lf-XM+Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pramod Kumar <pramodku@broadcom.com>
List-Id: devicetree@vger.kernel.org

Hi Linus/Rob,

On 4/15/2016 1:20 AM, Linus Walleij wrote:
> On Wed, Apr 13, 2016 at 2:15 AM, Ray Jui <ray.jui@broadcom.com> wrote:
>
>> The iProc GPIO controller is shared among multiple iProc based SoCs. In
>> some of these SoCs, certain PINCONF functions are disabled and registers
>> associated with these functions are reserved. This patch adds support to
>> the iProc GPIO/PINCOF driver to allow these unsupported functions to be
>
> ^PINCONF
>

Will fix this. Thanks.

>> disabled through device tree property 'brcm,pinconf-func-off'. Without
>> disabling these unsupported PINCONF functions, user can potentially
>> access these functions through sysfs debug entries; as a result, these
>> reserved registers can be accessed
>>
>> This patch is developed based on the initial work from Yendapally Reddy
>> Dhananjaya <yrdreddy@broadcom.com> who attempted to disable drive
>> strength configuration for the iProc based NSP chip. In addition,
>> Pramod Kumar <pramodku@broadcom.com> also contributed to make the
>> support more generic across all currently supported PINCONF functions in
>> the iProc GPIO/PINCONF driver
>>
>> Signed-off-by: Pramod Kumar <pramodku@broadcom.com>
>> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
>> Reviewed-by: Jon Mason <jon.mason@broadcom.com>
>> Reviewed-by: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
>> Reviewed-by: Scott Branden <scott.branden@broadcom.com>
>
> OK I see. Hm I think it is better to use a per-soc compatible string
> like Rob Herring indicates to determine if we should loose these
> pin config parameters. Does it seem reasonable to you?
>
> I'm thinking that it is a property of how the hardware was synthesized
> in that SoC so since it is a different version of the hardware it should
> have a unique compatible string.
>

We use the same iProc GPIO controller in various iProc SoCs. Like you 
said, the same iProc GPIO controller is then synthesized slightly 
differently in these SoCs:

In NSP, for example, the iProc GPIO controller supports multiple PINCONF 
functions except drive strength.

In an upcoming iProc chip, the iProc GPIO controller only supports GPIO 
related operations and all PINCONF related operations are supported by a 
different HW block.

The use of compatible strings "brcm,iproc-gpio-only" and 
"brcm,iproc-gpio" models the existing pinctrl-single driver:

Required properties:
- compatible : "pinctrl-single" or "pinconf-single".
"pinctrl-single" means that pinconf isn't supported.
"pinconf-single" means that generic pinconf is supported.

Note compatible string "brcm,iproc-gpio" was already accepted and merged 
upstream. I believe the current debate is that you do not think a 
compatible string of "brcm,iproc-gpio-only" should be introduced to deal 
with an iProc SoC whose GPIO controller is only used as GPIO controller 
without PINCONF functions, correct?

If so, may I suggest the following:

1. keep "brcm,iproc-gpio" for full featured iProc GPIO and PINCONF 
controller
2. Introduce "brcm,iproc-gpio-v2" for NSP, where GPIO and PINCONF 
functions are supported but drive strength specific PINCONF feature is 
disabled
3. Introduce "brcm,iproc-gpio-v3" for upcoming iProc SoCs that move the 
PINCONF support out of this GPIO controller to a completely separate HW 
block

It's my understanding that the naming of a compatible string is best 
tight to the name of the underlying HW block that it is dealing with, 
instead of the name of a SoC where the HW block belongs to. I'm 
uncertain whether this particular case falls into the same category, 
where the same GPIO controller is used but synthesized differently 
across different SoCs.

Please let me know if the above proposed naming is acceptable?

>> +/*
>> + * Bit position for PINCONF functions to be disabled for a given iProc SoC
>> + */
>> +#define IPROC_PIN_DRIVE_STRENGTH        0
>> +#define IPROC_PIN_BIAS_DISABLE          1
>> +#define IPROC_PIN_BIAS_PULL_UP          2
>> +#define IPROC_PIN_BIAS_PULL_DOWN        3
>> +
>> +/*
>> + * Bit mask for DT property "brcm,pinconf-func-off"
>> + */
>> +#define IPROC_PIN_OFF_DRIVE_STRENGTH    (1 << IPROC_PIN_DRIVE_STRENGTH)
>> +#define IPROC_PIN_OFF_BIAS_DISABLE      (1 << IPROC_PIN_BIAS_DISABLE)
>> +#define IPROC_PIN_OFF_BIAS_PULL_UP      (1 << IPROC_PIN_BIAS_PULL_UP)
>> +#define IPROC_PIN_OFF_BIAS_PULL_DOWN    (1 << IPROC_PIN_BIAS_PULL_DOWN)
>> +
>> +#endif
>
> So this stuff should not be in the device tree, the driver should know,
> from the compatible string, what config options that are unavailable.

Okay.

>
> Then if someone tries to use that in the DT, they should get an
> error code -ENOTSUPP, but AFAICT that is what the patch achieves.
>
> Yours,
> Linus Walleij
>

Thanks,

Ray
