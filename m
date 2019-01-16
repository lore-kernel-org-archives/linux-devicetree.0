From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: ci-hdrc-usb2: add property
 power-active-high
Date: Wed, 16 Jan 2019 13:51:08 -0600
Message-ID: <20190116195108.GA18240@bogus>
References: <20190116105103.28842-2-philipp.puschmann@emlix.com>
 <20190116111133.31326-1-philipp.puschmann@emlix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190116111133.31326-1-philipp.puschmann@emlix.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, Peter.Chen@nxp.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Philipp Puschmann <philipp.puschmann@emlix.com>
List-Id: devicetree@vger.kernel.org

On Wed, 16 Jan 2019 12:11:32 +0100, Philipp Puschmann wrote:
> The i.MX6q/dl USB controller may drive the usb power line directly, but the
> polarity depends on the board. Reset state of the polarity is low-active so
> add this property to allow it to be high-active.
> 
> Signed-off-by: Philipp Puschmann <philipp.puschmann@emlix.com>
> ---
> Changes in v3: add description
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
