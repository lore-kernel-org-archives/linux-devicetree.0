From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] of: add vendor prefix for Holtek Semiconductor
Date: Fri, 18 Mar 2016 16:32:59 -0500
Message-ID: <20160318213259.GA11477@rob-hp-laptop>
References: <cover.1458140954.git.robin@protonic.nl>
 <81209392e3cdf566aa03b208b5e31a19c93e7b40.1458140954.git.robin@protonic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <81209392e3cdf566aa03b208b5e31a19c93e7b40.1458140954.git.robin@protonic.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin van der Gracht <robin@protonic.nl>
Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thierry Reding <treding@nvidia.com>, Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee.jones@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Stefan Wahren <stefan.wahren@i2se.com>, Philipp Zabel <philipp.zabel@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 16, 2016 at 04:52:08PM +0100, Robin van der Gracht wrote:
> This patch introduces a vendor prefix for Holtek Semiconductor Inc.
> 
> Signed-off-by: Robin van der Gracht <robin@protonic.nl>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index dd72e05..fa70359d 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -108,6 +108,7 @@ hitex	Hitex Development Tools
>  holt	Holt Integrated Circuits, Inc.
>  honeywell	Honeywell
>  hp	Hewlett Packard
> +ht	Holtek Semiconductor Inc.

I think holtek being a bit longer would be better here.

>  i2se	I2SE GmbH
>  ibm	International Business Machines (IBM)
>  idt	Integrated Device Technologies, Inc.
> -- 
> 2.5.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
