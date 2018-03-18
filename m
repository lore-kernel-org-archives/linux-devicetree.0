Return-Path: <SRS0=p4ib=GI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:33870 "EHLO
        mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753813AbeCRODK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 18 Mar 2018 10:03:10 -0400
Received: by mail-oi0-f49.google.com with SMTP id u141so372969oif.1
        for <devicetree@vger.kernel.org>; Sun, 18 Mar 2018 07:03:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180318124829.kiiei2234jndt3fb@rob-hp-laptop>
References: <1520701581-3650-1-git-send-email-festevam@gmail.com> <20180318124829.kiiei2234jndt3fb@rob-hp-laptop>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 18 Mar 2018 11:03:09 -0300
Message-ID: <CAOMZO5CJMHD=ibBGfx0Ttr7RoTryA0VTMrZ=UNqT3dhjzb+XYg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: ifc: Fix the unit address format in the examples
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

On Sun, Mar 18, 2018 at 9:48 AM, Rob Herring <robh@kernel.org> wrote:

> This "fix" is wrong. Memory controllers with chip selects should have
> the chip select in the unit-address. The correct fix here is you should drop
> "simple-bus".

Thanks. I will revert the change and will drop "simple-bus" as suggested.
