From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v7 6/6] mailbox: Add support for i.MX7D messaging unit
Date: Thu, 26 Jul 2018 16:39:34 +0530
Message-ID: <CABb+yY2=mFr+gFuWyE+VyG6dWj3gKhTs6X+U9UjFu5N=4zU5uA@mail.gmail.com>
References: <20180726065331.6186-1-o.rempel@pengutronix.de>
 <20180726065331.6186-7-o.rempel@pengutronix.de>
 <CABb+yY1Fbj2GiO_zjwnvNFutjX_fRpxnuEoeu6Z3s4NAv2ugbg@mail.gmail.com>
 <a988e8b4-28be-f598-82de-421017409368@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <a988e8b4-28be-f598-82de-421017409368@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Devicetree List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, ", linux-arm-kernel"@lists.infradead.org, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, ",
 Sascha Hauer" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, ", linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream" <linux-mediatek@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>srv_heupstream <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 26, 2018 at 4:21 PM, Oleksij Rempel <o.rempel@pengutronix.de> wrote:

>>
>>> +struct imx_mu_con_priv {
>>> +       int                     irq;
>>> +       unsigned int            idx;
>>> +       char                    *irq_desc;
>>>
>> Having      char  irq_desc[16];    seems simpler than free/kfree upon
>> each startup/shutdown. Simply use snprintf() in probe().
>
> Currently all known configurations use one or two channels. I don't see
> any sense to allocate all at the probe.
>
Just because only 2 out of 4 channels are being used, it doesn't make sense?

What is the concern?  "wasting" 16x2 bytes of memory?  How many bytes,
LOC and execution time does kasprintf() waste?
