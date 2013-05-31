From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/3] at_hdmac: add FIFO configuration parameter to DMA
 DT binding
Date: Fri, 31 May 2013 17:11:25 +0200
Message-ID: <20130531151125.GG23653@game.jcrosoft.org>
References: <1369930103-11963-1-git-send-email-ludovic.desroches@atmel.com>
 <1369930103-11963-4-git-send-email-ludovic.desroches@atmel.com>
 <51A77F10.8020808@atmel.com>
 <20130530163936.GC23653@game.jcrosoft.org>
 <20130531091627.GD11384@ludovic.desroches@atmel.com>
 <51A86DF5.4010808@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51A86DF5.4010808-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11:31 Fri 31 May     , Nicolas Ferre wrote:
> On 31/05/2013 11:16, Ludovic Desroches :
> >On Thu, May 30, 2013 at 06:39:36PM +0200, Jean-Christophe PLAGNIOL-VILLARD wrote:
> >>On 18:32 Thu 30 May     , Nicolas Ferre wrote:
> >>>On 30/05/2013 18:08, ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org :
> >>>>From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> >>>>
> >>>>For most devices the FIFO configuration is the same i.e. when half FIFO size is
> >>>>available/filled, a source/destination request is serviced. But USART devices
> >>>>have to do it when there is enough space/data available to perform a single
> >>>>AHB access so the ASAP configuration.
> >>>>
> >>>>Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> >>>>Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> >>>
> >>>Clear and neat: thanks Ludo.
> >>
> >>agreed
> >>
> >>can we apply this via AT91 as this depends on some cleanup I did on DT and
> >>could result on some nigthmware conflict
> >>
> >
> >In fact, I am not sure it's the best solution. I have noticed that there is a
> >conflict with a patch sent by Nicolas (dmaengine: at_hdmac: extend hardware
> >handshaking interface identification) which is already in Vinod's tree but
> >which is not present on Jean-Christophe's cleanup tree on which I based these
> >patches.
> >
> >Moreover this patch doesn't use macros introduced by Nicolas' patch. I may
> >update it and it should go through Vinod's tree with a dependence on patch 1/3.
> >
> >What's your point of view?
> 
> Indeed. Another option could be to push patches 1 and 3 in
> dmaengine's tree and make the 2nd patch go through arm-soc with a
> dependency on slave-dma GIT tree (it seems it is an usual patern).
> 
> Arnd, Jean-Christophe, what do you think?

Nico I let you handle this one my only concern is that the cleanup work can
cause nightware conflict

Best Regards,
J.
> 
> Bye,
> -- 
> Nicolas Ferre
