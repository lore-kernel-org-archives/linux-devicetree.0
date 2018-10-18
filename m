From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/6] dt-bindings: Add Broadcom STB OHCI, EHCI and XHCI
 binding document
Date: Thu, 18 Oct 2018 15:38:08 -0500
Message-ID: <20181018203808.GA25281@bogus>
References: <1539815349-24126-1-git-send-email-alcooperx@gmail.com>
 <1539815349-24126-2-git-send-email-alcooperx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1539815349-24126-2-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Al Cooper <alcooperx@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Jianguo Sun <sunjianguo1@huawei.com>, Johan Hovold <johan@kernel.org>, Kees Cook <kees>
List-Id: devicetree@vger.kernel.org

On Wed, 17 Oct 2018 18:29:04 -0400, Al Cooper wrote:
> Add DT bindings document for Broadcom STB USB OHCI, EHCI and
> XHCI drivers.
> 
> Signed-off-by: Al Cooper <alcooperx@gmail.com>
> ---
>  .../devicetree/bindings/usb/brcm,bcm7445-ehci.txt  | 22 +++++++++++++++++++++
>  .../devicetree/bindings/usb/brcm,bcm7445-ohci.txt  | 22 +++++++++++++++++++++
>  .../devicetree/bindings/usb/brcm,bcm7445-xhci.txt  | 23 ++++++++++++++++++++++
>  3 files changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/brcm,bcm7445-ohci.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/brcm,bcm7445-xhci.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
