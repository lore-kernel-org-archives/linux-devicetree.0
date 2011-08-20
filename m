From: Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4] mtd: gpio-nand: add device tree bindings
Date: Sat, 20 Aug 2011 15:09:44 +0300
Message-ID: <1313842186.31216.13.camel@koala>
References: <1312902747-21372-1-git-send-email-jamie@jamieiles.com>
	<1313418543.2600.2.camel@sauron>
	<20110815143816.GH2636@pulham.picochip.com>
	<1313419536.2600.7.camel@sauron>
	<20110815152447.GI2636@pulham.picochip.com>
	<1313811552.4475.10.camel@koala> <20110820063816.GA18892@gallagher>
Reply-To: dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110820063816.GA18892@gallagher>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 2011-08-20 at 07:38 +0100, Jamie Iles wrote:
> Hi Artem,
> 
> On Sat, Aug 20, 2011 at 06:39:10AM +0300, Artem Bityutskiy wrote:
> > On Mon, 2011-08-15 at 16:24 +0100, Jamie Iles wrote:
> > > From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
> > > Subject: [PATCH] mtd: gpio-nand: add device tree bindings
> > > 
> > > Add device tree bindings so that the gpio-nand driver may be
> > > instantiated from the device tree.  This also allows the partitions
> > > to be specified in the device tree.
> > > 
> > > v5:	- fold dt config helpers into a single gpio_nand_of_get_config()
> > > v4:	- get io sync address from gpio-control-nand,io-sync-reg
> > > 	  property rather than a resource
> > > 	- clarified a few details in the binding
> > > v3:	- remove redundant cast and a couple of whitespace/naming
> > > 	  changes
> > > v2:	- add CONFIG_OF guards for non-dt platforms
> > > 	- compatible becomes gpio-control-nand
> > > 	- clarify some binding details
> > > 
> > > Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> > > Cc: Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> > > Signed-off-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
> > 
> > Pushed this patch to l2-mtd-2.6.git, thanks.
> > 
> > P.S. probably it should contain some reviewed-by tags? I can always add
> > them, though, if needed.
> 
> This patch needs of_read_property_u64() from 
> http://www.mail-archive.com/devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org/msg05973.html
> which hasn't been merged yet for the CONFIG_OF case so I'm not sure how this 
> should be handled.

Oh, I did not realize that. Well, let's wait when it is include. I'll
drop your patch for now then.
