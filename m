From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] usb: of: add functions to bind a companion
 controller
Date: Mon, 27 Feb 2017 14:50:36 -0600
Message-ID: <20170227205036.afls2rlurynuqxfo@rob-hp-laptop>
References: <1487674788-12599-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1487674788-12599-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1487674788-12599-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: stern@rowland.harvard.edu, gregkh@linuxfoundation.org, mark.rutland@arm.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 21, 2017 at 07:59:47PM +0900, Yoshihiro Shimoda wrote:
> EHCI controllers will have a companion controller. However, on platform
> bus, there was difficult to bind them in previous code. So, this
> patch adds helper functions to bind them using a "companion" property.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/generic.txt |  1 +
>  drivers/usb/core/of.c                             | 23 +++++++++++++++++++++++
>  include/linux/usb/of.h                            |  5 +++++
>  3 files changed, 29 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
