From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [RFC 12/13] ARM: dts: ti: add dra71-evm FIT description file
Date: Tue, 29 May 2018 18:33:14 +0100
Message-ID: <20180529173314.GN17671@n2100.armlinux.org.uk>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
 <1523956215-28154-13-git-send-email-t-kristo@ti.com>
 <20180417092924.GB20335@flint.armlinux.org.uk>
 <ad5ef67d-d566-0034-a7cd-09a549cbd6d7@ti.com>
 <20180417144913.GD5669@atomide.com>
 <43ff3894-a287-1558-687c-40f50712735c@ti.com>
 <20180522200100.GA23937@rob-hp-laptop>
 <16a6017f-96c8-42d8-38bc-5cdd36d6793f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <16a6017f-96c8-42d8-38bc-5cdd36d6793f@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: mark.rutland@arm.com, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>, trini@konsulko.com, wmills@ti.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 29, 2018 at 10:05:37AM -0700, Frank Rowand wrote:
> On 05/22/18 13:01, Rob Herring wrote:
> > I'll tell you up front, I'm not a fan of FIT image (nor uImage, 
> > Android boot image, $bootloader image). If you want a collection of 
> > files and some configuration data, use a filesystem and a text file.

Me neither.

> My gut feel is that using a filesystem and a text file is the easier way
> to create the boot info.  But that also makes applying the overlay(s)
> during early Linux boot (at the point of FDT unflattening) impractical
> (can't access the file system without a driver, the driver depends on
> the devicetree, the devicetree depends upon the overlay).

Why do you want to apply overlays during the kernel boot?  The boot
loader should be providing the kernel with the merged DT to describe
the system that the kernel is running on - it's not the kernel's
job to put that together.

The whole point of DT is to make the kernel _less_ tied to the hardware
and more generic.  If we're going to introduce an entirely new set of
drivers into the kernel to "probe" the hardware to determine which
overlays are required, then that's really defeating the purpose of DT.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
