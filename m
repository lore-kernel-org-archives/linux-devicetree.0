Return-Path: <SRS0=HlsD=ZF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A9BC43331
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 03:50:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 74686222CE
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 03:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573617025;
	bh=u2zBJPDK1HmAwkiIjHlAJYi/kGGIlFH4qbls/LIEKxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=dxlVHSTdU9F0+oiZoVxupwHUL0zkCeHRVJU/WstG8KRc2EOdfW4Nk9Zw1IxvlYj/U
	 72FWIF+lD+QnQux2D14PMswGxIpAAoI+hyAJbQS9wTu0odgTWT8SOqgs2PFyvqv1nn
	 g21/lJ86qSjZMlxkhgjkb4fbCOLzufYHbS3jcOw8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbfKMDuY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 Nov 2019 22:50:24 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42298 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727352AbfKMDuY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 12 Nov 2019 22:50:24 -0500
Received: by mail-oi1-f196.google.com with SMTP id i185so505821oif.9
        for <devicetree@vger.kernel.org>; Tue, 12 Nov 2019 19:50:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yw4W9gr9hr+ygb7liTr5wABF4oTbz4wbrBdFNYeRM54=;
        b=HKEFItykBlQQcJqXBOgHwNdZFTOKCefey+54KAXymYJ73G+2xfWB+inhfTkapVTNxD
         kC9NSdoDbWUz2W6zBZrjLpF9AsNG3G16u9045yJEMJ7Rb9SNTOSYAnY4SLtvMF4RwRZa
         UPM4NcK3tVHqFWtKUPLlrZKb93ziTF2kgJpWXD2bCGTE5fukQrSlYJAZzDvL7qte8yRU
         iqAQ//4+5/tuB//f5PDbJ7iDJqhCjFLskPaQc5SaBgUHjDjpT5Me7qa33QwPz6IpwxC0
         oigFSgCVx4Ewt1syxMKzHg5IdDNoA4n7M/Jv5WTHJuSiOsGdjjoIRFEcHkrqhTMOswcG
         oW+Q==
X-Gm-Message-State: APjAAAVgEsioh86WFm8xJMeMGzmFoBhtMihvqmO1GFffM7HX5rqQ7+1S
        PJZrjAPm6ArqerS3fmUiOw==
X-Google-Smtp-Source: APXvYqzn9WyQ34a911h+OqumViXcb4qpJexBGHw1jIWOUAOxQ+CD347g2mXcZfFRKthfTJPvAD9XgA==
X-Received: by 2002:aca:1101:: with SMTP id 1mr992738oir.103.1573617023608;
        Tue, 12 Nov 2019 19:50:23 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k18sm271911oij.32.2019.11.12.19.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 19:50:22 -0800 (PST)
Date:   Tue, 12 Nov 2019 21:50:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: at91: Document Kizboxmini and
 Smartkiz boards binding
Message-ID: <20191113035022.GA27823@bogus>
References: <20191106083643.1995-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106083643.1995-1-kamel.bouhara@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Nov 06, 2019 at 09:36:42AM +0100, Kamel Bouhara wrote:
> Document devicetree's bindings for the Overkiz's Kizbox Mini and
> Smartkiz boards, based on a SAM9G25 Atmel SoC.
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---
> Changes in v2
> =============
> 	- Added Kizboxmini Base board documentation
> 	- Merged Smartkiz documentation as it is also a sam9g25 based
> 	board
> 
> Changes in v3
> =============
> 	- Made a single items list with all the sam9g25 based boards and
> 	put description into a comment.
> 	- Fixed duplicated item in enum list and checked with 'make
> 	dt_binding_check'

Are you sure?

> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> index 6dd8be401673..e4140e94864d 100644
> --- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> +++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> @@ -35,6 +35,16 @@ properties:
>                - atmel,at91sam9x60
>            - const: atmel,at91sam9
> 
> +        items:

You are missing a '-' here, giving this:

Traceback (most recent call last):
  File "/usr/local/bin/dt-mk-schema", line 32, in <module>
    schemas = dtschema.process_schemas(args.schemas, core_schema=(not 
args.useronly))
  File "/usr/local/lib/python3.6/dist-packages/dtschema/lib.py", line 
475, in process_schemas
    sch = process_schema(os.path.abspath(filename))
  File "/usr/local/lib/python3.6/dist-packages/dtschema/lib.py", line 
427, in process_schema
    schema = load_schema(filename)
  File "/usr/local/lib/python3.6/dist-packages/dtschema/lib.py", line 
103, in load_schema
    return yaml.load(f.read())
  File "/usr/local/lib/python3.6/dist-packages/ruamel/yaml/main.py", 
line 341, in load
    return constructor.get_single_data()
  File 
"/usr/local/lib/python3.6/dist-packages/ruamel/yaml/constructor.py", 
line 113, in get_single_data
    return self.construct_document(node)
  File 
"/usr/local/lib/python3.6/dist-packages/ruamel/yaml/constructor.py", 
line 123, in construct_document
    for _dummy in generator:
  File 
"/usr/local/lib/python3.6/dist-packages/ruamel/yaml/constructor.py", 
line 723, in construct_yaml_map
    value = self.construct_mapping(node)
  File 
"/usr/local/lib/python3.6/dist-packages/ruamel/yaml/constructor.py", 
line 440, in construct_mapping
    return BaseConstructor.construct_mapping(self, node, deep=deep)
  File 
"/usr/local/lib/python3.6/dist-packages/ruamel/yaml/constructor.py", 
line 257, in construct_mapping
    if self.check_mapping_key(node, key_node, mapping, key, value):
  File 
"/usr/local/lib/python3.6/dist-packages/ruamel/yaml/constructor.py", 
line 295, in check_mapping_key
    raise DuplicateKeyError(*args)
ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
  in "<unicode string>", line 23, column 9
found duplicate key "items" with value "[]" (original value: "[]")
  in "<unicode string>", line 38, column 9

To suppress this check see:
    http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys

Duplicate keys will become an error in future releases, and are errors
by default when using the new API.

Documentation/devicetree/bindings/Makefile:33: recipe for target 
'Documentation/devicetree/bindings/processed-schema.yaml' failed


> +          - enum:
> +                - overkiz,kizboxmini-base # Overkiz kizbox Mini Base Board
> +                - overkiz,kizboxmini-mb   # Overkiz kizbox Mini Mother Board
> +                - overkiz,kizboxmini-rd   # Overkiz kizbox Mini RailDIN
> +                - overkiz,smartkiz        # Overkiz SmartKiz Board
> +          - const: atmel,at91sam9g25
> +          - const: atmel,at91sam9x5
> +          - const: atmel,at91sam9
> +
>        - items:
>            - enum:
>                - atmel,at91sam9g15
> --
> 2.24.0.rc1
> 
