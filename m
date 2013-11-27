From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 07/12] memory: davinci-aemif: introduce AEMIF driver
Date: Wed, 27 Nov 2013 09:35:58 +0530
Message-ID: <52956FA6.8020705@ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,
 <1384187188-5776-8-git-send-email-ivan.khoronzhuk@ti.com>
 <4F5844B3A985794BA902E12C070812375F8D2E@DNCE04.ent.ti.com>
 <52944BD3.90105@ti.com> <5294DE17.9080900@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <5294DE17.9080900@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: "ivan.khoronzhuk" <ivan.khoronzhuk@ti.com>, "Shilimkar, Santosh" <santosh.shilimkar@ti.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Strashko,
 Grygorii" <grygorii.strashko@ti.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 26 November 2013 11:14 PM, ivan.khoronzhuk wrote:

>>> +static int davinci_aemif_probe(struct platform_device *pdev)
>>> +{
>>> +       int ret  = -ENODEV, i;
>>> +       struct resource *res;
>>> +       struct device *dev = &pdev->dev;
>>> +       struct device_node *np = dev->of_node;
>>> +
>>> +       if (np == NULL)
>>> +               return 0;
>>> +
>>> +       if (aemif) {
>>> +               dev_err(dev, "davinci_aemif driver is in use currently\n");
>>> +               return -EBUSY;
>>> +       }
>>
>> Why expressly prevent multiple AEMIF devices? Its entirely conceivable
>> to have two memories like NAND and NOR flash connect to two different
>> AEMIF interfaces.
>>
> 
> It can be, but I'm not sure if it is needed. Currently I've not seen case where
> more than 2 cses were used, I mean we have 2 cs free, why do we need the second AEMIF
> controller?

One usual reason is pinmux constraints. Its probably not a concern on
the device you are working with right now but as devices get smaller,
functionality on pins is multiplexed to handle multiple different use cases.

Thanks,
Sekhar

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
