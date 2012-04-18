From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH V5 0/4] ARM: Kirkwood: Add support for DNS-320 and
 DNS-325 using devicetree
Date: Wed, 18 Apr 2012 10:04:40 -0400
Message-ID: <20120418140440.GL15711@titan.lakedaemon.net>
References: <1334743603-8488-1-git-send-email-jm@lentin.co.uk>
 <20120418131635.GK15711@titan.lakedaemon.net>
 <20120418132445.GB25584@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120418132445.GB25584-g2DYL2Zd6BY@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 18, 2012 at 03:24:45PM +0200, Andrew Lunn wrote:
> > > dies at "Gating clock of unused units", presumably as CGC_RUNIT isn't set.
> > > Is this something known or is it worth further investigation?
> > 
> > That could potentially mess up a future bisect.  However, it would only
> > crop up for dnskw boards.  I'll let Grant weigh in on this since he's
> > the one who asked that the nand init be removed.
> 
> Turning off RUNIT is bad. Both the NAND and SPI controllers use this
> clock. You can only safely turn it off if none of these are active.

Jamie,

If we hear no objections, call kirkwood_nand_init() with no partition
entries, then put the partition entries in the commandline in the dts.
This is what Arnaud Patard is doing with the Iomega iConnect:

mtdparts=orion_nand:0xc0000@0x0(uboot),0x20000@0xa0000(env),0x300000@0x100000(zImage),0x300000@0x540000(initrd)...

Then, in the last patch remove the mtdparts from the commandline in the
dts and add the partition entries appropriately.

thx,

Jason.
