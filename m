From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] usb: chipidea: fix mistake in device tree binding
 of nspire-usb to use vendor name 'lsi' instead of SoC name 'zevio'
Date: Wed, 4 Dec 2013 12:18:49 +0000
Message-ID: <20131204121849.GM16025@e106331-lin.cambridge.arm.com>
References: <1386148808-15065-1-git-send-email-dt.tangr@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1386148808-15065-1-git-send-email-dt.tangr@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: "dt.tangr@gmail.com" <dt.tangr@gmail.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 04, 2013 at 09:20:07AM +0000, dt.tangr@gmail.com wrote:
> From: Daniel Tang <dt.tangr@gmail.com>
> 
> The SoC name was mistakenly used instead of the vendor name in the
> device tree binding for nspire-usb.
> 
> This patch fixes this before the driver becomes widely adopted.

How widely adopted is it so far?

I can't see the binding in mainline yet.

> 
> Signed-off-by: Daniel Tang <dt.tangr@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-nspire.txt |    4 ++--
>  drivers/usb/chipidea/ci_hdrc_nspire.c                    |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-nspire.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-nspire.txt
> index 5ba8e90..ef1fcbf 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-nspire.txt
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-nspire.txt
> @@ -1,7 +1,7 @@
>  * TI-Nspire USB OTG Controller
>  
>  Required properties:
> -- compatible: Should be "zevio,nspire-usb"
> +- compatible: Should be "lsi,nspire-usb"

Surely this should be lsi,zevio-usb, matching the lsi,zevio-timer
binding?

Thanks,
Mark.
