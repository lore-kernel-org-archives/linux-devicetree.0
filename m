From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCHv3 3/5] pinctrl: mvebu: pinctrl driver for 98DX3236 SoC
Date: Thu, 12 Jan 2017 09:13:44 +0000
Message-ID: <d87cd5081b604cbc8f0142d57854fced@svr-chch-ex1.atlnz.lc>
References: <20170105033641.6212-1-chris.packham@alliedtelesis.co.nz>
 <20170106041517.9589-1-chris.packham@alliedtelesis.co.nz>
 <20170106041517.9589-4-chris.packham@alliedtelesis.co.nz>
 <CACRpkdaC+USN7YhZo49LAL9sorMxbTfhQbT5NrAu5D=Q1DHnnA@mail.gmail.com>
 <95cb4240-e77b-5eaa-1920-4d9e26028038@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kalyan Kinthada <Kalyan.Kinthada@alliedtelesis.co.nz>, Rob Herring <robh+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 12/01/17 09:56, Sebastian Hesselbarth wrote:
> On 01/11/2017 03:44 PM, Linus Walleij wrote:
>> On Fri, Jan 6, 2017 at 5:15 AM, Chris Packham
>> <chris.packham@alliedtelesis.co.nz> wrote:
>>
>>> From: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
>>>
>>> This pinctrl driver supports the 98DX3236, 98DX3336 and 98DX4251 SoCs
>>> from Marvell.
>>>
>>> Signed-off-by: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>
>> I am waiting for an ACK or comment from the maintainers on
>> this patch. Sebastian?
>
> Sorry for the ignorance.
>
> I don't have the patch to reply to inline, but:
>
> - In the driver MPP_MODE2, spi0 there is a typo "csk" instead of "sck".
> - MPP_MODE5 binding "dev","bootcs" and driver "dev","bootcs0" differ.
> - MPP_MODE6 binding "gpio" and driver "gpo" differ.
> - MPP_MODE17 binding "dev","clk" and driver "dev","clkout" differ.
> - MPP_MODE19 binding mentiones "dev","rb" but driver does not.
> - MPP_MODE20 binding "gpio" and driver "gpo" differ.
> - MPP_MODE20 binding "dev","we" and driver "dev","we0" differ.
> - MPP_MODE21 through MPP_MODE30 binding "gpio" and driver "gpo" differ.
> - remove spaces before "0,     0" in mv98dx3236_mpp_gpio_ranges.
>
> Most of it is cosmetic stuff, so if you fix it feel free to add my
>
> Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

Hi Sebastian,

Hopefully I can get a v4 out with the above fixed soon.

One point on "gpio" vs "gpo" this one isn't a typo. Some of these pins 
can be driven as outputs but can't be used as inputs. From a pinctrl 
driver point of view there is no difference but I did want to convey 
that from a system design point of view if you really need something to 
be an input you shouldn't use one of these pins. This is also noted in 
the datasheets so it doesn't necessarily need repeating. If you still 
want me to use "gpio" in the code and binding I'm happy to do so.
