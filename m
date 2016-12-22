From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 pci/next] PCI: rcar: Add compatible string for r8a7796
Date: Thu, 22 Dec 2016 15:18:08 -0600
Message-ID: <20161222211808.gn6z47ezhx2gapck@rob-hp-laptop>
References: <1482259026-7180-1-git-send-email-ykaneko0929@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1482259026-7180-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 21, 2016 at 03:37:06AM +0900, Yoshihiro Kaneko wrote:
> From: Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>
> 
> This patch adds support for r8a7796.
> 
> Signed-off-by: Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> 
> This patch is based on the next branch of the pci tree.
> 
> v2 [Yoshihiro Kaneko]
> * As suggested by Geert Uytterhoeven
>   Dropped the update of the driver.
> 
>  Documentation/devicetree/bindings/pci/rcar-pci.txt | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
