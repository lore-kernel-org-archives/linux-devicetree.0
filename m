Return-Path: <SRS0=UIXH=76=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2CEC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 16:50:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEB462080D
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 16:50:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rvaliaDW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbgFQQuO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 12:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbgFQQuN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 12:50:13 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65514C06174E;
        Wed, 17 Jun 2020 09:50:13 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l17so2531427wmj.0;
        Wed, 17 Jun 2020 09:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TyC5uMpxB8B/CSZVHRSZcoQ5uHMa6sW2hm10+RJozrY=;
        b=rvaliaDWvWsmaHbdKqOOSJUlvppnzt5aj3micf4D40edi2v6nHYFJiV0UQ12esYy/v
         0HeQTNd8xaTMe0NCs7yTNxDDQ2YMYWATUdUlcjvIXIDI3qUQt7tisYugsJrw9vPk75KL
         p3v685FPQkj8V5+Xhb+DGh4JqctdIT6Go5La7R/muHi9pm6famr6nGkOb9gmWOLwH1Ph
         o4pBcm5HQj9goyZGidHymh17YqKPJXRXUT/Va4ao5Q5ezogFD1pHfwBuNCx+EdDsIQAG
         n3GnWV1loQvU+iWZSnEnt0L4novbUXB59RsJqNsuwSsFfa/9a3iug9TwwvD/AQqQLNhj
         zUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TyC5uMpxB8B/CSZVHRSZcoQ5uHMa6sW2hm10+RJozrY=;
        b=GEvlZqPHPmHX4wBKsyt13MfCuSJzPRZJ23/VspHE6yguUOm29XBfLJbOv+jWOkPQAA
         S+dAQdbWtOdVzPP9HroyyqMCjv8ScRxkfXk4+nZm/GT6+57jk9+BdkbxvSpW0xFKh0/I
         knOsPQley5Wckk2oaCCMqzJTWTmtfqeT1YMkHUVaIpTEaYh+o/Wjm12GnZ55YnAoSt5w
         FcamUPMrgyyhnGEht3jvIfZ0olhoUa2HhVLm1DKrXvckwNZPfHV6WRI/Plge2FIqgVp/
         2Aiz2hTeRTvEOtt4hevlCd4cxjFQZPDEC+tWKLbJvkyMjU5mCIRhCSECqLHg036h9MGN
         wZyQ==
X-Gm-Message-State: AOAM530eZVR3Ur+RmS/CXgBDvZ7BqkMlWyg2oBW8PlcZD25JmbEUtecP
        W27tCM5QJTMDe6To2EQQSJoJox5r
X-Google-Smtp-Source: ABdhPJx4Ns+a4N7YOfCsFfc9R/XEOFpKem8MOvmcVa5kDj5p8cZXfhJVj4ipmPKbMsu8ZljV5JX7Cw==
X-Received: by 2002:a1c:9d96:: with SMTP id g144mr9143593wme.126.1592412612056;
        Wed, 17 Jun 2020 09:50:12 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g3sm208345wrb.46.2020.06.17.09.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 09:50:09 -0700 (PDT)
Date:   Wed, 17 Jun 2020 18:50:08 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 25/38] dt-bindings: gpio: tegra: Convert to json-schema
Message-ID: <20200617165008.GB3547875@ulmo>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-26-thierry.reding@gmail.com>
 <186ceadd-317c-a7b2-d4ab-32473f857545@gmail.com>
 <20200617141706.GC3536291@ulmo>
 <c0cfa39b-054c-8e88-7e5a-233c24f5d5e9@gmail.com>
 <a14c2791-83af-1cd0-1d15-0544a4bf490b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
Content-Disposition: inline
In-Reply-To: <a14c2791-83af-1cd0-1d15-0544a4bf490b@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 05:33:00PM +0300, Dmitry Osipenko wrote:
> 17.06.2020 17:24, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > 17.06.2020 17:17, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> On Wed, Jun 17, 2020 at 07:24:16AM +0300, Dmitry Osipenko wrote:
> >>> 12.06.2020 17:18, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> ...
> >>>> +patternProperties:
> >>>> +  # GPIO hogs; /schemas/gpio/gpio-hog.yaml will match
> >>>> +  "^gpios(-[a-zA-Z0-9-]+)?$":
> >>>> +    type: object
> >>>> +    required:
> >>>> +      - gpio-hog
> >>>
> >>> There are two problems here:
> >>>
> >>> 1. This naming limitation didn't exist before this patch, so it's not=
 a
