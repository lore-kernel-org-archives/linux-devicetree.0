From: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 9/9 V3] Test constant expressions in cell contexts.
Date: Tue, 30 Sep 2008 10:46:48 -0500
Message-ID: <1222789608.8736.8.camel@ld0161-tx32>
References: <1222460748-20127-1-git-send-email-jdl@jdl.com>
	<1222460748-20127-2-git-send-email-jdl@jdl.com>
	<1222460748-20127-3-git-send-email-jdl@jdl.com>
	<1222460748-20127-4-git-send-email-jdl@jdl.com>
	<1222460748-20127-5-git-send-email-jdl@jdl.com>
	<1222460748-20127-6-git-send-email-jdl@jdl.com>
	<1222460748-20127-7-git-send-email-jdl@jdl.com>
	<1222460748-20127-8-git-send-email-jdl@jdl.com>
	<1222460748-20127-9-git-send-email-jdl@jdl.com>
	<1222460748-20127-10-git-send-email-jdl@jdl.com>
	<20080930060418.GD18695@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20080930060418.GD18695-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2008-09-30 at 16:04 +1000, David Gibson wrote:
> On Fri, Sep 26, 2008 at 03:25:48PM -0500, Jon Loeliger wrote:
> > From: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > 
> > This code is derived from code posted by David Gibson.
> 
> [snip]
> > +		for (i = 0; i < ARRAY_SIZE(expr_table); i++)
> > +			if (fdt32_to_cpu(res[i]) != expr_table[i].result)
> 
> Hrm.. when you fixed the endian bug here (I found it myself the other
> day), you might have thought to fix it...
> 
> 
> > +				FAIL("Incorrect result for expression \"%s\","
> > +				     " 0x%x instead of 0x%x\n",
> > +				     expr_table[i].expr, res[i],
>                                                          ^^^^^^
> 
> ...here, too.


Gah.  Sorry.  I'll definitely pick that up.

jdl
