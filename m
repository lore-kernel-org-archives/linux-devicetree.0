From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 21/41] Documentation: dt: power: fix spelling mistake
Date: Mon, 25 Apr 2016 08:51:26 -0500
Message-ID: <20160425135126.GA9401@rob-hp-laptop>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
 <1461543878-3639-22-git-send-email-eric@engestrom.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461543878-3639-22-git-send-email-eric@engestrom.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Engestrom <eric@engestrom.ch>
Cc: linux-kernel@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Tim Bird <tim.bird@sonymobile.com>, Andy Gross <agross@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 25, 2016 at 01:24:18AM +0100, Eric Engestrom wrote:
> Signed-off-by: Eric Engestrom <eric@engestrom.ch>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/power/qcom,coincell-charger.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt b/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt
> index 0e6d875..7478992 100644
> --- a/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt
> +++ b/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt
> @@ -29,7 +29,7 @@ IC (PMIC)
>  - qcom,charger-disable:
>  	Usage: optional
>  	Value type: <boolean>
> -	Definition: definining this property disables charging
> +	Definition: defining this property disables charging
>  
>  This charger is a sub-node of one of the 8941 PMIC blocks, and is specified
>  as a child node in DTS of that node.  See ../mfd/qcom,spmi-pmic.txt and
> -- 
> 2.8.0
> 
