From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/4] fdtget: Add -p to list the properties of a node
Date: Thu, 8 Mar 2012 12:31:00 +1100
Message-ID: <20120308013100.GD10735@truffala.fritz.box>
References: <1330737130-29600-1-git-send-email-sjg@chromium.org>
 <1330737130-29600-2-git-send-email-sjg@chromium.org>
 <E1S5MWl-000880-59@jdl.com>
 <20120307233853.GN1929@truffala.fritz.box>
 <E1S5S6J-0001jL-27@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1S5S6J-0001jL-27-CYoMK+44s/E@public.gmane.org>
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
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 07, 2012 at 07:25:03PM -0600, Jon Loeliger wrote:
> > On Wed, Mar 07, 2012 at 01:27:59PM -0600, Jon Loeliger wrote:
> > > > This option lists the properties of each node given as a parameter, one
> > > > property per line.
> > > > 
> > > > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > 
> > > Applied.
> > 
> > But not pushed out by the looks of it?
> 
> I thought it was....
> 
> $ git log --oneline | head -6
> 7fcbef2 fdtget: Add -d to provide a default value
> 16c99ee fdtget: Add -l to list the subnodes of a node
> 30eb201 fdtget: Add -p to list the properties of a node
> 097ec97 fdtget: Fix multiple arg bug and add test for it
> a6e6c60 dtc: Fix zero-length input segfault
> e280442 Fix uninitialized access bug in utilfdt_decode_type

Duh, sorry.  Forgetting the differences between fetches and pulls.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
