From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 5/5] ARM: vexpress: DT-based support for CoreTiles
 Express A5x2 and A9x4
Date: Mon, 5 Dec 2011 17:37:09 +0000
Message-ID: <20111205173709.GA29812@localhost.localdomain>
References: <1322579473-8804-1-git-send-email-pawel.moll@arm.com>
 <1322579473-8804-6-git-send-email-pawel.moll@arm.com>
 <20111129164050.GC2829@localhost.localdomain>
 <1322678364.3180.34.camel@hornet.cambridge.arm.com>
 <20111201122144.GD2026@localhost.localdomain>
 <1323105880.3147.55.camel@hornet.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1323105880.3147.55.camel-okZbbLrgpR/YkXV2EHHjLW3o5bpOHsLO@public.gmane.org>
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

On Mon, Dec 05, 2011 at 05:24:40PM +0000, Pawel Moll wrote:
> On Thu, 2011-12-01 at 12:21 +0000, Dave Martin wrote:
> > That will work, but we should make it clear that this option does not
> > provide board support all by itself, maybe:
> > 
> > "Provides common dependencies for VE platforms based on Cortex-A5 or
> > Cortex-A9 processors.  In order to build a working kernel, you must also
> > enable one or more core tile support options."
> 
> Actually, the longer I think about it the more it seems that this code
> doesn't support a particular tile, but rather a particular processor...
> After all _exactly_ the same code will work with any SMM based on FPGA
> Logic Tile (V2F-2XV6), even if it was very different from the coretile,
> eg. A9 with RS1 memory map. In such case making it compatible with
> V2P-CA9 would be logically wrong...
> 
> I have an idea of spinning the compatible values again to get something
> like that:
> 
> compatible = "arm,vexpress-v2p-ca5s", "arm,vexpress-cortex_a5";
> compatible = "arm,vexpress-v2p-ca9", "arm,vexpress-cortex_a9";
> compatible = "arm,vexpress-v2p-ca15", "arm,vexpress-cortex_a15";

The trouble is, node { compatible = x } means "node is an x", not "node
has an x".

So, we should be careful do document what e.g. arm,vexpress-cortex_a5
actually means.  It doesn't mean Cortex-A5, but instead it represents
a whole jumble of characteristics which we expect to be common to all
vexpress-based A5 platforms.

It feels that in practice arm,vexpress-cortex_a5 actually means 
exactly the same thing as arm,vexpress-v2p-ca5s.  Are you sure these
two are really independent?  (In other words, do we expect multiple
different vexpress variants based on A5, and so on?)

Cheers
---Dave
