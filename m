From: Sherman Yin <syin@broadcom.com>
Subject: Re: [PATCH v3 4/6] pinctrl: Add pinctrl binding for Broadcom Capri
 SoCs
Date: Fri, 13 Dec 2013 17:16:00 -0800
Message-ID: <52ABB150.1030702@broadcom.com>
References: <1381174108-25168-1-git-send-email-syin@broadcom.com>	<1386787041-6035-1-git-send-email-syin@broadcom.com>	<1386787041-6035-5-git-send-email-syin@broadcom.com>
 <CACRpkdY7s+eUFkg0AsaN5B9-1y_mTJ29Y-D9CkRG2GQ3JshP+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdY7s+eUFkg0AsaN5B9-1y_mTJ29Y-D9CkRG2GQ3JshP+w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Christian Daudt <bcm@fixthebug.org>, Russell King <linux@arm.linux.org.uk>, =?ISO-8859-1?Q?Heiko_St=FCbn?= =?ISO-8859-1?Q?er?= <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, Matt Porter <matt.porter@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 13-12-12 12:37 PM, Linus Walleij wrote:
> On Wed, Dec 11, 2013 at 7:37 PM, Sherman Yin <syin@broadcom.com> wrote:
>
>> Adds pinctrl driver devicetree binding for Broadcom Capri (BCM281xx) SoCs.
>>
>> Signed-off-by: Sherman Yin <syin@broadcom.com>
>> Reviewed-by: Christian Daudt <bcm@fixthebug.org>
>> Reviewed-by: Matt Porter <matt.porter@linaro.org>
>> ---
>> v3: Use generic pin config properties instead of brcm-specific ones.  Clarified
>>      pin types (standard, i2c, hdmi).
>> v2: Use hyphens instead of underscore in DT property names.
>
> Overall this is very nice!

Thanks!

>> +- bias-pull-up:                        Integer. Pull up strength in Ohm:
>> +                                       1: 1.2 kOhm
>> +                                       2: 1.8 kOhm
>> +                                       3: 720 Ohm
>> +                                       4: 2.7 kOhm
>> +                                       5: 831 Ohm
>> +                                       6: 1.08 kOhm
>> +                                       7: 568 Ohm
>
> Please do not use these custom enumerators 1 thru 7.
> Instead say that the argument is given in ohms, so for
> example:
>
> bias-pull-up = <12000>;
>
> Then translate this into the proper enumerator in your
> driver instead.

Ok.  The 3 bits in this enumeration correspond to enabling the 3 pull up 
Rs (1.2k, 1.8k, 2.7k) in parallel, so the enum kind of make sense. But 
sure I can change it to actual ohms and will error out in the driver if 
specified value is not one of the 7.

> No full example provided in the binding! This needs to
> be there for understanding.

Ok Will add some examples.

Thanks,
Sherman
