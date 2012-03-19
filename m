From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Don't use non-standard echo options for fdtget-runtest.sh
Date: Mon, 19 Mar 2012 14:26:46 +1100
Message-ID: <20120319032646.GB32554@truffala.fritz.box>
References: <1332122193-8323-1-git-send-email-david@gibson.dropbear.id.au>
 <CAPnjgZ3Lw=y2wmQ-D72+dqwHxB2fGA2ggcW4GNfrfMo16n9wSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ3Lw=y2wmQ-D72+dqwHxB2fGA2ggcW4GNfrfMo16n9wSA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Mar 18, 2012 at 07:26:58PM -0700, Simon Glass wrote:
> Hi John,
> =

> On Sun, Mar 18, 2012 at 6:56 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > fdtget-runtest.sh currently uses the "-e" option to echo, for interpret=
ing
> > string escapes. =A0But this option is only understood by some versions =
of
> > echo - the one in bash does, but the one in dash does not. =A0In fact s=
ince
> > I reworked the fdtget tests a while back, we no longer need the escape
> > expanding feature of echo here, so this patch simple removes the -e to
> > fix the problem (the testsuite now passes when /bin/sh is dash).
> >
> > Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> =

> This was put in for this test:
> =

>     # Test multiple arguments
>     run_fdtget_test "MyBoardName\nmemory" -ts $dtb / model /memory device=
_type
> =

> Without the -e the test fails for me... Do I need a later patch that
> has not been applied? I tried with de6b762.

Ah.  Looks like dash interprets the \n in the quoted string, rather
than in echo.  So with my patch it works with dash, but not bash.

Ignore that patch, I'll look for a way to work with both.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
