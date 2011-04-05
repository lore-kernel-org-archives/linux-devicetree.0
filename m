From: "Hans J. Koch" <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>
Subject: Re: [PATCH] uio/pdrv_genirq: Add OF support
Date: Tue, 5 Apr 2011 13:50:13 +0200
Message-ID: <20110405115013.GA7028@local>
References: <20110331170321.GA2734@local> <4D94C09B.4070506@monstr.eu>
	<20110331192302.GD2734@local>
	<AANLkTin6iSVQtKo602hceod+4=cVUMG=GR7cCZvHg4nO@mail.gmail.com>
	<20110331203024.GE2734@local>
	<20110402103550.GA21760@pengutronix.de>
	<20110404170437.GA4830@local>
	<20110404173149.GB12200@pengutronix.de>
	<20110404182423.GC4830@local> <4D9AB5E8.3080401@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4D9AB5E8.3080401-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, gregkh-l3A5Bk7waGM@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Hans J. Koch" <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>, john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 05, 2011 at 08:25:44AM +0200, Michal Simek wrote:
> Hans J. Koch wrote:
> >On Mon, Apr 04, 2011 at 07:31:49PM +0200, Wolfram Sang wrote:
> >>So, the solution for now is to simply add a default value and we can check
> >>later if it can be modified at runtime?
> >
> >Yes.
> 
> ok. Nice. What default value would you like to see as the version string?
> '0', 'generic', 'generic-uio', 'dt'

Actually, I don't care too much. '0' or 'generic' would be OK. I don't
like 'generic-uio' because it only applies to one driver, not UIO as
a whole.

> 
> Ok the last thing is how to handle compatible property.

if 'dt' means 'device tree' then I'd actually like that one since this
default is only used in the device tree case. Obviously you must not
change the version attributes set by platform devices.

Thanks,
Hans
