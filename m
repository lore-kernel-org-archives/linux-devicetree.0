From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 15/41] Documentation: dt: mfd: fix spelling mistakes
Date: Mon, 25 Apr 2016 08:50:17 -0500
Message-ID: <20160425135017.GA8656@rob-hp-laptop>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
 <1461543878-3639-16-git-send-email-eric@engestrom.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461543878-3639-16-git-send-email-eric@engestrom.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Engestrom <eric@engestrom.ch>
Cc: linux-kernel@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 25, 2016 at 01:24:12AM +0100, Eric Engestrom wrote:
> Signed-off-by: Eric Engestrom <eric@engestrom.ch>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/mfd/qcom-rpm.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom-rpm.txt b/Documentation/devicetree/bindings/mfd/qcom-rpm.txt
> index 5e97a95..b98b291 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom-rpm.txt
> +++ b/Documentation/devicetree/bindings/mfd/qcom-rpm.txt
> @@ -178,7 +178,7 @@ see regulator.txt - with additional custom properties described below:
>  - qcom,force-mode:
>  	Usage: optional (default if no other qcom,force-mode is specified)
>  	Value type: <u32>
> -	Defintion: indicates that the regulator should be forced to a
> +	Definition: indicates that the regulator should be forced to a
>  		   particular mode, valid values are:
>  		   QCOM_RPM_FORCE_MODE_NONE - do not force any mode
>  		   QCOM_RPM_FORCE_MODE_LPM - force into low power mode
> @@ -204,7 +204,7 @@ see regulator.txt - with additional custom properties described below:
>  - qcom,force-mode:
>  	Usage: optional
>  	Value type: <u32>
> -	Defintion: indicates that the regulator should not be forced to any
> +	Definition: indicates that the regulator should not be forced to any
>  		   particular mode, valid values are:
>  		   QCOM_RPM_FORCE_MODE_NONE - do not force any mode
>  		   QCOM_RPM_FORCE_MODE_LPM - force into low power mode
> -- 
> 2.8.0
> 
