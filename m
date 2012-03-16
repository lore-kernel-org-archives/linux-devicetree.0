From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] powerpc/85xx:Add usb controller version info
Date: Fri, 16 Mar 2012 10:06:56 -0500
Message-ID: <AB89D415-45D5-42A5-B145-83BFA80694DB@kernel.crashing.org>
References: <1326865248-3333-1-git-send-email-ramneek.mehresh@freescale.com>
Mime-Version: 1.0 (Apple Message framework v1257)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1326865248-3333-1-git-send-email-ramneek.mehresh-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Ramneek Mehresh <ramneek.mehresh-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Jan 17, 2012, at 11:40 PM, Ramneek Mehresh wrote:

> Add usb controller version info for the following:
> MPC8536, P1010, P1020, P1021, P1022, P1023, P2020, P2041,
> P3041, P3060, P5020
> 
> Signed-off-by: Ramneek Mehresh <ramneek.mehresh-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> Applies on git://git.kernel.org/pub/scm/linux/kernel/git/galak/powerpc.git
> (branch next)
> 
> arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi |    4 ++--
> arch/powerpc/boot/dts/fsl/p1010si-post.dtsi   |    3 +++
> arch/powerpc/boot/dts/fsl/p1020si-post.dtsi   |    6 ++++++
> arch/powerpc/boot/dts/fsl/p1021si-post.dtsi   |    3 +++
> arch/powerpc/boot/dts/fsl/p1022si-post.dtsi   |    6 ++++++
> arch/powerpc/boot/dts/fsl/p1023si-post.dtsi   |    3 +++
> arch/powerpc/boot/dts/fsl/p2020si-post.dtsi   |    3 +++
> arch/powerpc/boot/dts/fsl/p2041si-post.dtsi   |    2 ++
> arch/powerpc/boot/dts/fsl/p3041si-post.dtsi   |    2 ++
> arch/powerpc/boot/dts/fsl/p3060si-post.dtsi   |    6 ++++++
> arch/powerpc/boot/dts/fsl/p5020si-post.dtsi   |    2 ++
> 11 files changed, 38 insertions(+), 2 deletions(-)

applied

- k
