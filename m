From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] powerpc/85xx:Enable USB2 controller node for P1020RDB
Date: Wed, 18 Jan 2012 08:26:15 -0600
Message-ID: <6C99EDF2-07C6-451D-9069-E41EA7B7324F@kernel.crashing.org>
References: <1326865839-3612-1-git-send-email-ramneek.mehresh@freescale.com>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1326865839-3612-1-git-send-email-ramneek.mehresh-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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


On Jan 17, 2012, at 11:50 PM, Ramneek Mehresh wrote:

> Enable USB2 controller node for P1020RDB. USB2 controller is used only
> when board boots from SPI or SD as it is muxed with eLBC
> 
> Signed-off-by: Ramneek Mehresh <ramneek.mehresh-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> Applies on git://git.kernel.org/pub/scm/linux/kernel/git/galak/powerpc.git
> (branch next)
> 
> arch/powerpc/boot/dts/p1020rdb.dtsi |   11 ++++-------
> 1 files changed, 4 insertions(+), 7 deletions(-)

applied to merge

- k
