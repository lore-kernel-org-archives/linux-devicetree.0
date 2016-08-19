From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] Documentation: dt: dwc3: note the supported phy-names
Date: Fri, 19 Aug 2016 08:52:28 -0500
Message-ID: <20160819135228.GA6077@rob-hp-laptop>
References: <1471556236-3803-1-git-send-email-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1471556236-3803-1-git-send-email-briannorris@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <briannorris@chromium.org>
Cc: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 18, 2016 at 02:37:16PM -0700, Brian Norris wrote:
> The dwc3 driver expicitly looks for "usb2-phy" or "usb3-phy", but we
> never noted these names in the documentation.
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
