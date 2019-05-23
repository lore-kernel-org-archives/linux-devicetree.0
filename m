MIME-Version: 1.0
Date: Thu, 23 May 2019 09:57:22 -0500
References: <20190523081415.29870-1-maxime.ripard@bootlin.com>
In-Reply-To: <20190523081415.29870-1-maxime.ripard@bootlin.com>
Message-ID: <CAL_JsqKLVkM6ygAmLsgF+rxAOxdiqBP2i+J1wLNfDeYrPd2JcA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Add vendor prefix for Espressif
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, May 23, 2019 at 3:14 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Add Espressif Systems DT vendor prefix. That prefix has been used for quite
> some time for WiFi chips, but has never been documented.

Just 1 of about 100...

Here's a script to generate a schema for compatible string checks. Not
yet sure what to do with it or how to integrate it in.

#!/bin/sh

vnd_file="Documentation/devicetree/bindings/vendor-prefixes.yaml"

vendor_pattern="$(sed -n -e 's/.*\^\([-a-zA-Z0-9]*\),.*/
\1\|\\/p' ${vnd_file})"

cat << EOF
# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
%YAML 1.2
---
\$id: http://devicetree.org/schemas/compatible-vendor-prefixes.yaml#
\$schema: http://devicetree.org/meta-schemas/base.yaml#

title: Devicetree Vendor Prefix Registry

maintainers:
  - Rob Herring <robh@kernel.org>

select: true

properties:
  compatible:
    maxItems: 32
    items:
      if:
        allOf:
          - pattern: ","
          - not: { pattern: "^usb[0-9a-f]+," }
      then:
        pattern: "^(\\
${vendor_pattern}
          ),"

EOF
