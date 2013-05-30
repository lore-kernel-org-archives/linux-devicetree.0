From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 3/3] at_hdmac: add FIFO configuration parameter to DMA
 DT binding
Date: Thu, 30 May 2013 18:39:36 +0200
Message-ID: <20130530163936.GC23653@game.jcrosoft.org>
References: <1369930103-11963-1-git-send-email-ludovic.desroches@atmel.com>
 <1369930103-11963-4-git-send-email-ludovic.desroches@atmel.com>
 <51A77F10.8020808@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <51A77F10.8020808@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: vinod.koul@intel.com, devicetree-discuss@lists.ozlabs.org, ludovic.desroches@atmel.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 18:32 Thu 30 May     , Nicolas Ferre wrote:
> On 30/05/2013 18:08, ludovic.desroches@atmel.com :
> >From: Ludovic Desroches <ludovic.desroches@atmel.com>
> >
> >For most devices the FIFO configuration is the same i.e. when half FIFO size is
> >available/filled, a source/destination request is serviced. But USART devices
> >have to do it when there is enough space/data available to perform a single
> >AHB access so the ASAP configuration.
> >
> >Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> >Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> 
> Clear and neat: thanks Ludo.

agreed

can we apply this via AT91 as this depends on some cleanup I did on DT and
could result on some nigthmware conflict

Best Regards,
J.
