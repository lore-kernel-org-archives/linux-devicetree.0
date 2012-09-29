From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/1] Fix segfault in DTC
Date: Sun, 30 Sep 2012 09:53:42 +1000
Message-ID: <20120929235342.GA23078@truffula.fritz.box>
References: <1348526885-2113-1-git-send-email-mmayer@broadcom.com>
 <1348595889-6495-1-git-send-email-mmayer@broadcom.com>
 <1348595889-6495-2-git-send-email-mmayer@broadcom.com>
 <20120925233054.GL9800@truffula.fritz.box>
 <50624393.30607@broadcom.com>
 <20120926003508.GB31993@truffula.fritz.box>
 <50632F78.4030709@broadcom.com> <5065D9C7.40906@wwwdotorg.org>
 <E1THfgr-0006Fg-KT@jdl.com> <5065F4FD.4010807@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5065F4FD.4010807-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 28, 2012 at 01:05:33PM -0600, Stephen Warren wrote:
> On 09/28/2012 12:53 PM, Jon Loeliger wrote:
> >>>
> >>> Yeah, seems like the kernel DTC is quite old.
> >>
> >> FYI, I'm working on a patch to the kernel to bring in the latest dtc.
> > 
> > Awesome.  Thank you.
> > 
> >> I've run a regression test vs. the old dtc in the kernel ...
> > 
> > Which is the icky step.  Again, thank you.
> > 
> >> ... and found that
> >> some of the PowerPC .dts files don't compile with the new dtc (but did
> >> with the old), all due to non-existent labels/paths being referenced.
> >> I'll try and track down whether this is a regression in dtc, or simply
> >> buggy .dts files that weren't noticed before.
> > 
> > I think you should just smack the PowerPC guys. :-)
> 
> For the record in this thread, it was a regression I introduced into dtc
> - the patch I just sent was for this.

I would be nice to add a testcase for this regression into dtc.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
