From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] powerpc/85xx:DTS: Fix PCIe IDSEL for Px020RDB
Date: Thu, 19 May 2011 01:16:28 -0500
Message-ID: <12CBD4BB-FC1B-4A44-91A2-B6E00AC251D8@kernel.crashing.org>
References: <1303272764-15333-1-git-send-email-prabhakar@freescale.com>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1303272764-15333-1-git-send-email-prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Prabhakar Kushwaha <prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: meet2prabhu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Apr 19, 2011, at 11:12 PM, Prabhakar Kushwaha wrote:

> PCIe device in legacy mode can trigger interrupts using the wires #INTA, #INTB
> ,#INTC and #INTD. PCI devices are obligated to use #INTx for interrupts under
> legacy mode.  Each PCI slot or device is typically wired to different inputs on
> the interrupt controller. 
> 
> So, Define interrupt-map and interrupt-map-mask properties for device tree to
> of map each PCI interrupt signal to the inputs of the interrupt controller.
> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> Based upon git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git(branch master)
> 
> This patch has depedency on following 2 patches
> 	-- powerpc/85xx: P2020 DTS: re-organize dts files
> 	-- powerpc/85xx: P1020 DTS : re-organize dts files
> 
> arch/powerpc/boot/dts/p1020rdb.dts            |   16 ++++++++++++++++
> arch/powerpc/boot/dts/p2020rdb.dts            |   16 ++++++++++++++++
> arch/powerpc/boot/dts/p2020rdb_camp_core0.dts |    8 ++++++++
> arch/powerpc/boot/dts/p2020rdb_camp_core1.dts |    8 ++++++++
> 4 files changed, 48 insertions(+), 0 deletions(-)

applied to next

- k
