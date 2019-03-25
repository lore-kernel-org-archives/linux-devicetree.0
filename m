Return-Path: <robherring2@gmail.com>
Date: Mon, 25 Mar 2019 14:14:39 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: input: touchscreen: iqs5xx: Add
 bindings
Message-ID: <20190325191439.GA31452@bogus>
References: <1552849647-31973-1-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1552849647-31973-1-git-send-email-jeff@labundy.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: dmitry.torokhov@gmail.com, devicetree@vger.kernel.org, linux-input@vger.kernel.org, rydberg@bitmath.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

On Sun, Mar 17, 2019 at 02:07:26PM -0500, Jeff LaBundy wrote:
> This patch adds binding documentation for the Azoteq IQS550/572/525
> family of trackpad/touchscreen controllers.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
> Changes in v7:
>   - Removed the azoteq,exp-ver-major and azoteq,exp-ver-minor properties to
>     match the driver's updated device identification scheme
>   - Updated the example node to use a level-sensitive interrupt rather than
>     an edge-sensitive interrupt
>   - Removed previous Reviewed-by trailer as this file has since changed
> 
> Changes in v6:
>   - None
> 
> Changes in v5:
>   - None
> 
> Changes in v4:
>   - None
> 
> Changes in v3:
>   - Added Reviewed-by trailer
> 
> Changes in v2:
>   - Separated each valid "compatible" property with a line break
>   - Specified the polarity of the RDY and NRST pins
>   - Replaced duplicate definitions of common touchscreen properties with a
>     reference to touchscreen.txt
>   - Specified the example node as "touchscreen@74"
> 
>  .../bindings/input/touchscreen/iqs5xx.txt          | 80 ++++++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>  2 files changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt

Reviewed-by: Rob Herring <robh@kernel.org>
