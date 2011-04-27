From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCHv3] ARM:boot:device tree: Allow the device tree binary
	to be appended to zImage
Date: Wed, 27 Apr 2011 07:38:45 -0700
Message-ID: <20110427143845.GJ3755@atomide.com>
References: <20110324231830.2586.7150.stgit@riker>
	<20110328091259.GA18721@S2100-06.ap.freescale.net>
	<20110413140030.GE12665@atomide.com>
	<20110420054746.GA31127@S2100-06.ap.freescale.net>
	<20110420073445.GB31127@S2100-06.ap.freescale.net>
	<20110421080238.GE13688@atomide.com>
	<20110421124618.GA15060@atomide.com>
	<20110427142306.GI3755@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110427142306.GI3755-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

* Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> [110427 07:20]:
> 
> I guess the issue is that when setup_machine_fdt gets called we only
> have minimal MMU mapping done.
> 
> So I guess there's some other patch related to it?

Hmm head.S should already map the boot params address in r2..
Looks like more debugging is needed.

Tony
