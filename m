From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3] Allow device tree to be modified by additonal
	device tree sections
Date: Fri, 26 Feb 2010 11:25:54 +1100
Message-ID: <20100226002554.GI31576@yookeroo>
References: <20100225165352.7745.68056.stgit@angua> <E1Nkhq1-0001Of-Hb@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1Nkhq1-0001Of-Hb-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 25, 2010 at 11:49:25AM -0600, Jon Loeliger wrote:
> > This patch allows the following construct:
> > 
> > / {
> > 	property-a = "old";
> > 	property-b = "does not change";
> > };
> > 
> > / {
> > 	property-a = "changed";
> > 	property-c = "new";
> > 	node-a {
> > 	};
> > };
> > 
> > Where the later device tree overrides the properties found in the
> > earlier tree.  This is useful for laying down a template device tree
> > in an include file and modifying it for a specific board without having
> > to clone the entire tree.
> > 
> > Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> 
> Applied.

Oops, I was hoping to make a few tweaks to that before it was
applied.  Oh well, it was basically only more thorough testcases, so
that can be added later.

Sorry Grant, my work on this stuff has been rather delayed by
yak-shaving.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
