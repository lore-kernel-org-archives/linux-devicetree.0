From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 08/16] dt-bindings: Add bindings for phy-da8xx-usb
Date: Fri, 25 Mar 2016 10:04:31 -0500
Message-ID: <20160325150431.GA7194@rob-hp-laptop>
References: <1458863503-31121-1-git-send-email-david@lechnology.com>
 <1458863503-31121-9-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1458863503-31121-9-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: petr@barix.com, sergei.shtylyov@cogentembedded.com, David.Laight@ACULAB.COM, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>, Lee Jones <lee.jones@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 24, 2016 at 06:51:33PM -0500, David Lechner wrote:
> Device tree binding for new phy-da8xx-usb driver.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
> 
> v3 changes:
> 
> * added cfgchip info and example
> * correct usage of "DA8xx"
> * correct address after @
> * dropped 11 before @ in usb@
> 
> 
>  .../devicetree/bindings/phy/phy-da8xx-usb.txt      | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt

Acked-by: Rob Herring <robh@kernel.org>
