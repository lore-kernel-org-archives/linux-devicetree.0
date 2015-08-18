From: Graham Moore <grmoore@opensource.altera.com>
Subject: Re: [PATCH V7 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
Date: Tue, 18 Aug 2015 14:17:42 -0500
Message-ID: <55D384D6.9040303@opensource.altera.com>
References: <1439522892-7524-1-git-send-email-marex@denx.de>
 <1439522892-7524-2-git-send-email-marex@denx.de> <55D299CD.2070809@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <55D299CD.2070809@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: vikas <vikas.manocha@st.com>
Cc: Marek Vasut <marex@denx.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alan Tull <atull@opensource.altera.com>, Yves Vandervennet <yvanderv@opensource.altera.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Dinh Nguyen <dinguyen@opensource.altera.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Vikas,

On 08/17/2015 09:34 PM, vikas wrote:
 > Hi Marek,
 >

[...]

 >> +
>> +/* Operation timeout value */
>> +#define CQSPI_TIMEOUT_MS                       500
>> +#define CQSPI_READ_TIMEOUT_MS                  10
>
> please add some comment about the timeouts value selection.
>

I wish I could comment, but I don't know the origin of these values. 
The 500 ms value is probably just "a very long time".

[...]

>> +
>> +       cqspi->irq_mask = CQSPI_IRQ_MASK_RD;
>> +       writel(cqspi->irq_mask, reg_base + CQSPI_REG_IRQMASK);
>
> here interrupt mask is being configured for every read, better would be to move it in init.
>

[...]

>> +
>> +       cqspi->irq_mask = CQSPI_IRQ_MASK_WR;
>> +       writel(cqspi->irq_mask, reg_base + CQSPI_REG_IRQMASK);
>
> same like read, it should be moved to init.
>

It uses different masks for read and write

[...]

BR,
Graham


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
