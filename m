Return-Path: <SRS0=ps6a=V2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-io1-f42.google.com ([209.85.166.42]:39625 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfG2Ib2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jul 2019 04:31:28 -0400
Received: by mail-io1-f42.google.com with SMTP id f4so118191359ioh.6
        for <devicetree@vger.kernel.org>; Mon, 29 Jul 2019 01:31:28 -0700 (PDT)
MIME-Version: 1.0
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 29 Jul 2019 10:31:17 +0200
Message-ID: <CAMRc=Mc_9=3xYWrrn=naQgFprgLA4wkNJQE1niSiYiACi5XFiw@mail.gmail.com>
Subject: DT yaml bindings: handling of complicated compatible property
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hello,

I decided to attempt to convert the DT binding for AT24 EEPROM driver
to yaml and am not sure on how to handle the compatible property with
a lot of options.

In at24 we support 23 models and 8 vendors (184 vendor,model
combinations) plus 5 exceptions (with model names not following the
general convention).

Do I simply use the oneOf specifier and list all possible options? Or
is there a better approach.

Best regards,
Bartosz Golaszewski
