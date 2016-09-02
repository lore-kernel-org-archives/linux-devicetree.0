From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 6/6] Documentation: devicetree: dwc2: Deprecate
 g-tx-fifo-size
Date: Fri, 2 Sep 2016 09:41:33 -0500
Message-ID: <20160902144133.GA6703@rob-hp-laptop>
References: <cover.1472502978.git.johnyoun@synopsys.com>
 <47342acebdbd240cb1f92b2da7c1055a06f440d6.1472502978.git.johnyoun@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <47342acebdbd240cb1f92b2da7c1055a06f440d6.1472502978.git.johnyoun@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Youn <johnyoun@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 29, 2016 at 01:39:03PM -0700, John Youn wrote:
> This property is not needed because the periodic fifos are not
> configurable. So it was incorrect to add this property in the first
> place.
> 
> Signed-off-by: John Youn <johnyoun@synopsys.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
