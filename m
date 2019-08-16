From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: power/supply/sbs_sbs-battery: Addition
 of force_load binding Add device tree binding documentation for addition of
 force_load boolean value to allow loading a battery during boot even if not
 present at that time.
Date: Fri, 16 Aug 2019 16:14:30 -0500
Message-ID: <20190816211430.GA8175@bogus>
References: <1564037445-22936-1-git-send-email-rtresidd@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1564037445-22936-1-git-send-email-rtresidd@electromag.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Tresidder <rtresidd@electromag.com.au>
Cc: sre@kernel.org, mark.rutland@arm.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 25, 2019 at 02:50:45PM +0800, Richard Tresidder wrote:
> Signed-off-by: Richard Tresidder <rtresidd@electromag.com.au>
> ---
> 
> Notes:
>     Add device tree binding documentation for addition of force_load
>     boolean value to allow loading a battery during boot even if not
>     present at that time.
>     Accompanying patch to drivers/power/supply/sbs-battery.c submitted to linux-pm@vger.kernel.org
> 
>  Documentation/devicetree/bindings/power/supply/sbs_sbs-battery.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/supply/sbs_sbs-battery.txt b/Documentation/devicetree/bindings/power/supply/sbs_sbs-battery.txt
> index 4e78e51..187d7bb 100644
> --- a/Documentation/devicetree/bindings/power/supply/sbs_sbs-battery.txt
> +++ b/Documentation/devicetree/bindings/power/supply/sbs_sbs-battery.txt
> @@ -15,7 +15,8 @@ Optional properties :
>     after an external change notification.
>   - sbs,battery-detect-gpios : The gpio which signals battery detection and
>     a flag specifying its polarity.
> -
> + - sbs,force-load : Allow loading of a hot-pluggable battery when there is no
> +   GPIO detect available and the module is statically built.

What's a module? That's Linux specific and nothing to do with the 
binding. 

Can't you just force load if sbs,battery-detect-gpios is not present?

Rob
