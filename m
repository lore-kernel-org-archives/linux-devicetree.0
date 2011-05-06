From: "Hans J. Koch" <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>
Subject: Re: [PATCH v4] uio/pdrv_genirq: Add OF support
Date: Fri, 6 May 2011 02:55:13 +0200
Message-ID: <20110506005513.GC2790@local>
References: <1304319115-32745-1-git-send-email-monstr@monstr.eu>
	<20110503203412.GA2119@pengutronix.de>
	<20110503221440.GB2737@local> <4DC152F3.2050500@monstr.eu>
	<20110504194730.GA2820@local> <4DC23513.2090007@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4DC23513.2090007-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Hans J. Koch" <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>, john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, May 05, 2011 at 07:26:43AM +0200, Michal Simek wrote:
> Hans J. Koch wrote:
> >On Wed, May 04, 2011 at 03:21:55PM +0200, Michal Simek wrote:
> >>Hans J. Koch wrote:
> >>>On Tue, May 03, 2011 at 10:34:12PM +0200, Wolfram Sang wrote:
> >>>>On Mon, May 02, 2011 at 08:51:55AM +0200, Michal Simek wrote:
> >>>>>Adding OF binding to genirq.
> >>>>>Version string is setup to the "devicetree".
> >>>>>
> >>>>>Compatible string is not setup for now but you can add your
> >>>>>custom compatible string to uio_of_genirq_match structure.
> >>>>>
> >>>>>For example with "vendor,device" compatible string:
> >>>>>static const struct of_device_id __devinitconst uio_of_genirq_match[] = {
> >>>>>	{ .compatible = "vendor,device", },
> >>>>>	{ /* empty for now */ },
> >>>>>};
> >>>>>
> >>>>>Signed-off-by: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
> >>>>[...]
> >>>>
> >>>>>+		/* alloc uioinfo for one device */
> >>>>>+		uioinfo = kzalloc(sizeof(*uioinfo), GFP_KERNEL);
> >>>>kfree in remove?
> >>>Oh yes. Missed that one. It should probably look like the "bad0" case in probe().
> >>Yes, freeing uioinfo in uio_pdrv_genirq_remove make sense for CONFIG_OF.
> >>
> >>Please correct me if I am wrong dev.of_node is not NULL for OF. I
> >>think yes that's why I would prefer to use this construct instead of
> >>#ifdef CONFIG_OF.
> >>
> >>	if (pdev->dev.of_node)
> >>		kfree(pdev->dev.platform_data);
> >
> >Huh? You didn't allocate platform_data, so you shouldn't free it.
> >It's uioinfo you allocated.
> 
> grrr. I am stupid!

We all are, sometimes. That's why we have a public review process so that
collective stupidity can lead to good code.

Thanks,
Hans
