From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Remove support for the legacy DTS source file format.
Date: Sat, 4 Oct 2008 14:39:26 +1000
Message-ID: <20081004043926.GJ30184@yookeroo.seuss>
References: <1223068629-6771-1-git-send-email-jdl@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1223068629-6771-1-git-send-email-jdl-CYoMK+44s/E@public.gmane.org>
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

On Fri, Oct 03, 2008 at 04:17:09PM -0500, Jon Loeliger wrote:
> Now that all in-kernel-tree DTS files are properly /dts-v1/,
> remove direct support for the older, un-numbered DTS
> source file format.
> 
> Convert existing tests to /dts-v1/ and remove support
> for the conversion tests themselves.
> 
> For now, though, the conversion tool still exists.
> 
> Signed-off-by: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> 
> I've decided to apply this patch.  It may not be popular,
> but we're going to move forward here.   Several folks at
> Freescale agree with me here.

As you no doubt expected, I'm not very happy with this.

Updating the test dts files to v1 certainly makes sense.  We probably
should have done that some time ago.  *Except* that you've converted
the *_dts0.dts files, which makes no sense since their only purpose
was to test the handling of dtsv0 files.  This is sloppy, if v0
support is removed from they should be deleted (along with the
corresponding pieces of run_tests.sh).

Removing the actual v0 support I think is premature, but I guess we
can agree to disagree on this point.

Removing the conversion tests worries me more, however, since I fear
that convert-dtsv0 will start bitrotting without testcases to keep it
in line.  If I get time I might see about a patch which restore at
least some of these tests in a way that doesn't require v0 support in
dtc itself (possibly including prebuilt dtbs for comparison).

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
