From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/1] ARM: imx28: add basic dt support
Date: Wed, 28 Mar 2012 21:22:29 +0800
Message-ID: <20120328132227.GA3254@S2101-09.ap.freescale.net>
References: <1332513070-5400-1-git-send-email-b29396@freescale.com>
 <20120328055801.GA3953@S2100-06.ap.freescale.net>
 <20120328095346.GA31901@shlinux2.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120328095346.GA31901-Fb7DQEYuewWctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dong Aisheng <aisheng.dong-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Guo Shawn-R65073 <r65073-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 28, 2012 at 05:53:47PM +0800, Dong Aisheng wrote:
> On Wed, Mar 28, 2012 at 01:58:04PM +0800, Guo Shawn-R65073 wrote:
> > On Fri, Mar 23, 2012 at 10:31:10PM +0800, Dong Aisheng wrote:
> > > From: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
...
> > > +static const char *imx28_dt_compat[] __initdata = {
> > 
> > mxs_dt_compat
> > 
> If changed like that, is it reasonable for mx23 to use this
> compatible string list?
> I planed to have separate compatible string for mx23 and mx28.

Ok, I'm fine with that, since we will have separate DT_MACHINE_START
for imx23 and imx28.

> 
> > > +	"fsl,imx28",
> > > +	"fsl,imx28-evk",
> > 
> > I would have the list sorted from the most specific to the most
> > general.  That said, it's better to have "fsl,imx28" sorted after
> > "fsl,imx28-evk".
> > 
> I prefer to keep the basic one first, then for future boards support
> we just add them below rather than insert above the basic one "fsl,imx28".
> However, it's really not a big deal.
> If you persist to do like that, i can also do it.
> 
Yes, please.  Listing items from the most specific to the general is
the rule for compatible property and match table.

-- 
Regards,
Shawn
