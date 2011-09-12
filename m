From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Appended devicetree with Torvalds' HEAD
Date: Mon, 12 Sep 2011 12:15:51 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1109121159270.20358@xanadu.home>
References: <CACRpkdb1iD2RkpmMkN1d5VNVr-M3KgrkE7Xg-Bxcr-xd2fcuPw@mail.gmail.com>
	<alpine.LFD.2.00.1109061347410.20358@xanadu.home>
	<CACRpkdaVL5L2-DR8gshN9b0sOn5rDY5QyP4fwZggXjFPmFr9-g@mail.gmail.com>
	<alpine.LFD.2.00.1109120922140.20358@xanadu.home>
	<20110912155414.GA28954@glitch.intra.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110912155414.GA28954-DoxiOL6zdryAm1IiwMqfSqzUEOm+Xw19@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 12 Sep 2011, Domenico Andreoli wrote:

> On Mon, Sep 12, 2011 at 09:25:26AM -0400, Nicolas Pitre wrote:
> > On Mon, 12 Sep 2011, Linus Walleij wrote:
> > 
> > > So it appears that the appended device tree does not
> > > show up.
> > > 
> > > I don't quite know how to debug this further...
> > 
> > I'm in the process of refreshing those patches, bringing them forward 
> > and cleaning up the parts that I dislike in the process.  I will 
> > certainly look at your failure case.
> > 
> > > Given that the appended approach is generally
> > > frowned upon maybe we are better off trying to fix
> > > our U-Boot, getting a combo that is known to work
> > > with device tree, than trying to get appended device
> > > trees to work?
> > 
> > It still has to minimally work as some bootloaders out there simply 
> > can't be updated at all.
> 
> Appending dtb to the kernel image solves the case of those boot loaders
> that cannot be updated but also reduces the genericity of the so built
> kernel because you then need a kernel+dtb bundle for each affected
> bootloader+board combination.
> 
> Couldn't this drawback be mitigated allowing the append of multiple dtbs?
> Kernel would not be truly generic but surely more than kernel+single dtb.

No.  A line must be drawn somewhere and as I said I don't want this 
feature to become more handy than it strictly has to be.  If you care so 
deeply about 1) device tree and 2) having a generic kernel supporting 
multiple targets, then you should really think about updating your 
bootloader. Otherwise you should simply make the DTB concatenation at 
the very last minute before storing the result onto your boot medium and 
distribute the kernel and the various DTBs separately otherwise.


Nicolas
