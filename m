From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 0/3] Add device tree probe for imx-sdma driver
Date: Thu, 4 Aug 2011 13:35:04 +0800
Message-ID: <20110804053504.GA3311@freescale.com>
References: <1310723066-567-1-git-send-email-shawn.guo@linaro.org>
	<1312430372.1536.554.camel@vkoul-udesk3>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1312430372.1536.554.camel@vkoul-udesk3>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "Koul, Vinod" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 04, 2011 at 09:29:32AM +0530, Koul, Vinod wrote:
> On Fri, 2011-07-15 at 17:44 +0800, Shawn Guo wrote:
> > The first patch remove the use of software defined sdma version, and
> > instead uses platform_device_id to handle the sdma differences from
> > one soc to another.  The second one makes a small cleanup on function
> > sdma_get_firmware(), and the third patch adds the actual device tree
> > probe support.
> > 
> > Changes since v1:
> >  * Do not encode ROM script address in device tree
> >  * Add one more small cleanup on function sdma_get_firmware()
> > 
> > ShawnsGuo (3):
> >       dmaengine: imx-sdma: use platform_device_id to identify sdma version
> >       dmaengine: imx-sdma: sdma_get_firmware does not need to copy fw_name
> >       dmaengine: imx-sdma: add device tree probe support
> > 
> Sacha are you okay if this go via my tree, would need your ack before I
> take this one
> 
Hi Vinod,

Sorry if I have misunderstood your reply below, but the series has
gone into mainline through arm tree.

Regards,
Shawn

---- Quote ---
On Mon, Jul 25, 2011 at 05:11:55PM +0530, Vinod Koul wrote:
> On Fri, 2011-07-22 at 11:54 +0800, Shawn Guo wrote:
> > Hi Vinod,
> >
> > Can I have your ack on this series, please?  I attempt to get it
> > merged through Sascha's tree after his tree and devicetree/next get
> > merged in the coming window.
> >
> > Regards,
> > Shawn
> >
> > On Fri, Jul 15, 2011 at 05:44:23PM +0800, Shawn Guo wrote:
> > >
> > > ShawnsGuo (3):
> > >       dmaengine: imx-sdma: use platform_device_id to identify sdma version
> > >       dmaengine: imx-sdma: sdma_get_firmware does not need to copy fw_name
> > >       dmaengine: imx-sdma: add device tree probe support
> > >
> Acked-by: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>
> I had queued this up for my tree, i am okay if it gets merged thru
> Sascha
>
