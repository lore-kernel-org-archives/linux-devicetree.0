Return-Path: <SRS0=q+WY=TA=gmail.com=dmitry.torokhov@kernel.org>
Date: Tue, 30 Apr 2019 00:49:24 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: input: touchscreen: iqs5xx: Add
 bindings
Message-ID: <20190430074924.GB148015@dtor-ws>
References: <1556540652-7616-1-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556540652-7616-1-git-send-email-jeff@labundy.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: devicetree@vger.kernel.org, linux-input@vger.kernel.org, rydberg@bitmath.org, robh+dt@kernel.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

Hi Jeff,

On Mon, Apr 29, 2019 at 07:24:11AM -0500, Jeff LaBundy wrote:
> This patch adds binding documentation for the Azoteq IQS550/572/525
> family of trackpad/touchscreen controllers.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
> Changes in v10:
>   - None
> 
> Changes in v9:
>   - Corrected the polarity of the reset GPIO in the example node to match that
>     of the device's active-low NRST pin
>   - Removed previous Reviewed-by trailer as this file has since changed

Applied with minor formatting changes. I restored Rob's reviewed-by
since he was happy with the binding.

Thanks.

-- 
Dmitry
