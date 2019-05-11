From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH] dt-bindings: Convert vendor prefixes to json-schema
Date: Sat, 11 May 2019 21:17:53 +0300
Message-ID: <20190511181753.GA2444@t60.musicnaut.iki.fi>
References: <20190510194018.28206-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190510194018.28206-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, May 10, 2019 at 02:40:18PM -0500, Rob Herring wrote:
> Convert the vendor prefix registry to a schema. This will enable checking
> that new vendor prefixes are added (in addition to the less than perfect
> checkpatch.pl check) and will also check against adding other prefixes
> which are not vendors.
> 
> Converted vendor-prefixes.txt using the following sed script:
> 
> sed -e 's/\([a-zA-Z0-9\-]*\)[[:space:]]*\([a-zA-Z0-9].*\)/  "^\1,\.\*\":\n    description: \2/'
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
[...]
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> deleted file mode 100644
> index e9034a6c003a..000000000000
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ /dev/null
> @@ -1,476 +0,0 @@
> -Device tree binding vendor prefix registry.  Keep list in alphabetical order.
[...]
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> new file mode 100644
> index 000000000000..be037fb2cada
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -0,0 +1,975 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)

Is there a license change as well?

A.
