From: masonccyang@mxic.com.tw
Subject: Re: [PATCH v4 1/2] mtd: rawnand: Add Macronix Raw NAND controller
Date: Fri, 28 Jun 2019 16:31:16 +0800
Message-ID: <OF2EDB7089.FAD92F61-ON48258427.002D122A-48258427.002ECEF3@mxic.com.tw>
References: <1561443056-13766-1-git-send-email-masonccyang@mxic.com.tw>	<1561443056-13766-2-git-send-email-masonccyang@mxic.com.tw>
 <20190627193635.29abff43@xps13>	<OFDDC43C05.7B4092B5-ON48258427.001EE57E-48258427.002122D1@mxic.com.tw>
 <20190628091836.3148d450@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190628091836.3148d450@xps13>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: devicetree@vger.kernel.org, christophe.kerello@st.com, vigneshr@ti.com, jianxin.pan@amlogic.com, bbrezillon@kernel.org, juliensu@mxic.com.tw, lee.jones@linaro.org, linux-kernel@vger.kernel.org, stefan@agner.ch, paul@crapouillou.net, marek.vasut@gmail.com, paul.burton@mips.com, broonie@kernel.org, linux-mtd@lists.infradead.org, richard@nod.at, anders.roxell@linaro.org, liang.yang@amlogic.com, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org


Hi Miquel,

> > 
> > > > Add a driver for Macronix raw NAND controller. 
> > > 
> > > Could you pass userspace major MTD tests and can you 
attach/mount/edit
> > > a UBI/UBIFS storage? 
> > 
> > mtd_debug passed and using dd utility to read and write 
> > with md5sum checking passed.
> 
> Please don't use dd, use nanddump/nandwrite/flasherase/nandbiterrs and
> run the other tests from the mtd-utils test suite (available in
> Buildroot for instance).
> 

Got it.

But may I know why 'dd' utility is not preferences ?
I generate a random data file and write to Flash by
using dd with bs=page size and read data back from Flash.
Checking data by md5sum.
The write and read testing data size is easily adjustable.


> > 
> > > > +static int mxic_nfc_clk_enable(struct mxic_nand_ctlr *nfc)
> > > > +{
> > > > +   int ret;
> > > > +
> > > > +   ret = clk_prepare_enable(nfc->send_clk);
> > > > +   if (ret)
> > > > +      return ret;
> > > > +
> > > > +   ret = clk_prepare_enable(nfc->send_dly_clk);
> > > > +   if (ret)
> > > > +      goto err_send_dly_clk; 
> > > 
> > > I'm not sure why you only enable 2 out of 3 clocks and also why ou
> > > handle two of them here (which is great, I prefer having a separate
> > > helper for that) and the other one elsewhere?
> > > 
> > 
> > send_clk and send_dly_clk are device domain clocks.
> > 
> > send_clk is clock without phase delay to ps_clk, used for sending 
device
> > signals except for SIO[7:0].
> > send_dly_clk is clock with phase delay to ps_clk, used for sending 
> > SIO[7:0]
> > 
> > ps_clk is system domain clock and it's a source clock of send_clk and 
> > send_dly_clk.
> 
> And why is that explaining the fact that you configure them in
> different places? You can explain this with a nice comment at the top
> of the function, but I would rather prefer that you handle all three
> clocks in one go if possible.
> 

okay, will patch it.

> > > > +static int mxic_nfc_data_xfer(struct mxic_nand_ctlr *nfc, const 
void 
> > *txbuf,
> > > > +               void *rxbuf, unsigned int len)
> > > > +{
> > > > +   unsigned int pos = 0;
> > > > +
> > > > +   while (pos < len) {
> > > > +      unsigned int nbytes = len - pos;
> > > > +      u32 data = 0xffffffff;
> > > > +      u32 sts;
> > > > +      int ret;
> > > > +
> > > > +      if (nbytes > 4)
> > > > +         nbytes = 4;
> > > > +
> > > > +      if (txbuf)
> > > > +         memcpy(&data, txbuf + pos, nbytes);
> > > > +
> > > > +      ret = readl_poll_timeout(nfc->regs + INT_STS, sts,
> > > > +                sts & INT_TX_EMPTY, 0, USEC_PER_SEC);
> > > > +      if (ret)
> > > > +         return ret;
> > > > +
> > > > +      writel(data, nfc->regs + TXD(nbytes % 4));
> > > > +
> > > > +      if (rxbuf) {
> > > > +         ret = readl_poll_timeout(nfc->regs + INT_STS, sts,
> > > > +                   sts & INT_TX_EMPTY, 0,
> > > > +                   USEC_PER_SEC);
> > > > +         if (ret)
> > > > +            return ret;
> > > > +
> > > > +         ret = readl_poll_timeout(nfc->regs + INT_STS, sts,
> > > > +                   sts & INT_RX_NOT_EMPTY, 0,
> > > > +                   USEC_PER_SEC);
> > > > +         if (ret)
> > > > +            return ret;
> > > > +
> > > > +         data = readl(nfc->regs + RXD);
> > > > +         data >>= (8 * (4 - nbytes));
> > > > +         memcpy(rxbuf + pos, &data, nbytes);
> > > > +         WARN_ON(readl(nfc->regs + INT_STS) & INT_RX_NOT_EMPTY);
> > > > +      } else {
> > > > +         readl(nfc->regs + RXD);
> > > > +      }
> > > > +      WARN_ON(readl(nfc->regs + INT_STS) & INT_RX_NOT_EMPTY); 
> > > 
> > > WARN_ON() is maybe a bit overkill here? 
> > 
> > should I remove it ?
> 
> I would stick to regular dev_warn.

Got it, will patch it.

thanks & best regards,
Mason

CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information 
and/or personal data, which is protected by applicable laws. Please be 
reminded that duplication, disclosure, distribution, or use of this e-mail 
(and/or its attachments) or any part thereof is prohibited. If you receive 
this e-mail in error, please notify us immediately and delete this mail as 
well as its attachment(s) from your system. In addition, please be 
informed that collection, processing, and/or use of personal data is 
prohibited unless expressly permitted by personal data protection laws. 
Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================



============================================================================

CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information and/or personal data, which is protected by applicable laws. Please be reminded that duplication, disclosure, distribution, or use of this e-mail (and/or its attachments) or any part thereof is prohibited. If you receive this e-mail in error, please notify us immediately and delete this mail as well as its attachment(s) from your system. In addition, please be informed that collection, processing, and/or use of personal data is prohibited unless expressly permitted by personal data protection laws. Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
