From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 0/3] Add device tree based initialisation for VIC
Date: Mon, 25 Jul 2011 13:54:23 -0600
Message-ID: <20110725195423.GA26735@ponder.secretlab.ca>
References: <1311610200-12408-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1311610200-12408-1-git-send-email-jamie@jamieiles.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jamie Iles <jamie@jamieiles.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 25, 2011 at 05:09:57PM +0100, Jamie Iles wrote:
> This series aims to allow VIC devices to be probed from the device tree.
> Currently the only in-tree device tree enabled user of the VIC is versatile,
> but I'll shortly submit patches for picoxcell on device tree that uses 2
> VIC's.
> 
> I've split this into 3 patches for bisectability, but this could be fairly
> squashed into 2.

I always prefer fewer patches.  Which 2 patches would you squash
together?  :-)

> 
> Jamie Iles (3):
>   vic: add device tree bindings
>   versatile dt: set the irq-start property for the vic
>   versatile: convert to common VIC DT probing
> 
>  Documentation/devicetree/bindings/arm/vic.txt |   21 +++++++++++++++
>  arch/arm/boot/dts/versatile-ab.dts            |    1 +
>  arch/arm/common/vic.c                         |   35 +++++++++++++++++++++++++
>  arch/arm/include/asm/hardware/vic.h           |    5 +++
>  arch/arm/mach-versatile/core.c                |    9 +-----
>  5 files changed, 63 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/vic.txt
> 
> -- 
> 1.7.4.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
