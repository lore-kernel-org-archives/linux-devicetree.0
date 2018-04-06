From: Fabien DESSENNE <fabien.dessenne-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v2 2/2] mailbox: add STMicroelectronics STM32 IPCC driver
Date: Fri, 6 Apr 2018 12:29:02 +0000
Message-ID: <4a2170b7-e5e9-4f5c-8ff7-79e102a658c1@st.com>
References: <1520852307-26659-1-git-send-email-fabien.dessenne@st.com>
 <1520852307-26659-3-git-send-email-fabien.dessenne@st.com>
 <CABb+yY1x7J_oEgU-LR5jPYCoCoUHng84E+CibTxLzdtxhENTBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CABb+yY1x7J_oEgU-LR5jPYCoCoUHng84E+CibTxLzdtxhENTBw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Content-ID: <853A75F869AB854C902589DC856236A9-qxv4g6HH51o@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Loic PALLARDY <loic.pallardy-qxv4g6HH51o@public.gmane.org>, Arnaud POULIQUEN <arnaud.pouliquen-qxv4g6HH51o@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "\",
 linux-arm-kernel\"@lists.infradead.org" <",
 linux-arm-kernel"@lists.infradead.org>, srv_heupstream <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ludovic BARRE <ludovic.barre-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi


On 05/04/18 11:38, Jassi Brar wrote:
> On Mon, Mar 12, 2018 at 4:28 PM, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org> wrote:
> ....
>> +
>> +       /* irq */
>> +       for (i = 0; i < IPCC_IRQ_NUM; i++) {
>> +               ipcc->irqs[i] = of_irq_get_byname(dev->of_node, irq_name[i]);
>> +               if (ipcc->irqs[i] < 0) {
>> +                       dev_err(dev, "no IRQ specified %s\n", irq_name[i]);
>> +                       ret = ipcc->irqs[i];
>> +                       goto err_clk;
>> +               }
>> +
>> +               ret = devm_request_threaded_irq(dev, ipcc->irqs[i], NULL,
>> +                                               irq_thread[i], IRQF_ONESHOT,
>> +                                               dev_name(dev), ipcc);
>>
> In your interrupt handlers you don't do anything that could block.
> Threads only adds some delay to your message handling.
> So maybe use devm_request_irq() ?

The interrupt handlers call mbox_chan_received_data() / 
mbox_chan_txdone(), which call in turn client's rx_callback() / 
tx_done() / tx_prepare() which behavior may be unsafe. Hence, using a 
threaded irq here seems to be a good choice.


>
> .......
>> +
>> +static struct platform_driver stm32_ipcc_driver = {
>> +       .driver = {
>> +               .name = "stm32-ipcc",
>> +               .owner = THIS_MODULE,
>>
> No need of owner here these days.

OK, I will suppress it.

> And also maybe use readl/writel, instead of _relaxed.

The IPCC device is exclusively used on ARM. In ARM architecture, the 
ioremap on devices are strictly ordered and uncached.
In that case, using _relaxed avoids an unneeded cache flush, slightly 
improving performance.

>
> Cheers!
