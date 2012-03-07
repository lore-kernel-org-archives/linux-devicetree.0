From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PULL] of nand generic binding
Date: Wed, 7 Mar 2012 17:28:00 +0100
Message-ID: <20120307162800.GD17745@game.jcrosoft.org>
References: <20120217155707.GR1214@game.jcrosoft.org>
 <20120229152534.GH3318@game.jcrosoft.org>
 <20120307082945.GJ21255@game.jcrosoft.org>
 <4F576602.8020808@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <4F576602.8020808@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 07:43 Wed 07 Mar     , Rob Herring wrote:
> On 03/07/2012 02:29 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > On 16:25 Wed 29 Feb     , Jean-Christophe PLAGNIOL-VILLARD wrote:
> >> On 16:57 Fri 17 Feb     , Jean-Christophe PLAGNIOL-VILLARD wrote:
> >>> HI,
> >>>
> >>> 	please find attached the generic binding for the MTD nand
> >>>
> >>> 	This will add boolean and nand helpers
> >> is it ok?
> > I need this for 3.4
> > 
> > will you apply it or can I apply it via AT91
> 
> Looks fine to me and Grant acked it, so go ahead and take with your at91
> branch.
tks

can you take a look on i2c-gpio and usb and dma_mask patch I send

I wish them to go for 3.4

so I'll have 60 to 80% of the drivers depending on the soc.

for 3.5 we need to finish some cleanup to have finnaly multiple at91 SoC in
the same kernel and add more drivers to DT.

This will allow people to have DT-only kernel on at91 for they board.

Best Regards,
J.
