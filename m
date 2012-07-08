From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH REPOST] Add test for re-defining an identical label
Date: Mon, 9 Jul 2012 09:42:19 +1000
Message-ID: <20120708234219.GD7749@truffala.fritz.box>
References: <1341346170-16312-1-git-send-email-swarren@wwwdotorg.org>
 <20120708125117.GA7749@truffala.fritz.box>
 <E1SnwSi-0008Eq-OH@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1SnwSi-0008Eq-OH-CYoMK+44s/E@public.gmane.org>
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
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 08, 2012 at 01:44:04PM -0500, Jon Loeliger wrote:
> > On Tue, Jul 03, 2012 at 02:09:30PM -0600, Stephen Warren wrote:
> > > From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > 
> > > When merging one device tree over the top of a previous tree, it is
> > > possible to define a duplicate label that has the same name and points
> > > to the same property or node. This is currently allowed by the duplicate
> > > label checking code. However, alternative duplicate label checking
> > > algorithms might not allow this. Add an explicit test to ensure this
> > > capability is maintained.
> > 
> > Sorry, I've been on leave and haven't really had brainspace to think
> > about this.  I think you're right though, whatever else we do with
> > stuff we do want to allow redefinition of labels as long as they
> > attach to the same thing (i.e. same path, and property within that
> > path when applicable).  Labels within property values do get curly if
> > that property is altered, but that doesn't directly affect this test.
> > 
> > > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> 
> Applied.

Hrm, apparently not pushed out, though.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
