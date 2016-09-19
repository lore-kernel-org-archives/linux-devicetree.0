From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mwifiex: parse device tree node for PCIe
Date: Mon, 19 Sep 2016 16:27:53 -0500
Message-ID: <20160919212753.GA16598@rob-hp-laptop>
References: <1473434254-16782-1-git-send-email-akarwar@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1473434254-16782-1-git-send-email-akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cathy Luo <cluo-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei-Ning Huang <wnhuang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 09, 2016 at 08:47:34PM +0530, Amitkumar Karwar wrote:
> From: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> 
> This patch derives device tree node from pcie bus layer framework.
> Device tree bindings file has been renamed(marvell-sd8xxx.txt ->
> marvell-8xxx.txt) to accomodate PCIe changes.
> 
> Signed-off-by: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> ---
>  .../bindings/net/wireless/marvell-8xxx.txt         | 64 ++++++++++++++++++++++
>  .../bindings/net/wireless/marvell-sd8xxx.txt       | 63 ---------------------

Resend using -M option so I do have to figure out if you added 1 line or 
changed a bunch.

>  drivers/net/wireless/marvell/mwifiex/pcie.c        | 19 +++++++
>  drivers/net/wireless/marvell/mwifiex/sta_cmd.c     |  3 +-
>  4 files changed, 85 insertions(+), 64 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/marvell-8xxx.txt
>  delete mode 100644 Documentation/devicetree/bindings/net/wireless/marvell-sd8xxx.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/marvell-8xxx.txt b/Documentation/devicetree/bindings/net/wireless/marvell-8xxx.txt
> new file mode 100644
> index 0000000..a8a95aa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/marvell-8xxx.txt
> @@ -0,0 +1,64 @@
> +Marvell 8897/8997 (sd8897/sd8997/pcie8997) SDIO/PCIE devices
> +------
> +
> +This node provides properties for controlling the marvell sdio/pcie wireless device.
> +The node is expected to be specified as a child node to the SDIO/PCIE controller that
> +connects the device to the system.
> +
> +Required properties:
> +
> +  - compatible : should be one of the following:
> +	* "marvell,sd8897"
> +	* "marvell,sd8997"
> +	* "marvell,pcie8997"

PCIe uses vendor and product IDs for compatible strings. Please read the 
OF PCI bus bindings doc.

Rob
