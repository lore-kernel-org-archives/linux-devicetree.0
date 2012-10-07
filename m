From: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/6] ARM: Add support for Broadcom BCM476x SoCs
Date: Sun, 7 Oct 2012 12:14:18 +0200
Message-ID: <20121007101418.GA24323@glitch>
References: <20121007015300.828366635@gmail.com>
 <5071118A.6040508@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5071118A.6040508-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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

On Sat, Oct 06, 2012 at 11:22:18PM -0600, Stephen Warren wrote:
> On 10/06/2012 07:53 PM, Domenico Andreoli wrote:
> > 
> > Additional support is being worked on.... and usb (DWC OTG) only
> > attemped reusing s3c-hsotg.
> 
> Hmmm. I believe the bcm2835 uses DWC OTG. I wonder if the same driver
> will work there; USB in particular is a major pain point on the bcm2835...

I don't know any more how many versions of this driver are circulating,
we may have some options.

> > It's based on a random pre v3.7-rc1 commit (eb0ad9c) with mainlined
> > multi-platform support and Stephen's patch to add DEBUG_LL to it.
> 
> ...
> about uncompress.h now. Unless anyone really pipes up and says they'd
> still like me to pursue uncompress.h in multi-platform, I'm inclined to
> drop it.

I think it is valuable, multi-platform doesn't have any DEBUG_LL or
earlyprintk support and your patch solves the problem though it won't
work transparently on multiple boards at the same time, which is not
a requirement.

To my understanding Nico was complaining for the specific Tegra (and TI)
abuse, not the general approach.

> > Special thanks go to Stephen Warren who, with the recently mainlined
> > BCM2835, showed how to do things cleanly since the beginning and
> > involuntarily spurred me to act.
> 
> Thanks! Do note that much of the code I upstreamed was originally
> written by others, although I did make quite a few changes during
> upstream submission.

Yes, of course :)

Regards,
Domenico
