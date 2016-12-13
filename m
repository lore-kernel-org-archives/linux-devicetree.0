From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] PCI: rockchip: Add quirk to disable RC's ASPM L0s
Date: Tue, 13 Dec 2016 13:41:15 -0600
Message-ID: <20161213194115.tqacbotxgsvphoje@rob-hp-laptop>
References: <1481543487-33152-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1481543487-33152-1-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 12, 2016 at 07:51:27PM +0800, Shawn Lin wrote:
> Rockchip's RC outputs 100MHz reference clock but there are
> two methods for PHY to generate it.
> 
> (1)One of them is to use system PLL to generate 100MHz clock and
> the PHY will relock it and filter signal noise then outputs the
> reference clock.
> 
> (2)Another way is to share Soc's 24MHZ crystal oscillator with
> PHY and force PHY's DLL to generate 100MHz internally.
> 
> When using case(2), the exit from L0s doesn't work fine occasionally
> due to the broken design of RC receiver's logical circuit. So even if
> we use extended-synch, it still fails for PHY to relock the bits from
> FTS sometimes. This will hang the system.
> 
> Maybe we could argue that why not use case(1) to avoid it? The reason
> is that as we could see the reference clock is derived from system PLL
> and the path from it to PHY isn't so clean which means there are some
> noise introduced by power-domain and other buses can't be filterd out
> by PHY and we could see noise from the frequency spectrum by
> oscilloscope. This makes the TX compatibility test a little difficult
> to pass the spec. So case(1) and case(2) are both used indeed now. If
> using case(2), we should disable RC's L0s support, and that is why we
> need this property to indicate this quirk.
> 
> Also after checking quirk.c, I noticed there is already a quirk for
> disabling L0s unconditionally, quirk_disable_aspm_l0s. But obviously we
> shouldn't do that as mentioned above that case(1) could still works fine
> with L0s.
> 
> Reported-by: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Cc: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> ---
> 
> Changes in v2:
> - drop the quirk prefix
> 
>  Documentation/devicetree/bindings/pci/rockchip-pcie.txt | 2 ++
>  drivers/pci/host/pcie-rockchip.c                        | 9 +++++++++
>  2 files changed, 11 insertions(+)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
