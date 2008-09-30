From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 4/9 V3] Add header files for new Internal
	Representation form.
Date: Tue, 30 Sep 2008 16:03:00 +1000
Message-ID: <20080930060300.GC18695@yookeroo.seuss>
References: <1222460748-20127-1-git-send-email-jdl@jdl.com>
	<1222460748-20127-2-git-send-email-jdl@jdl.com>
	<1222460748-20127-3-git-send-email-jdl@jdl.com>
	<1222460748-20127-4-git-send-email-jdl@jdl.com>
	<1222460748-20127-5-git-send-email-jdl@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1222460748-20127-5-git-send-email-jdl-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 26, 2008 at 03:25:43PM -0500, Jon Loeliger wrote:
> Signed-off-by: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

I think patches 4, 5, 6 and 7 should be merged together.  Splitting
patches into logical sections is ok, but these are all basically
interdependent.  Sure, the ordering you have doesn't actually break
bisect, but the earlier patches don't *do* anything until the later
ones activate them, so there's really no point separating them out.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
