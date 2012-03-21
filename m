From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdtget-runtest.sh: Fix failures when /bin/sh isn't bash
Date: Wed, 21 Mar 2012 14:26:53 +1100
Message-ID: <20120321032653.GB15997@truffala.fritz.box>
References: <1332296626-19707-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1332296626-19707-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 20, 2012 at 08:23:46PM -0600, Stephen Warren wrote:
> On Ubuntu, /bin/sh is dash (at least by default), and dash's echo doesn't
> accept the -e option. This means that fdtget-runtest.sh's EXPECT file will
> contain "-e foo" rather than just "foo", which causes a test failure.
> 
> To work around this, run /bin/echo instead of (builtin) echo, which has
> more chance of supporting the -e option.
> 
> Another possible fix is to change all the #! lines to /bin/bash rather
> than /bin/sh, and change run_tests.sh to invoke sub-scripts using $SHELL
> instead of just "sh". However, that would require bash specifically, which
> may not be desirable.
> 
> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>

Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Jon, please apply.

I don't think this fix is perfect - for example, I wonder what will
happen if /bin/echo is actually a busybox instance.  But it's
definitely better than right now, where the testsuite will give
failures out of the box on the default setup for several major
distros.

And as Stephen suggests, I would prefer not to make the test scripts
bash specific.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
