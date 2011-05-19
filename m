From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] powerpc/85xx: P2020 DTS: re-organize dts files
Date: Thu, 19 May 2011 01:16:22 -0500
Message-ID: <FF5F027D-35D2-4645-8D0E-DFF500AF8149@kernel.crashing.org>
References: <1302265625-10131-1-git-send-email-prabhakar@freescale.com>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1302265625-10131-1-git-send-email-prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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


On Apr 8, 2011, at 7:27 AM, Prabhakar Kushwaha wrote:

> Creates P2020si.dtsi, containing information for P2020 SoC. Modifies dts files
> for P2020 based systems to use dtsi file.
> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> Based upon git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git(branch master)
> 
> Please see mpc5200b.dtsi for reference.
> 
> Tested on P2020RDB and P2020DS
> 
> arch/powerpc/boot/dts/p2020ds.dts             |  374 ++----------------------
> arch/powerpc/boot/dts/p2020rdb.dts            |  362 ++---------------------
> arch/powerpc/boot/dts/p2020rdb_camp_core0.dts |  237 +++-------------
> arch/powerpc/boot/dts/p2020rdb_camp_core1.dts |  142 ++++++----
> arch/powerpc/boot/dts/p2020si.dtsi            |  382 +++++++++++++++++++++++++
> 5 files changed, 564 insertions(+), 933 deletions(-)
> create mode 100644 arch/powerpc/boot/dts/p2020si.dtsi

applied to next

- k
