From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/2] Character literal parsing
Date: Wed, 20 Jul 2011 23:42:38 +1000
Message-ID: <20110720134238.GK6399@yookeroo.fritz.box>
References: <1308871239-32683-1-git-send-email-robotboy@chromium.org>
	<8yawrgb3smr.fsf@huya.qualcomm.com>
	<BANLkTi=iUqMwag-A6t1ubDgSAN9xqWuTMwLG32EKKWuwVbigyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BANLkTi=iUqMwag-A6t1ubDgSAN9xqWuTMwLG32EKKWuwVbigyg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Staaf <robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 24, 2011 at 01:22:13PM -0700, Anton Staaf wrote:
> On Fri, Jun 24, 2011 at 1:02 PM, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> 
> >
> > Does this mean that the dtc inside the kernel is going to be the
> > required tool to use to build device trees?  This change doesn't change
> > the DTB format, so it's as much of a concern, but was wondering if we're
> > intending to keep things compatible.
> >
> 
> To be honest, I don't know enough to say either way.  I am using the
> character literals in a device tree that is used to configure a
> single firmware image for multiple boards.  That device tree is not
> currently passed on to the kernel.
> 
> Your question makes me think that there are two device tree compilers that I
> should be paying attention to, is that the case?  Or was it a more general
> comment about diverging from a historic syntax for device tree
> source files?

Oh, yes, forgot to mention that.

If you want to make extensions to dtc, you should do it to the
upstream dtc at git://git.jdl.com/software/dtc.git.  The in-kernel
version is just a irregularly updated snapshot of that one.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
