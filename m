From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/1 v3] dt: add property iteration helpers
Date: Tue, 10 Apr 2012 04:27:28 +0200
Message-ID: <20120410022728.GD29577@game.jcrosoft.org>
References: <1333968374-28451-1-git-send-email-plagnioj@jcrosoft.com>
 <4F82FF8E.8090407@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F82FF8E.8090407-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09:26 Mon 09 Apr     , Stephen Warren wrote:
> On 04/09/2012 04:46 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> > 
> > This patch adds macros of_property_for_each_u32() and
> > of_property_for_each_string(), which iterate over an array of values
> > within a device-tree property. Usage is for example:
> ...
> > ---
> > I need it for at91 for the interrupt controller
> > and pinctrl
> 
> OK. But just reposting the patch isn't a good idea; we don't want it to
> get applied directly to multiple places.
> 
> I'd included this patch in my series to add DT support into the pinctrl
> subsystem, and hence I believe it was planned to merge it into that
> tree. If it's needed elsewhere, I guess it should be put in a branch
> that can be merged into both the pinctrl tree and elsewhere.
> 
> Linus, Grant, Rob, can you co-ordinate this? If you want, I can create
> the branch and send a pull request to LinusW. I'm not sure which branch
> Jean-Christophe needs this in for his IRQ work.
today just this patch and the 3.4-rc2 for the irq

for pinctrl LinusW tree

Best Regards,
J.
