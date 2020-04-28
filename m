Return-Path: <SRS0=DpSr=6M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12234C83001
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 16:41:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E612E206D6
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 16:41:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura-hr.20150623.gappssmtp.com header.i=@sartura-hr.20150623.gappssmtp.com header.b="u0IbH3M8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728291AbgD1QlM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Apr 2020 12:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728335AbgD1QlJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Apr 2020 12:41:09 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 098E0C03C1AC
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 09:41:08 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id i27so33718847ota.7
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 09:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ej7TTxYPOCUjZ2CQUSr20OUxUMW8qnZz71cmcRHx9Bk=;
        b=u0IbH3M8FSosaaIdXSzKS8Q7157jIXtA/va7tZv0+OV5NyxvG48nxfl09ZhiFGDLev
         nhACwWVrI+K6PQdVZIQ8xRtKyFAFrHDBp+/OEZehPaXnn0V6VZPc+eyN8ihnbYPNx352
         vV6+QMDug8mCIbbhTfQE0gOLACFscEkyp9SI8PSGhFbfaEUtUDRnlhtvrzPcbWKSutmk
         Q1qkS/Tkr4lGf5Du9Q7Is6vR97ws0NLI3sl/jqIkKfQVaGpCdfjaCI3L8LWQ217M3pkc
         KSBkvgKQxC4NL+5rJhcyae3FUCT5WE6Ft+yRf0ZZIjiOhzQVBS3EztA/1zOkFDI0DCkZ
         ZKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ej7TTxYPOCUjZ2CQUSr20OUxUMW8qnZz71cmcRHx9Bk=;
        b=gAHSXzKD+xbd2h0BzXqxK0D1wr3toW+kjr5gHfc4tuZwDupmIzVanDpkAnk25aPTZD
         M9aPi9Ua1vLF1VAncSoHdwKOZGc8+UKJbqYpY9LMF6XRQqRI9ElGNVouPIiUCnErlwaQ
         iKCz8MhTUHriC+06HNjJTBcINcnyy07EpoEJxsJB6qFL59f+ghHpFwGlJOCIaPiUFNzU
         5HEehzREPFVXX2jJp5ddGSe7y/xAGmzj+LMbjddU51cIQMB47BLTKbgr1DJN8srrp/QS
         RDk9Bxx2pTvvIaluOluEwAjqhhtN6lkvd/GbP3k17+ODajfT0wwxpGFbqEZbHugLIHNv
         BGqQ==
X-Gm-Message-State: AGi0PuZoxkWxKRSFILQRYlsg/6Gp1H4WX29KidKXroV+39xL3TfXnmZt
        oecTx5CQs5R42hqGi3xm2RgBeo8fQ4MTFkIl6FDMfA==
X-Google-Smtp-Source: APiQypI5jgRZDess6nlH+QHGWtMVtpKyuiaNv0Q/5uAdeleBiZWLGdLeCKBv2lgWnykl6/7vKyO0iiEsfWwLlXlOqZc=
X-Received: by 2002:a9d:7304:: with SMTP id e4mr13363952otk.243.1588092067350;
 Tue, 28 Apr 2020 09:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200415150244.2737206-1-robert.marko@sartura.hr>
 <20200415150244.2737206-2-robert.marko@sartura.hr> <20200428150930.GA25643@bogus>
In-Reply-To: <20200428150930.GA25643@bogus>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Tue, 28 Apr 2020 18:40:56 +0200
Message-ID: <CA+HBbNF4S=o059AwW3UpNQ8+US1PCQ_edZM+O0m8r0ozJ5TBfw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: add Qualcomm IPQ4019 MDIO bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Apr 28, 2020 at 5:09 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Apr 15, 2020 at 05:02:46PM +0200, Robert Marko wrote:
> > This patch adds the binding document for the IPQ40xx MDIO driver.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > Cc: Luka Perkov <luka.perkov@sartura.hr>
> > ---
> > Changes from v2 to v3:
> > * Remove status from example
> >
> >  .../bindings/net/qcom,ipq40xx-mdio.yaml       | 61 +++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/qcom,ipq40xx-mdio.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/net/qcom,ipq40xx-mdio.yaml b/Documentation/devicetree/bindings/net/qcom,ipq40xx-mdio.yaml
> > new file mode 100644
> > index 000000000000..8d4542ccd38c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/qcom,ipq40xx-mdio.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: GPL-2.0
>
> Dual license new bindings please:
>
> (GPL-2.0-only OR BSD-2-Clause)
Ok, will change it in next revision.
>
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/qcom,ipq40xx-mdio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm IPQ40xx MDIO Controller Device Tree Bindings
> > +
> > +maintainers:
> > +  - Robert Marko <robert.marko@sartura.hr>
> > +
> > +allOf:
> > +  - $ref: "mdio.yaml#"
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,ipq40xx-mdio
>
> Don't use wildcards in compatible names. Should be SoC specific. If 'all
> the same', then use a fallback to the 1st implementation.
Ok, I will change it to qcom,ipq4019 then.
The whole IPQ40xx series uses the same controller.
>
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +
> > +examples:
> > +  - |
> > +    mdio@90000 {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +      compatible = "qcom,ipq40xx-mdio";
> > +      reg = <0x90000 0x64>;
> > +
> > +      ethphy0: ethernet-phy@0 {
> > +        reg = <0>;
> > +      };
> > +
> > +      ethphy1: ethernet-phy@1 {
> > +        reg = <1>;
> > +      };
> > +
> > +      ethphy2: ethernet-phy@2 {
> > +        reg = <2>;
> > +      };
> > +
> > +      ethphy3: ethernet-phy@3 {
> > +        reg = <3>;
> > +      };
> > +
> > +      ethphy4: ethernet-phy@4 {
> > +        reg = <4>;
> > +      };
> > +    };
> > --
> > 2.26.0
> >
