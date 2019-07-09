From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 5/6] dt-bindings: usb: bdc: Update compatible strings
Date: Tue, 9 Jul 2019 14:14:35 -0600
Message-ID: <20190709201435.GA18881@bogus>
References: <1561064991-16874-1-git-send-email-alcooperx@gmail.com>
 <1561064991-16874-6-git-send-email-alcooperx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1561064991-16874-6-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Al Cooper <alcooperx@gmail.com>, devicetree@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, 20 Jun 2019 17:09:50 -0400, Al Cooper wrote:
> Remove "brcm,bdc-v0.16" because it was never used on any system.
> Add "brcm,bdc-udc-v3.1" which exists for any STB system with BDC.
> 
> Signed-off-by: Al Cooper <alcooperx@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/brcm,bdc.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
