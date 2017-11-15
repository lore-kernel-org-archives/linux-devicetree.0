From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: usb: fix example hub node name
Date: Wed, 15 Nov 2017 09:44:56 -0600
Message-ID: <20171115154456.3dmx2o5b4r5uncdw@rob-hp-laptop>
References: <20171109170723.10960-1-johan@kernel.org>
 <20171109170723.10960-2-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171109170723.10960-2-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Alan Stern <stern@rowland.harvard.edu>, Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 09, 2017 at 06:07:16PM +0100, Johan Hovold wrote:
> According to the OF Recommended Practice for USB, hub nodes shall be
> named "hub", but the example had mixed up the label and node names. Fix
> the node name and drop the redundant label.
> 
> While at it, remove a newline and add a missing semicolon to the example
> source.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  Documentation/devicetree/bindings/usb/usb-device.txt | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
