From: Fabien DESSENNE <fabien.dessenne-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v2 2/2] mailbox: add STMicroelectronics STM32 IPCC driver
Date: Mon, 9 Apr 2018 09:03:25 +0000
Message-ID: <d9b30262-3b0b-1b46-dee7-ee1a4b77e66e@st.com>
References: <1520852307-26659-1-git-send-email-fabien.dessenne@st.com>
 <1520852307-26659-3-git-send-email-fabien.dessenne@st.com>
 <CABb+yY1x7J_oEgU-LR5jPYCoCoUHng84E+CibTxLzdtxhENTBw@mail.gmail.com>
 <4a2170b7-e5e9-4f5c-8ff7-79e102a658c1@st.com>
 <CABb+yY182+7xMbGCurzqxyoGFCRZn4_xKr3AvTQ2c+KyR1vx_w@mail.gmail.com>
 <f9a45a6e-5b3c-ddd0-e465-cfcad6ece818@st.com>
 <CABb+yY2Dd2Gr_-+4RaJarq3tve8tgzVqcoJw+MGT=+Vy56PwLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CABb+yY2Dd2Gr_-+4RaJarq3tve8tgzVqcoJw+MGT=+Vy56PwLw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Content-ID: <EC60E1EDAC1290478E87939229E6BF7D-qxv4g6HH51o@public.gmane.org>
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
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Loic PALLARDY <loic.pallardy-qxv4g6HH51o@public.gmane.org>, Arnaud POULIQUEN <arnaud.pouliquen-qxv4g6HH51o@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, srv_heupstream <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ludovic BARRE <ludovic.barre-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 06/04/18 18:20, Jassi Brar wrote:
> On Fri, Apr 6, 2018 at 8:35 PM, Fabien DESSENNE <fabien.dessenne-qxv4g6HH51o@public.gmane.org> wrote:
>> On 06/04/18 14:56, Jassi Brar wrote:
>>> On Fri, Apr 6, 2018 at 5:59 PM, Fabien DESSENNE <fabien.dessenne-qxv4g6HH51o@public.gmane.org> wrote:
>>>> Hi
>>>>
>>>>
>>>> On 05/04/18 11:38, Jassi Brar wrote:
>>>>> On Mon, Mar 12, 2018 at 4:28 PM, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org> wrote:
>>>>> ....
>>>>>> +
>>>>>> +       /* irq */
>>>>>> +       for (i = 0; i < IPCC_IRQ_NUM; i++) {
>>>>>> +               ipcc->irqs[i] = of_irq_get_byname(dev->of_node, irq_name[i]);
>>>>>> +               if (ipcc->irqs[i] < 0) {
>>>>>> +                       dev_err(dev, "no IRQ specified %s\n", irq_name[i]);
>>>>>> +                       ret = ipcc->irqs[i];
>>>>>> +                       goto err_clk;
>>>>>> +               }
>>>>>> +
>>>>>> +               ret = devm_request_threaded_irq(dev, ipcc->irqs[i], NULL,
>>>>>> +                                               irq_thread[i], IRQF_ONESHOT,
>>>>>> +                                               dev_name(dev), ipcc);
>>>>>>
>>>>> In your interrupt handlers you don't do anything that could block.
>>>>> Threads only adds some delay to your message handling.
>>>>> So maybe use devm_request_irq() ?
>>>> The interrupt handlers call mbox_chan_received_data() /
>>>> mbox_chan_txdone(), which call in turn client's rx_callback() /
>>>> tx_done() / tx_prepare() which behavior may be unsafe. Hence, using a
>>>> threaded irq here seems to be a good choice.
>>>>
>>> rx_callback() is supposed to be atomic.
>> I am worried with this atomic part (and honestly I did not note that the
>> callbacks were expected to be)
>>
>> In my case, remoteproc->virtio->rpmsg is the mailbox client defining the
>> rx_callback.
>> If I follow your suggestion, I shall make this rx_callback Atomic in
>> remoteproc (or in virtio or rpmsg). And this does not seem to be so
>> simple (add a worker in the middle of somewhere?). Bjorn, feel free to
>> comment this part.
>>
>> An alternate implementation consists in using a threaded IRQ for the
>> mailbox interrupt.
>> This option is not only simple, but also ensures to split bottom & half
>> parts at the irq level which is IMHO a general good practice.
>>
>> I can see that some mailbox clients implement callbacks that are NOT
>> atomic and I suspect this is the reason why some mailbox drivers use
>> threaded_irq (rockchip mailbox splits the bottom & half parts).
>>
>> Would it be acceptable to consider the "atomic client callback" as a
>> non-strict rule ?
>>
> Of course you can traverse atomic path from sleepable context (but not
> vice-versa).

So, to be sure we understand each other, I can use threaded_irq, right?

> Please send in the final revision.
>
> Thanks.
