From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: ci-hdrc-usb2:
 s/gadget-itc-setting/itc-setting in example
Date: Sun, 19 Jun 2016 09:54:56 -0500
Message-ID: <20160619145456.GA24770@rob-hp-laptop>
References: <1466064798-867-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466064798-867-1-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>
Cc: mark.rutland@arm.com, peter.chen@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 16, 2016 at 04:13:18PM +0800, Jisheng Zhang wrote:
> What the code expect is "itc-setting" rather than "gadget-itc-setting",
> and this is also correctly described in the optional properties.
> 
> Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
