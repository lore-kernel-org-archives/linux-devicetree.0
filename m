From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb: add non-removable-ports hub
 property
Date: Wed, 27 Mar 2019 14:32:29 -0500
Message-ID: <20190327193229.GA13745@bogus>
References: <20190228184540.24570-1-mans@mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190228184540.24570-1-mans@mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mans Rullgard <mans@mansr.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 28 Feb 2019 18:45:39 +0000, Mans Rullgard wrote:
> Add a non-removable-ports property that lists the hardwired downstream
> ports of a hub.  Although hubs can provide this information, they are
> not always configured correctly.  An alternate means of indicating this
> for built-in USB devices is thus useful.
> 
> Signed-off-by: Mans Rullgard <mans@mansr.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-device.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
