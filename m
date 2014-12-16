From: Y Vo <yvo@apm.com>
Subject: Re: [PATCH v1 1/3] gpio: Add APM X-Gene standby GPIO controller driver
Date: Tue, 16 Dec 2014 16:43:02 +0700
Message-ID: <CAL4ahLfSZjmqqbQ9Xmqae_AVfFZLiUUEN+rABMwiu2_8u4mmPQ@mail.gmail.com>
References: <1412779948-28769-1-git-send-email-yvo@apm.com>
 <2178918.XVCQXOyoGA@wuerfel>
 <CAL4ahLeyPgska0AcgS756y1Nh2tEeJ4A4k4bTJrU0pzqgG08PA@mail.gmail.com>
 <2250730.N6DdkCTXkh@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2250730.N6DdkCTXkh@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Phong Vo <pvo@apm.com>, Linus Walleij <linus.walleij@linaro.org>, patches <patches@apm.com>, Tin Huynh <tnhuynh@apm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Toan Le <toanle@apm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 29, 2014 at 10:16 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wednesday 29 October 2014 22:09:00 Y Vo wrote:
>> Hi Arnd,
>>
>> Per Linus, shall we hold this driver until the GIC submission complete
>> ? Or we will send the version without access GIC to read status in
>> case the GPIO is configured IRQ ?
>
> I'm fine with it either way.
>
>> +static int xgene_gpio_sb_get(struct gpio_chip *gc, u32 gpio)
>> +{
>> +       struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
>> +       struct xgene_gpio_sb *chip = to_xgene_gpio_sb(mm_gc);
>> +       u32 data;
>> +
>> +       data = ioread32(mm_gc->regs + MPA_GPIO_IN_ADDR);
>> +
>> +       return (data &  GPIO_MASK(gpio)) ? 1 : 0;
>> +}
>
> This would be actually broken, right? Maybe it's better to change the
> driver so that it refuses to map GPIO lines that are hardwired to
> the interrupt controller, until we can support that.

It still works if they are configure as GPIO.
Do you have any reference to resolve it ?
