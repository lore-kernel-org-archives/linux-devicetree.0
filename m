From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 2/3] dtc: Support character literals in cell lists
Date: Mon, 19 Sep 2011 12:00:34 +1000
Message-ID: <20110919020034.GJ9025@yookeroo.fritz.box>
References: <1315595791-25793-1-git-send-email-robotboy@chromium.org>
	<1315595791-25793-3-git-send-email-robotboy@chromium.org>
	<20110912004437.GG9025@yookeroo.fritz.box>
	<E1R4y4v-0000Nf-5A@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1R4y4v-0000Nf-5A-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Sep 17, 2011 at 11:49:21AM -0500, Jon Loeliger wrote:
> > On Fri, Sep 09, 2011 at 12:16:30PM -0700, Anton Staaf wrote:
> > > With this patch the following property assignment:
> > > 
> > >     property = <0x12345678 'a' '\r' 100>;
> > > 
> > > is equivalent to:
> > > 
> > >     property = <0x12345678 0x00000061 0x0000000D 0x00000064>
> > > 
> > > Signed-off-by: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > 
> > Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> 
> So, I *think* we want to wait until the question of size
> is resolved some more, right?  Or, take this in any event
> as "without a type indicator they are all 32-bit values"?

No this patch is fine to take without changing the cell size
semantics.  It's just that it becomes a lot more useful when we do get
those.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
