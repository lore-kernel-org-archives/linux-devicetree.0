Return-Path: <SRS0=wLM1=AN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8404AC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 14:00:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 507C820772
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 14:00:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uNAWK8uq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729156AbgGBOAl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Jul 2020 10:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbgGBOAl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Jul 2020 10:00:41 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 087B3C08C5C1
        for <devicetree@vger.kernel.org>; Thu,  2 Jul 2020 07:00:41 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id f8so20027900ljc.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2020 07:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=hXyGW6kZgvxHDJQUuVRoK9cTD+MaH84M1UAASiIFcbo=;
        b=uNAWK8uqdsNBKcOmY1uiZrgxqQFKktM1Y/IUS79x8ncqdHy1+jhe18AtXQnUnEtqIN
         GaX59U4vdzoAhtfkkWvnaFn4glLFzaC6/CZUNkhNHJ8oPjLsDLh9a0oDwlFvom5r2CgF
         AZEKkArXJre3b+DV73VRepVFA5ZuIe64juVhPOzbTxqfsM9jtKVYwmY5NB+uDNhjL+QQ
         A8d585vaal7kyIxOTEVksalrIIG2zo7NtbZLkbqBT7l5DkTelsqT+rcJni7eBhXkRFt2
         inoY1f2url8advKkQEFf7Gs0tvWsw9EA+6oI0Qb6044ytNZIniX+55n0z89u78R3mIam
         Ocow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=hXyGW6kZgvxHDJQUuVRoK9cTD+MaH84M1UAASiIFcbo=;
        b=aR/E9Qb00QB/HNIxgOBYaJrsPCfvfxlL6CqtBP3JcHUeEqcFgfo9uLWVtiKE0y0zlW
         wtllq9QH2zpMIDXveGo5aBe/2yTT5ulQKnhSQIvolfyfk652nkOv3wmM7OXvABA1Hnrz
         CIWfuIshOA0DJj5xd1DwSBjfx6RqllPoWCFscX2vZXlkpKtMNJnQH303aWKEB+hr1rJs
         bRnXOpH4k9wFniYapqxAfosYdHrzjArcK6+0g+JRluEgz4mYmhr3t5w4H0Ed99DF2hhM
         kh9RrK5JmrC6VXhfziS2iqoHWFwIw3AaR5X8T5kpbs+UEHp+jYGymoEUK3iANy6n/yrQ
         zEZQ==
X-Gm-Message-State: AOAM530DgKiCwRXYLKZ0FnAukExXSH4PdhyNX3gEVc6PqgL7BTcFninP
        +bxmMjLnPJ9+85NX7qcmGcLvQszsR/CZkwdmrg4=
X-Google-Smtp-Source: ABdhPJwxdH2xi++na3Lpsy6Q/peDyzIjcZtUJSmiQyY6XOHc/irqFqZRKkmopPZqh/63mDZ5Ooea6IrcU9QZbfwx6pc=
X-Received: by 2002:a2e:a375:: with SMTP id i21mr12279623ljn.403.1593698436795;
 Thu, 02 Jul 2020 07:00:36 -0700 (PDT)
MIME-Version: 1.0
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 2 Jul 2020 11:00:25 -0300
Message-ID: <CAOMZO5B0DNuFfgYsiMLRg3eTvt7NsrvyznidwQzgQc=L_ThAxQ@mail.gmail.com>
Subject: Warning coming from raspberrypi,bcm2835-firmware.yaml
To:     Rob Herring <robh+dt@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>, maxime@cerno.tech
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

I am getting the following warning on
Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.yaml:

Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.example.dt.yaml:
bus@30000000: compatible:0: 'raspberrypi,bcm2835-firmware' was
expected
Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.example.dt.yaml:
bus@30000000: 'mboxes' is a required property

If I change raspberrypi,bcm2835-firmware.yaml like this the fsl,aips
warnings is gone:

--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -14,7 +14,6 @@ properties:
   compatible:
     items:
       - const: raspberrypi,bcm2835-firmware
-      - const: simple-bus

   mboxes:
     $ref: '/schemas/types.yaml#/definitions/phandle'
@@ -48,7 +47,7 @@ required:
 examples:
   - |
     firmware {
-        compatible = "raspberrypi,bcm2835-firmware", "simple-bus";
+        compatible = "raspberrypi,bcm2835-firmware";
         mboxes = <&mailbox>;

         firmware_clocks: clocks {

What is the proper way to fix this issue?

Thanks
