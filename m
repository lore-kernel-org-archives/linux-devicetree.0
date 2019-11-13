Return-Path: <SRS0=HlsD=ZF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0D8C17442
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 10:10:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E1CFA20818
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 10:10:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbfKMKKx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 Nov 2019 05:10:53 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:60147 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727080AbfKMKKx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 Nov 2019 05:10:53 -0500
X-Originating-IP: 92.137.17.54
Received: from kb-xps (alyon-657-1-975-54.w92-137.abo.wanadoo.fr [92.137.17.54])
        (Authenticated sender: kamel.bouhara@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 385BC1BF20A;
        Wed, 13 Nov 2019 10:10:49 +0000 (UTC)
Date:   Wed, 13 Nov 2019 11:10:47 +0100
From:   Kamel Bouhara <kamel.bouhara@bootlin.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: at91: Document Kizboxmini and
 Smartkiz boards binding
Message-ID: <20191113101047.GB25624@kb-xps>
References: <20191106083643.1995-1-kamel.bouhara@bootlin.com>
 <20191113035022.GA27823@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113035022.GA27823@bogus>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Nov 12, 2019 at 09:50:22PM -0600, Rob Herring wrote:
> On Wed, Nov 06, 2019 at 09:36:42AM +0100, Kamel Bouhara wrote:
> > Document devicetree's bindings for the Overkiz's Kizbox Mini and
> > Smartkiz boards, based on a SAM9G25 Atmel SoC.
> >
> > Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> > ---
> > Changes in v2
> > =============
> > 	- Added Kizboxmini Base board documentation
> > 	- Merged Smartkiz documentation as it is also a sam9g25 based
> > 	board
> >
> > Changes in v3
> > =============
> > 	- Made a single items list with all the sam9g25 based boards and
> > 	put description into a comment.
> > 	- Fixed duplicated item in enum list and checked with 'make
> > 	dt_binding_check'
>
> Are you sure?
>
Yes, here is the command output I've got :

$ make ARCH=arm dt_binding_check \
DT_SCHEMA_FILES="Documentation/devicetree/bindings/arm/atmel-at91.yaml" \
DT_SCHEMA_FLAGS="-u"
 SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
 DTC     Documentation/devicetree/bindings/arm/atmel-at91.example.dt.yaml
 CHECK   Documentation/devicetree/bindings/arm/atmel-at91.example.dt.yaml

> > ---
> >  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> > index 6dd8be401673..e4140e94864d 100644
> > --- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> > +++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> > @@ -35,6 +35,16 @@ properties:
> >                - atmel,at91sam9x60
> >            - const: atmel,at91sam9
> >
> > +        items:
>
> You are missing a '-' here, giving this:
>
Yes but the log you're putting seems  more related to a python issue (2.6 vs 3)
?
> Traceback (most recent call last):
>   File "/usr/local/bin/dt-mk-schema", line 32, in <module>
>     schemas = dtschema.process_schemas(args.schemas, core_schema=(not
> args.useronly))
>   File "/usr/local/lib/python3.6/dist-packages/dtschema/lib.py", line
> 475, in process_schemas
>     sch = process_schema(os.path.abspath(filename))
>   File "/usr/local/lib/python3.6/dist-packages/dtschema/lib.py", line
> 427, in process_schema
>     schema = load_schema(filename)
>   File "/usr/local/lib/python3.6/dist-packages/dtschema/lib.py", line
> 103, in load_schema
>     return yaml.load(f.read())
>   File "/usr/local/lib/python3.6/dist-packages/ruamel/yaml/main.py",
> line 341, in load
>     return constructor.get_single_data()
>   File
> "/usr/local/lib/python3.6/dist-packages/ruamel/yaml/constructor.py",
> line 113, in get_single_data
>     return self.construct_document(node)
>   File
> "/usr/local/lib/python3.6/dist-packages/ruamel/yaml/constructor.py",
> line 123, in construct_document
>     for _dummy in generator:
>   File
> "/usr/local/lib/python3.6/dist-packages/ruamel/yaml/constructor.py",
> line 723, in construct_yaml_map
>     value = self.construct_mapping(node)
>   File
> "/usr/local/lib/python3.6/dist-packages/ruamel/yaml/constructor.py",
> line 440, in construct_mapping
>     return BaseConstructor.construct_mapping(self, node, deep=deep)
>   File
> "/usr/local/lib/python3.6/dist-packages/ruamel/yaml/constructor.py",
> line 257, in construct_mapping
>     if self.check_mapping_key(node, key_node, mapping, key, value):
>   File
> "/usr/local/lib/python3.6/dist-packages/ruamel/yaml/constructor.py",
> line 295, in check_mapping_key
>     raise DuplicateKeyError(*args)
> ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
>   in "<unicode string>", line 23, column 9
> found duplicate key "items" with value "[]" (original value: "[]")
>   in "<unicode string>", line 38, column 9
>
> To suppress this check see:
>     http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys
>
> Duplicate keys will become an error in future releases, and are errors
> by default when using the new API.
>
> Documentation/devicetree/bindings/Makefile:33: recipe for target
> 'Documentation/devicetree/bindings/processed-schema.yaml' failed
>
>
> > +          - enum:
> > +                - overkiz,kizboxmini-base # Overkiz kizbox Mini Base Board
> > +                - overkiz,kizboxmini-mb   # Overkiz kizbox Mini Mother Board
> > +                - overkiz,kizboxmini-rd   # Overkiz kizbox Mini RailDIN
> > +                - overkiz,smartkiz        # Overkiz SmartKiz Board
> > +          - const: atmel,at91sam9g25
> > +          - const: atmel,at91sam9x5
> > +          - const: atmel,at91sam9
> > +
> >        - items:
> >            - enum:
> >                - atmel,at91sam9g15
> > --
> > 2.24.0.rc1
> >

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
