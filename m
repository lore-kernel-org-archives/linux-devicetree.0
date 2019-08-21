From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: usb-xhci: Add platform specific
 compatible for Stingray xHCI
Date: Wed, 21 Aug 2019 13:22:39 -0500
Message-ID: <20190821182239.GA5760@bogus>
References: <1564568395-9980-1-git-send-email-srinath.mannam@broadcom.com>
 <1564568395-9980-5-git-send-email-srinath.mannam@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1564568395-9980-5-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Srinath Mannam <srinath.mannam@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Wed, 31 Jul 2019 15:49:54 +0530, Srinath Mannam wrote:
> Add Platform specific compatible, because xHCI of this SoC has an issue
> with HS port which has to reset on disconnect event.
> 
> Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
