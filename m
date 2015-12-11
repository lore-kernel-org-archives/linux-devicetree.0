From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] mfd: arizona: Update binding docs for selecting
 mono/stereo outputs
Date: Fri, 11 Dec 2015 11:33:53 -0600
Message-ID: <20151211173353.GA7664@rob-hp-laptop>
References: <1449829703-600-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1449829703-600-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449829703-600-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Fri, Dec 11, 2015 at 10:28:23AM +0000, Charles Keepax wrote:
> Update the device tree binding documentation to include the wlf,out-mono
> property that is used to specify whether each output is a mono or stereo
> output.

You just added this binding and updating it already? While we may like 
kernel changes incremental, we don't like bindings evolving any more 
than necessary.
 
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  Documentation/devicetree/bindings/mfd/arizona.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
> index 2b6ccdb..489dd07 100644
> --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> @@ -65,6 +65,10 @@ Optional properties:
>      that have not been specified are set to 0 by default. Entries are:
>      <IN1, IN2, IN3, IN4> (wm5102, wm5110, wm8280, wm8997)
>      <IN1A, IN2A, IN1B, IN2B> (wm8998, wm1814)
> +  - wlf,out-mono : A boolean indicating whether each output is mono or stereo.
> +    A non-zero value indicates a mono output. If present, the number of values
> +    should be less than or equal to the number of outputs, if less values are
> +    supplied the additional outputs will be treated as stereo.

How do you know which outputs are which with a variable number? 

Rob
