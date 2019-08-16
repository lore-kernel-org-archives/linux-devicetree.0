From: masonccyang@mxic.com.tw
Subject: Re: [PATCH v6 1/2] mtd: rawnand: Add Macronix raw NAND controller
 driver
Date: Fri, 16 Aug 2019 18:10:47 +0800
Message-ID: <OFE8EA3122.5F3A0829-ON48258458.00375F0F-48258458.0037EBA6@mxic.com.tw>
References: <1564631710-30276-1-git-send-email-masonccyang@mxic.com.tw>	<1564631710-30276-2-git-send-email-masonccyang@mxic.com.tw>
 <20190801082233.759f6ae9@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190801082233.759f6ae9@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, christophe.kerello@st.com, richard@nod.at, bbrezillon@kernel.org, juliensu@mxic.com.tw, lee.jones@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, paul@crapouillou.net, marek.vasut@gmail.com, paul.burton@mips.com, liang.yang@amlogic.com, linux-mtd@lists.infradead.org, stefan@agner.ch, miquel.raynal@bootlin.com, anders.roxell@linaro.org, computersforpeace@gmail.com, dwmw2@infradead.org, vigneshr@ti.com
List-Id: devicetree@vger.kernel.org


Hi Boris, 

> > +
> > +static int  mxic_nfc_wait_ready(struct nand_chip *chip)
> > +{
> > +   struct mxic_nand_ctlr *nfc = nand_get_controller_data(chip);
> > +   u32 sts;
> > +
> > +   return readl_poll_timeout(nfc->regs + INT_STS, sts,
> > +              sts & INT_RDY_PIN, 0, USEC_PER_SEC);
> 
> You're not using interrupts at all? For things like R/B wait it's
> usually a good thing to rely on interrupts instead of status-polling.
> 

Have updated it and I will patch using interrupts instead of polling.

thanks for your comments.

best regards,
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
