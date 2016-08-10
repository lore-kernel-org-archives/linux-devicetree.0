From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RESEND v2 0/8] Cache-coherent DMA access using UIO
Date: Wed, 10 Aug 2016 17:55:41 +0200
Message-ID: <1983237.mRdWv2BGBr@wuerfel>
References: <1470635557-13416-1-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1470635557-13416-1-git-send-email-anup.patel@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Anup Patel <anup.patel@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>, Ankit Jindal <thatsjindal@gmail.com>, Jan Viktorin <viktorin@rehivetech.com>
List-Id: devicetree@vger.kernel.org

On Monday, August 8, 2016 11:22:29 AM CEST Anup Patel wrote:
> The goal of this patchset is to improve UIO framework and UIO dmem
> driver to allow cache-coherent DMA accesses from user-space.
> 
> This patchset is based on two previous patchsets:
> 1) [PATCH v5 0/6] UIO driver for APM X-Gene QMTM
> (Refer, http://www.spinics.net/lists/devicetree/msg58244.html)
> 2) [PATCH 0/4] Fix and extend uio_dmem_genirq
> (Refer, https://lkml.org/lkml/2016/5/17/141)
> 
> We have adopted only patch0-3 of patchset1 which was abandoned
> long time back. We have taken care of last few unaddressed comments
> on these patches.
> 
> The patchset2 is quite recent has been adopted entirely. We have
> taken care review comments on these patches too.
> 
> This patchset is based on v4.7-rc7 tag and it is available in uio-v2
> branch of https://github.com/Broadcom/arm64-linux.git


UIO devices are generally meant to be things that do not
perform DMA and that don't screw up the rest of the system
when misused. A device that is able to access any physical
memory doesn't belong into this category. The way that
uio_dmem_genirq.c gets around this is by requiring the device
to be created by some code that sets up a separate IOMMU
domain first, but the DT probing here doesn't do that.
Note that IOMMU domains typically use 32-bit addressing,
so the entire "dma_mask from property" dance isn't even
required.

Also, this seems to duplicate a lot of the work that
went into "vfio". Can you explain why we need another way
of doing the same thing here?

	Arnd
