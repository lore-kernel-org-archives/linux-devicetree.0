From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/5] pinctrl: sun6i: Add some missing
 functions, fix i2c3 muxing
Date: Wed, 26 Nov 2014 09:30:40 +0100
Message-ID: <54758FB0.4010503@redhat.com>
References: <1416747283-13489-1-git-send-email-hdegoede@redhat.com> <1416747283-13489-2-git-send-email-hdegoede@redhat.com> <20141125180455.GA25249@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBOM722RQKGQELDDZBDQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20141125180455.GA25249@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 11/25/2014 07:04 PM, Maxime Ripard wrote:
> Hi,
>
> On Sun, Nov 23, 2014 at 01:54:39PM +0100, Hans de Goede wrote:
>> While working on pinctrl for the A31s, I noticed that function 4 of
>> PA15 - PA18 was missing, add these.
>>
>> I also noticed that i2c3 sck / sda got assigned to PB5 & PB6, this should
>> be PB4 & PB5, fix this as well.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c b/drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c
>> index a2b4b85..fb19e15 100644
>> --- a/drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c
>> +++ b/drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c
>> @@ -134,24 +134,28 @@ static const struct sunxi_desc_pin sun6i_a31_pins[] = {
>>   		  SUNXI_FUNCTION(0x1, "gpio_out"),
>>   		  SUNXI_FUNCTION(0x2, "gmac"),		/* RXD4 */
>>   		  SUNXI_FUNCTION(0x3, "lcd1"),		/* D15 */
>> +		  SUNXI_FUNCTION(0x4, "clk_a_out"),
>
> It's called clk_out_a on the A20, I'd rather stick with the same
> scheme here.

Will fix.

>>   		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 15)),	/* PA_EINT15 */
>>   	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 16),
>>   		  SUNXI_FUNCTION(0x0, "gpio_in"),
>>   		  SUNXI_FUNCTION(0x1, "gpio_out"),
>>   		  SUNXI_FUNCTION(0x2, "gmac"),		/* RXD5 */
>>   		  SUNXI_FUNCTION(0x3, "lcd1"),		/* D16 */
>> +		  SUNXI_FUNCTION(0x4, "dmic"),		/* CLK */
>>   		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 16)),	/* PA_EINT16 */
>>   	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 17),
>>   		  SUNXI_FUNCTION(0x0, "gpio_in"),
>>   		  SUNXI_FUNCTION(0x1, "gpio_out"),
>>   		  SUNXI_FUNCTION(0x2, "gmac"),		/* RXD6 */
>>   		  SUNXI_FUNCTION(0x3, "lcd1"),		/* D17 */
>> +		  SUNXI_FUNCTION(0x4, "dmic"),		/* DIN */
>>   		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 17)),	/* PA_EINT17 */
>>   	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 18),
>>   		  SUNXI_FUNCTION(0x0, "gpio_in"),
>>   		  SUNXI_FUNCTION(0x1, "gpio_out"),
>>   		  SUNXI_FUNCTION(0x2, "gmac"),		/* RXD7 */
>>   		  SUNXI_FUNCTION(0x3, "lcd1"),		/* D18 */
>> +		  SUNXI_FUNCTION(0x4, "clk_b_out"),
>>   		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 18)),	/* PA_EINT18 */
>>   	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 19),
>>   		  SUNXI_FUNCTION(0x0, "gpio_in"),
>> @@ -207,6 +211,7 @@ static const struct sunxi_desc_pin sun6i_a31_pins[] = {
>>   		  SUNXI_FUNCTION(0x1, "gpio_out"),
>>   		  SUNXI_FUNCTION(0x2, "gmac"),		/* MDC */
>>   		  SUNXI_FUNCTION(0x3, "lcd1"),		/* HSYNC */
>> +		  SUNXI_FUNCTION(0x4, "clk_c_out"),
>>   		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 26)),	/* PA_EINT26 */
>>   	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 27),
>>   		  SUNXI_FUNCTION(0x0, "gpio_in"),
>> @@ -242,20 +247,20 @@ static const struct sunxi_desc_pin sun6i_a31_pins[] = {
>>   		  SUNXI_FUNCTION(0x1, "gpio_out"),
>>   		  SUNXI_FUNCTION(0x2, "i2s0"),		/* DO1 */
>>   		  SUNXI_FUNCTION(0x3, "uart3"),		/* RTS */
>> +		  SUNXI_FUNCTION(0x4, "i2c3"),		/* SCK */
>>   		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 4)),	/* PB_EINT4 */
>>   	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 5),
>>   		  SUNXI_FUNCTION(0x0, "gpio_in"),
>>   		  SUNXI_FUNCTION(0x1, "gpio_out"),
>>   		  SUNXI_FUNCTION(0x2, "i2s0"),		/* DO2 */
>>   		  SUNXI_FUNCTION(0x3, "uart3"),		/* TX */
>> -		  SUNXI_FUNCTION(0x4, "i2c3"),		/* SCK */
>> +		  SUNXI_FUNCTION(0x4, "i2c3"),		/* SDA */
>>   		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 5)),	/* PB_EINT5 */
>>   	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 6),
>>   		  SUNXI_FUNCTION(0x0, "gpio_in"),
>>   		  SUNXI_FUNCTION(0x1, "gpio_out"),
>>   		  SUNXI_FUNCTION(0x2, "i2s0"),		/* DO3 */
>>   		  SUNXI_FUNCTION(0x3, "uart3"),		/* RX */
>> -		  SUNXI_FUNCTION(0x4, "i2c3"),		/* SDA */
>
> Where did you get that info from? The datasheet still reports that
> information.

I assume with the datasheet you mean "A31 User Manual V1.20.pdf", which
was last updated on September 20, 2013. I did not check that one, now I
see where the original pinctrl code from.

So I've done some more digging:

"A31 Datasheet - v1.00 (2012-12-24).pdf" also has twi3 sck / sda on pin
PB5 / PB6 like the current pinctrl code.

But "A31 Datasheet V1.40.pdf" which has the following in its revision log:
"1.4 Dec 10,2013 Modify Pin Description"

Moves them to PB4 / PB5 and that is where I got this from (and was the only
place I initially looked), I think that this is an intentional change, and
that PB4 / PB5 are the correct pins.

I will ask Allwinner which is correct, so that we know for sure.

Regards,

Hans
