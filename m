From: Rob Herring <robh@kernel.org>
Subject: Re: [RESEND PATCH v3 6/7] DT bindings documentation for Broadcom
 IPROC USB Device controller.
Date: Mon, 3 Apr 2017 11:47:56 -0500
Message-ID: <20170403164756.t5u4chllkuuuntb6@rob-hp-laptop>
References: <1490965753-3511-1-git-send-email-raviteja.garimella@broadcom.com>
 <1490965753-3511-6-git-send-email-raviteja.garimella@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1490965753-3511-6-git-send-email-raviteja.garimella@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Raviteja Garimella <raviteja.garimella@broadcom.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 31, 2017 at 06:39:12PM +0530, Raviteja Garimella wrote:
> The device node is used for UDCs integrated into Broadcom's
> iProc family of SoCs'. The UDC is based on Synopsys Designware
> Cores AHB Subsystem USB Device Controller IP.
> 
> Signed-off-by: Raviteja Garimella <raviteja.garimella@broadcom.com>
> ---
>  Documentation/devicetree/bindings/usb/iproc-udc.txt | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/iproc-udc.txt

Acked-by: Rob Herring <robh@kernel.org> 
