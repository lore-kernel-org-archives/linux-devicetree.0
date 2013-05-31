From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: Re: [PATCH 3/3] at_hdmac: add FIFO configuration parameter to DMA DT
 binding
Date: Fri, 31 May 2013 11:16:27 +0200
Message-ID: <21578.5791901455$1369991816@news.gmane.org>
References: <1369930103-11963-1-git-send-email-ludovic.desroches@atmel.com>
 <1369930103-11963-4-git-send-email-ludovic.desroches@atmel.com>
 <51A77F10.8020808@atmel.com>
 <20130530163936.GC23653@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20130530163936.GC23653@game.jcrosoft.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: vinod.koul@intel.com, devicetree-discuss@lists.ozlabs.org, ludovic.desroches@atmel.com, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, May 30, 2013 at 06:39:36PM +0200, Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 18:32 Thu 30 May     , Nicolas Ferre wrote:
> > On 30/05/2013 18:08, ludovic.desroches@atmel.com :
> > >From: Ludovic Desroches <ludovic.desroches@atmel.com>
> > >
> > >For most devices the FIFO configuration is the same i.e. when half FIFO size is
> > >available/filled, a source/destination request is serviced. But USART devices
> > >have to do it when there is enough space/data available to perform a single
> > >AHB access so the ASAP configuration.
> > >
> > >Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> > >Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> > 
> > Clear and neat: thanks Ludo.
> 
> agreed
> 
> can we apply this via AT91 as this depends on some cleanup I did on DT and
> could result on some nigthmware conflict
> 

In fact, I am not sure it's the best solution. I have noticed that there is a
conflict with a patch sent by Nicolas (dmaengine: at_hdmac: extend hardware
handshaking interface identification) which is already in Vinod's tree but
which is not present on Jean-Christophe's cleanup tree on which I based these
patches.

Moreover this patch doesn't use macros introduced by Nicolas' patch. I may
update it and it should go through Vinod's tree with a dependence on patch 1/3.

What's your point of view?
