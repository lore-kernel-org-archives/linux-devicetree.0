From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH] fdtget-runtest.sh: Fix failures when /bin/sh isn't bash
Date: Mon, 26 Mar 2012 08:11:35 -0500
Message-ID: <E1SC9hv-0007Gm-Py@jdl.com>
References: <1332296626-19707-1-git-send-email-swarren@wwwdotorg.org>
 <20120321032653.GB15997@truffala.fritz.box>
 <20120326022350.GA13005@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20120326022350.GA13005-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> On Wed, Mar 21, 2012 at 02:26:53PM +1100, David Gibson wrote:
> > On Tue, Mar 20, 2012 at 08:23:46PM -0600, Stephen Warren wrote:
> > > On Ubuntu, /bin/sh is dash (at least by default), and dash's echo doesn't
> > > accept the -e option. This means that fdtget-runtest.sh's EXPECT file will
> > > contain "-e foo" rather than just "foo", which causes a test failure.
> > > 
> > > To work around this, run /bin/echo instead of (builtin) echo, which has
> > > more chance of supporting the -e option.
> > > 
> > > Another possible fix is to change all the #! lines to /bin/bash rather
> > > than /bin/sh, and change run_tests.sh to invoke sub-scripts using $SHELL
> > > instead of just "sh". However, that would require bash specifically, which
> > > may not be desirable.
> > > 
> > > Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> > 
> > Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> > 
> > Jon, please apply.
> 
> Sorry Jon, you fell off the Cc list somehow.  Do you need me to resend
> Stephen's patch to apply?

Please.  Last mail I saw on this issue was you saying "This patch isn't perfect." :-)

jdl
