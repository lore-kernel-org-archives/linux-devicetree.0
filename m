Return-Path: <robherring2@gmail.com>
Date: Tue, 4 Dec 2018 17:13:47 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: input: touchscreen: iqs5xx: Add
 bindings
Message-ID: <20181204231347.GA13500@bogus>
References: <1542604455-26332-1-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1542604455-26332-1-git-send-email-jeff@labundy.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: dmitry.torokhov@gmail.com, jikos@jikos.cz, devicetree@vger.kernel.org, linux-input@vger.kernel.org, rydberg@bitmath.org, robh+dt@kernel.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

On Sun, 18 Nov 2018 23:14:14 -0600, Jeff LaBundy wrote:
> This patch adds binding documentation for the Azoteq IQS550/572/525
> family of trackpad/touchscreen controllers.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
> Changes in v2:
> 
>   - Separated each valid "compatible" property with a line break
> 
>   - Specified the polarity of the RDY and NRST pins
> 
>   - Replaced duplicate definitions of common touchscreen properties with a
>     reference to touchscreen.txt
> 
>   - Specified the example node as "touchscreen@74"
> 
>  .../bindings/input/touchscreen/iqs5xx.txt          | 109 +++++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  2 files changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
