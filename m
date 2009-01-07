From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [2/2] dtc: Move some functions to util.[ch]
Date: Wed, 07 Jan 2009 09:53:28 -0600
Message-ID: <E1LKaim-0005Nb-2K@jdl.com>
References: <20090105014436.GC11210@yookeroo.seuss>
	<20090105014745.GE11210@yookeroo.seuss>
	<20090105015023.GF11210@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-reply-to: <20090105015023.GF11210-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org> 
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
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Now that we have a util.[ch] file shared between dtc and
> convert-dtsv0, move some functions which are currently duplicated in
> the two to util files.  Specifically we move the die(), xmalloc() and
> xrealloc() functions.
> 
> While we're at it, add standard double-include protection to util.h
> 
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

I would have sworn I applied this one earlier...
But now it definitely has been.

Thanks,
jdl
