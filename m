From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v4] gpio: davinci: reuse for keystone soc
Date: Wed, 12 Feb 2014 20:00:28 +0200
Message-ID: <52FBB6BC.2060801@ti.com>
References: <1391615244-12014-1-git-send-email-grygorii.strashko@ti.com>
 <CACRpkdbrs==tpUBs=WLWkt0frBcSMRDRokOn2tvP-1gt7Qq3+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdbrs==tpUBs=WLWkt0frBcSMRDRokOn2tvP-1gt7Qq3+w@mail.gmail.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>, Alexandre Courbot <gnurou@gmail.com>, Sekhar Nori <nsekhar@ti.com>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On 02/12/2014 05:03 PM, Linus Walleij wrote:
> On Wed, Feb 5, 2014 at 4:47 PM, Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
>
>> The similar GPIO HW block is used by keystone SoCs as
>> in Davinci SoCs.
>> Hence, reuse Davinci GPIO driver for Keystone taking into
>> account that Keystone contains ARM GIC IRQ controller which
>> is implemented using IRQ Chip.
>>
>> Documentation:
>>          http://www.ti.com/lit/ug/sprugv1/sprugv1.pdf
>>
>> Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>> ---
>> Changes in v4:
>> - rebased on top of v3.14 +
>>    [patch] gpio: davinci: signedness bug in davinci_gpio_irq_setup()
>
> I tried applying this and it does not apply on the "devel" branch
> in the GPIO tree. Since I haven't touched one line of code in the
> DaVinci driver since v3.14-rc1 I seriously doubt that this is
> rebased on v3.14[-rc].
>
> Can you please rebase the patch onto v3.14-rc1 for real and
> resend it?

Sorry, But I've to clarify that this patch is based on:
http://www.spinics.net/lists/linux-kernel-janitors/msg18017.html
[patch] gpio: davinci: signedness bug in davinci_gpio_irq_setup()

And I did it to avoid merge conflicts between these two patches.

Is it possible to apply above one first? It's not in any of your
branches.

Of Course, I can re-base this patch on clean v3.14-rc1, but then merge
conflict will happen with "gpio: davinci: signedness.." patch.

Regards,
- grygorii
