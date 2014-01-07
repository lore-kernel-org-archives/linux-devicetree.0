From: Sherman Yin <syin@broadcom.com>
Subject: Re: [PATCH v4 2/4] pinctrl: Add pinctrl binding for Broadcom Capri
 SoCs
Date: Tue, 7 Jan 2014 12:45:54 -0800
Message-ID: <52CC6782.4060309@broadcom.com>
References: <1386787041-6035-1-git-send-email-syin@broadcom.com>	<1387592016-13740-1-git-send-email-syin@broadcom.com>	<1387592016-13740-3-git-send-email-syin@broadcom.com> <CACRpkdaAq15wKD900SqN1sQFLBATiuA3vNoua+KJGHU+gdCgqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaAq15wKD900SqN1sQFLBATiuA3vNoua+KJGHU+gdCgqg@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <rob.herring@calxeda.com>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Christian Daudt <bcm@fixthebug.org>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, Matt Porter <matt.porter@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 14-01-07 09:15 AM, Linus Walleij wrote:
> On Sat, Dec 21, 2013 at 3:13 AM, Sherman Yin <syin@broadcom.com> wrote:
>> +Optional Properties (for standard pins):
>> +
>> +- function:                    String. Specifies the pin mux selection. Values
>> +                               must be one of: "alt1", "alt2", "alt3", "alt4"
>> +- input-schmitt-enable:                No arguments. Enable schmitt-trigger mode.
>> +- input-schmitt-disable:       No arguments. Disable schmitt-trigger mode.
>> +- bias-pull-up:                        No arguments. Pull up on pin.
>> +- bias-pull-down:              No arguments. Pull down on pin.
>> +- bias-disable:                        No arguments. Disable pin bias.
>> +- slew-rate:                   Integer. Meaning depends on configured pin mux:
>> +                               *_SCL or *_SDA:
>> +                                       0: Standard(100kbps)& Fast(400kbps) mode
>> +                                       1: Highspeed (3.4Mbps) mode
>> +                               IC_DM or IC_DP:
>> +                                       0: normal slew rate
>> +                                       1: fast slew rate
>> +                               Otherwise:
>> +                                       0: fast slew rate
>> +                                       1: normal slew rate
>> +- input-enable:                        No arguements. Enable input (does not affect
>> +                               output.)
>> +- input-disable:               No arguements. Disable input (does not affect
>> +                               output.)
>> +- drive-strength:              Integer. Drive strength in mA.  Valid values are
>> +                               2, 4, 6, 8, 10, 12, 14, 16 mA.
>
> Also patch
> Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> Since you're adding generic properties.

Please note that I removed from this patchset the patch that you've 
merged to your for-next branch already:

https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-pinctrl.git/commit/?h=for-next&id=8ba3f4d00078e7a49c60c0bd6298f29402c3a0a0

Is that what you wanted to see in pinctrl-bindings.txt, or is there 
something else you want to see added to that txt file?  I didn't want to 
add the description of slew-rate arguments there because this is 
capri-specific.  I'm not quite sure what else to add.


>> +Optional Properties (for I2C pins):
>> +
>> +- function:                    String. Specifies the pin mux selection. Values
>> +                               must be one of: "alt1", "alt2", "alt3", "alt4"
>> +- bias-pull-up:                        Integer. Pull up strength in Ohm. There are 3
>> +                               pull-up resisitors (1.2k, 1.8k, 2.7k) available
>> +                               in parallel for I2C pins, so the valid values
>> +                               are: 568, 720, 831, 1080, 1200, 1800, 2700 Ohm.
>
> Also patch
> Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt

That doc already says bias-pull-up is specified in Ohm, and the specific 
values are chip-specific, so I don't think they should be mentioned there.

>> +- bias-disable:                        No arguments. Disable pin bias.
>> +- slew-rate:                   Integer. Meaning depends on configured pin mux:
>> +                               *_SCL or *_SDA:
>> +                                       0: Standard(100kbps)& Fast(400kbps) mode
>> +                                       1: Highspeed (3.4Mbps) mode
>> +                               IC_DM or IC_DP:
>> +                                       0: normal slew rate
>> +                                       1: fast slew rate
>> +                               Otherwise:
>> +                                       0: fast slew rate
>> +                                       1: normal slew rate
>
> Hm that does not seem generic though, so let's not add this to the
> generic bindings.
>
>> +- input-enable:                        No arguements. Enable input (does not affect
>> +                               output.)
>> +- input-disable:               No arguements. Disable input (does not affect
>> +                               output.)
>> +
>> +Optional Properties (for HDMI pins):
>> +
>> +- function:                    String. Specifies the pin mux selection. Values
>> +                               must be one of: "alt1", "alt2", "alt3", "alt4"
>> +- slew-rate:                   Integer. Controls slew rate.
>> +                                       0: Standard(100kbps)& Fast(400kbps) mode
>> +                                       1: Highspeed (3.4Mbps) mode
>
> Hmmmm slew rate is not specifiec in "bps" but rather in
> something like volts per second. But maybe it's best to keep
> this value driver-specific.

Right, I think the slew-rates values are capri specific.

Thanks for the review.

Regards,
Sherman