> >>> part of the conversion.
> >>>
> >>> 2. GPIO core uses the node's name for the hog's name. Hence by imposi=
ng
> >>> the "gpios-" prefix, you're forcing all hogs to be named as gpios-xxx,
> >>> which doesn't make much sense to me.
> >>>
> >>> Please explain the rationale of this change.
> >>
> >> We could probably do without this if we didn't enforce additional or
> >> unevaluated properties. Because if we don't match on a pattern here th=
en
> >> all of those GPIO hog nodes would show up as "extra" properties and th=
ey
> >> are currently not allowed. If we do allow them, then we can drop this,
> >> but we then have no way to fail validation for whatever else somebody
> >> might want to put into these device tree nodes.
> >>
> >> That said, I think additionalProperties can be a schema in itself, so
> >> maybe there's a way to only allow additional properties if they are of
> >> type object and have a gpio-hog property. I'll look into that.
> >=20
> > Isn't it possible to validate the additional properties by checking what
> > properties they have?
> >=20
> > For example, if sub-node has a gpio-hog property then this sub-node is
> > okay, otherwise fail.
> >=20
>=20
> Ah, I haven't finished reading yours last sentence before started to
> type :) Yes, it will be nice if we could avoid the naming limitation, or
> at least change it to something like xxx-hog.

So according to the json-schema specification, both additionalProperties
and unevaluatedProperties must be a valid JSON schema, which means they
can be objects rather than just booleans. Unfortunately, dt-schema tools
don't allow these to be objects, so the below currently fails with these
tools at the moment.

I can make it work with the following patch against dt-schema.git:

--- >8 ---
diff --git a/meta-schemas/keywords.yaml b/meta-schemas/keywords.yaml
index ed543235d7e7..aa88f726ea3b 100644
--- a/meta-schemas/keywords.yaml
+++ b/meta-schemas/keywords.yaml
@@ -79,7 +79,11 @@ properties:
   additionalItems:
     type: boolean
   additionalProperties:
-    type: boolean
+    oneOf:
+      - type: object
+        allOf:
+          - $ref: "#/definitions/sub-schemas"
+      - type: boolean
   allOf:
     items:
       $ref: "#/definitions/sub-schemas"
@@ -140,7 +144,11 @@ properties:
   type: true
   typeSize: true
   unevaluatedProperties:
-    type: boolean
+    oneOf:
+      - type: object
+        allOf:
+          - $ref: "#/definitions/sub-schemas"
+      - type: boolean
   uniqueItems:
     type: boolean
=20
--- >8 ---

With that applied, I can make validation of gpio-hog nodes work without
requiring the names to change, which incidentally will allow me to drop
one of the fixup patches from the ARM/arm64 DTS series.

Here's a hunk that applies on top of this patch and makes this work.
I'll squash it in for the next version.

--- >8 ---
diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yam=
l b/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml
index b2debdb0caff..3f8a9c988305 100644
--- a/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml
@@ -57,13 +57,6 @@ properties:
   interrupt-controller:
     description: Marks the device node as an interrupt controller.
=20
-patternProperties:
-  # GPIO hogs; /schemas/gpio/gpio-hog.yaml will match
-  "^gpios(-[a-zA-Z0-9-]+)?$":
-    type: object
-    required:
-      - gpio-hog
-
 allOf:
   - if:
       properties:
@@ -90,7 +83,10 @@ required:
   - "#interrupt-cells"
   - interrupt-controller
=20
-unevaluatedProperties: false
+unevaluatedProperties:
+  type: object
+  required:
+    - gpio-hog
=20
 examples:
   - |
--- >8 ---

Thierry

--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7qSb4ACgkQ3SOs138+
s6Ekxw/8DLU6wY2K1DVoyseL1/Tq/iXKNwGwYgGdx07CD4XCE0ftCo7cJcBVuV8V
flsWVDV/bLpxcXkquG9pi5IhePGTj88GJD4xx6/MWEQqdRKndbsSXpGEFwQu08zC
LNcYVrNAlQsSNTDy78kaT+uqgQ6pmAF0dyluj3klY8Q8q0U98djr7UUKnmhSH8cs
aL2PEk0Vc73mKCh+cUUdLXhT55+0gFhtaZnlT+IGKSgBBMwCEEBgfLF5Hf4eMux6
H/C8UvqILSGSxppYTBKnS1IRiVeSBtiOpTx4SE9pqk3mZOCo6SiIa6Ox0asbv6Es
NejkXLK9Vp25BB8nXnNdYTKlbD5lZO1IyBLaDHO8jRTkrxzNWD7DOy5VvdRjCcGO
/7cbJfNSndB0puLeszUZB+/XTXg3f4twLwTUK4uyhk9VeOHKd+PCsjtS1+yBdASe
DD6Ao8aitGhJv2BKpEmmt0/P5MyI1ioljw8Rs3HfdwE8P1rNfzDSb4OLbq+K+fRP
1vbM0RFdYe2vZ0FckxuQzGZg3snamnb9vOWF6pYuxMOYRK8hx8hPV0yOtrqTmEvd
xMECqcpfHGpa6+QnA1CFwKCYt632e2/CB1GecyhJbHflqz6/STxEEjEzH7LbRVAL
vThVHRu/2ZmoalasCpUZ9z+rNgD1hYwlBwDZF5jlQsLJznjtaTQ=
=dpDf
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--
