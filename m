From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4 1/5] dt-bindings: Add Broadcom STB USB support
Date: Mon, 26 Nov 2018 15:57:18 -0600
Message-ID: <20181126215718.GA22870@bogus>
References: <1541772120-40394-1-git-send-email-alcooperx@gmail.com>
 <1541772120-40394-2-git-send-email-alcooperx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1541772120-40394-2-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Al Cooper <alcooperx@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri,  9 Nov 2018 09:01:56 -0500, Al Cooper wrote:
> Add DT bindings for Broadcom STB USB EHCI and XHCI drivers.
> Add "phy-supplies-usb-clock" property description to usb-hcd.txt
> 
> NOTE: The OHCI driver is not included because it uses the generic
>       platform driver.
> 
> Signed-off-by: Al Cooper <alcooperx@gmail.com>
> ---
>  .../devicetree/bindings/usb/brcm,bcm7445-ehci.txt  | 24 ++++++++++++++++++++++
>  Documentation/devicetree/bindings/usb/usb-hcd.txt  |  3 +++
>  Documentation/devicetree/bindings/usb/usb-xhci.txt |  1 +
>  3 files changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
