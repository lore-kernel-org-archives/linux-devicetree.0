From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 5/6 V2] atmel/nand: add DT support
Date: Tue, 7 Feb 2012 12:53:06 +0100
Message-ID: <20120207115306.GF15647@game.jcrosoft.org>
References: <1327727444-23908-1-git-send-email-plagnioj@jcrosoft.com>
 <1328524512-18159-2-git-send-email-plagnioj@jcrosoft.com>
 <4F30FD4B.4050501@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <4F30FD4B.4050501@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11:30 Tue 07 Feb     , Nicolas Ferre wrote:
> On 02/06/2012 11:35 AM, Jean-Christophe PLAGNIOL-VILLARD :
> > use a local copy of board informatin and fill with DT data
> > 
> > Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> > Acked-by: Grant Likely <grant.likely@secretlab.ca>
> > Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
> > Cc: devicetree-discuss@lists.ozlabs.org
> > Cc: linux-mtd@lists.infradead.org
> 
> [..]
> 
> > +static int __devinit atmel_of_init_port(struct atmel_nand_host *host,
> > +					 struct device_node *np)
> 
> Maybe you will need to protect this function in case of !DT builds: I
> suspect that some of the of_xxxxx() calls are not provided if !CONFIG_OF.
no-need on the of_ function are static inline it !CONFIG_OF

Best Regards,
J.
