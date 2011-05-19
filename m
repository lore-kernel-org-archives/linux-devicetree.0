From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] powerpc/85xx:Create dts of each core in CAMP mode for
	P1020RDB
Date: Thu, 19 May 2011 01:33:06 -0500
Message-ID: <C0FC0AB9-E31C-4976-991E-80D3DBA40BDF@kernel.crashing.org>
References: <1303974000-2943-1-git-send-email-prabhakar@freescale.com>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1303974000-2943-1-git-send-email-prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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


On Apr 28, 2011, at 2:00 AM, Prabhakar Kushwaha wrote:

> Create the dts files for each core and splits the devices between the two cores
> for P1020RDB.
> 
> Core0 has core0 to have memory, l2, i2c, spi, gpio, tdm, dma, usb, eth1, eth2,
> sdhc, crypto, global-util, message, pci0, pci1, msi.
> Core1 has l2, eth0, crypto.
> 
> MPIC is shared between two cores but each core will protect its interrupts from
> other core by using "protected-sources" of mpic.
> 
> Fix compatible property for global-util node of P1020si.dtsi.
> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> Based upon git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git(branch master)
> 
> This patch depends on following patch
> 	"powerpc/85xx: P1020 DTS : re-organize dts files"
> 
> arch/powerpc/boot/dts/p1020rdb_camp_core0.dts |  213 +++++++++++++++++++++++++
> arch/powerpc/boot/dts/p1020rdb_camp_core1.dts |  148 +++++++++++++++++
> arch/powerpc/boot/dts/p1020si.dtsi            |    2 +-
> 3 files changed, 362 insertions(+), 1 deletions(-)
> create mode 100644 arch/powerpc/boot/dts/p1020rdb_camp_core0.dts
> create mode 100644 arch/powerpc/boot/dts/p1020rdb_camp_core1.dts

applied to next

- k
