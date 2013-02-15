From: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] Added license header to dtc/libfdt/fdt.h and libfdt_env.h
Date: Thu, 14 Feb 2013 18:39:36 -0600
Message-ID: <20130214183936.e82dbf45c5708f8084de2d62@freescale.com>
References: <1360773121-25880-1-git-send-email-jsobota@ti.com>
 <20130213233255.GU4948@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130213233255.GU4948-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Justin Sobota <jsobota-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 14 Feb 2013 10:32:56 +1100
David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:

> On Wed, Feb 13, 2013 at 11:32:01AM -0500, Justin Sobota wrote:
> > This commit adds a license header to fdt.h and libfdt_env.h because
> > the license was omitted
> 
> So, having a quick look at the git blame for both these files, it
> looks like Kim Phillips (CCed) also touched them substantially.
> 
> Kim, did you want to supply an additional copyright line for these files?

sure, it'd be:

Copyright 2012 Kim Phillips, Freescale Semiconductor.

I can spin a patch on top of this one, or - wait...

> > Signed-off-by: Justin Sobota <jsobota-l0cyMroinI0@public.gmane.org>
> > ---
> >  libfdt/fdt.h        |   50 ++++++++++++++++++++++++++++++++++++++++++++++++++
> >  libfdt/libfdt_env.h |   50 ++++++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 100 insertions(+)
> >  mode change 100644 => 100755 libfdt/fdt.h
> >  mode change 100644 => 100755 libfdt/libfdt_env.h

...what's up with making them executable?

So I'm assuming this patch is going to be respun to not include the
mode changes, in which case please add the above copyright line
under David's.

Thanks,

Kim
