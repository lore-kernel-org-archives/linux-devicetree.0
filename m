From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 3/5] ARM: vexpress: Add DT support in v2m
Date: Fri, 18 Nov 2011 17:49:34 +0000
Message-ID: <20111118174934.GH9581@n2100.arm.linux.org.uk>
References: <1321036026-23411-1-git-send-email-pawel.moll@arm.com>
 <1321036026-23411-4-git-send-email-pawel.moll@arm.com>
 <20111116154402.GE2073@localhost.localdomain> <4EC3E446.4030608@gmail.com>
 <1321461458.3137.374.camel@hornet.cambridge.arm.com>
 <4EC3EBEC.3020601@gmail.com>
 <1321463271.3137.380.camel@hornet.cambridge.arm.com>
 <20111117155334.GT9581@n2100.arm.linux.org.uk>
 <1321618849.24216.323.camel@hornet.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1321618849.24216.323.camel-okZbbLrgpR/YkXV2EHHjLW3o5bpOHsLO@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 18, 2011 at 12:20:49PM +0000, Pawel Moll wrote:
> On Thu, 2011-11-17 at 15:53 +0000, Russell King - ARM Linux wrote:
> > Again, this is _not_ how DT is supposed to work.  DT is about describing
> > the hardware, not describing the state of something.  
> 
> And that's exactly what I was trying to do. Describe the hardware, using
> terminology *used by the hardware designers* - fact that you have chosen
> to ignore, fair enough.

Again, you're totally FAILING to get the point.

Had DT support been created before the new version came out there would
be no 'legacy' in terminology what so ever.  _That's_ the whole point.

What you're using is *todays* terminology, not the terminology used at
the point of *creation*.

Why can't you get it through your thick skull that at some day, the
entire Cortex-A5 series of CPUs is going to be called 'legacy'.  And
at that point, will you be wanting to rename all the properties because
of that change?  No.  That's insane.  So why the fuck do it now to the
CA9x5?

Try thinking.  It's good for the mind.
