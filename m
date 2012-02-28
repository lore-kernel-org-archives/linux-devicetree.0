From: Ian Campbell <ijc@hellion.org.uk>
Subject: Re: [PATCH 0/2 v5] arm: kirkwood: add dreamplug/devicetree support
Date: Tue, 28 Feb 2012 07:20:49 +0000
Message-ID: <1330413649.10008.50.camel@dagon.hellion.org.uk>
References: <cover.1312906908.git.jason@lakedaemon.net>
 <cover.1330025976.git.jason@lakedaemon.net>
 <1330254038.10008.24.camel@dagon.hellion.org.uk>
 <20120227145724.GU23524@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120227145724.GU23524@titan.lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason <jason@lakedaemon.net>
Cc: grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

On Mon, 2012-02-27 at 09:57 -0500, Jason wrote:
> On Sun, Feb 26, 2012 at 11:00:38AM +0000, Ian Campbell wrote:
> > On Thu, 2012-02-23 at 19:52 +0000, Jason Cooper wrote:
> > > This patch series provides initial support for devicetree on kirkwood for the
> > > dreamplug platform.  After discussing the approach with Arnd Bergman last week
> > > at ELC, we decided to take an incremental approach to the conversion.  First, I
> > > would detect that we were on the dreamplug via the devicetree blob.  Then,
> > > configure uart0 via devicetree.  We chose the uart since it is already well
> > > supported under devicetree.
> > > 
> > > This patch series has been boot-tested on the dreamplug.
> > 
> > Tested-by: Ian Campbell <ijc@hellion.org.uk>
> 
> thanks!
> 
> > I needed the following (obvious) patch against u-boot:
> 
> yes, I forgot to mention that.  By any chance, have you tested booting
> non-fdt kernels from u-boot with this option enabled?  I'm fairly sure
> it will work, but I haven't tested it myself.

I hadn't but I have now, it worked fine booting my existing kernel
(which uses v3 of your previous non-FDT dreamplug patches) with the
updated u-boot.

> If you can boot both fdt and non-fdt kernels with this enabled, submit
> it to u-boot, CC: Prafulla, and I'll ack it.

Done.

Thanks,
Ian.
