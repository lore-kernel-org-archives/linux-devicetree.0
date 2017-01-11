From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCHv3 3/5] pinctrl: mvebu: pinctrl driver for 98DX3236 SoC
Date: Wed, 11 Jan 2017 21:55:48 +0100
Message-ID: <95cb4240-e77b-5eaa-1920-4d9e26028038@gmail.com>
References: <20170105033641.6212-1-chris.packham@alliedtelesis.co.nz>
 <20170106041517.9589-1-chris.packham@alliedtelesis.co.nz>
 <20170106041517.9589-4-chris.packham@alliedtelesis.co.nz>
 <CACRpkdaC+USN7YhZo49LAL9sorMxbTfhQbT5NrAu5D=Q1DHnnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdaC+USN7YhZo49LAL9sorMxbTfhQbT5NrAu5D=Q1DHnnA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Chris Packham <chris.packham@alliedtelesis.co.nz>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>, Rob Herring <robh+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 01/11/2017 03:44 PM, Linus Walleij wrote:
> On Fri, Jan 6, 2017 at 5:15 AM, Chris Packham
> <chris.packham@alliedtelesis.co.nz> wrote:
>
>> From: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
>>
>> This pinctrl driver supports the 98DX3236, 98DX3336 and 98DX4251 SoCs
>> from Marvell.
>>
>> Signed-off-by: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>
> I am waiting for an ACK or comment from the maintainers on
> this patch. Sebastian?

Sorry for the ignorance.

I don't have the patch to reply to inline, but:

- In the driver MPP_MODE2, spi0 there is a typo "csk" instead of "sck".
- MPP_MODE5 binding "dev","bootcs" and driver "dev","bootcs0" differ.
- MPP_MODE6 binding "gpio" and driver "gpo" differ.
- MPP_MODE17 binding "dev","clk" and driver "dev","clkout" differ.
- MPP_MODE19 binding mentiones "dev","rb" but driver does not.
- MPP_MODE20 binding "gpio" and driver "gpo" differ.
- MPP_MODE20 binding "dev","we" and driver "dev","we0" differ.
- MPP_MODE21 through MPP_MODE30 binding "gpio" and driver "gpo" differ.
- remove spaces before "0,     0" in mv98dx3236_mpp_gpio_ranges.

Most of it is cosmetic stuff, so if you fix it feel free to add my

Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

Sebastian
