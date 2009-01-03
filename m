From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH v2] libfdt: Add version.lds file
Date: Sat, 03 Jan 2009 13:29:09 -0600
Message-ID: <E1LJCBJ-0006X5-W7@jdl.com>
References: <20090102131951.GA8954@zod.rchland.ibm.com>
	<495E71F9.9080809@genesi-usa.com> <E1LIqYa-0004cn-07@jdl.com>
	<495FB885.4050808@genesi-usa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-reply-to: <495FB885.4050808-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org> 
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

> > 
> > Well, I added that to the repo, oh, a few hours ago...
> > 
> >> Every time I try and clone anything I just get something approaching 
> >> what 1.2.0 was released as :(
> > 
> > What command(s) are you using?
> 
> git clone http://www.jdl.com/software/dtc.git .. in fact I'm not even 
> sure I'm using the right repo right now.

That should be fine.  Until just a few minutes ago,
the top of the tree was at:

    9878f30f311cb56d1ab1914670b38672476916ac

Which was on Nov 7.  Maybe 21 commits off of v1.2.0 or so.

So I pushed out the first two of Josh's three commits
and rebased the testing branch on top of that.
Add -f or + for the testing branch updates if desired.

HTH,
jdl
