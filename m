Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 285F0C3B18F
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 10:16:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA1A424649
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 10:16:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C7y7H4jy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729070AbgBNKQv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 05:16:51 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35398 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729156AbgBNKQv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Feb 2020 05:16:51 -0500
Received: by mail-lf1-f65.google.com with SMTP id z18so6406927lfe.2
        for <devicetree@vger.kernel.org>; Fri, 14 Feb 2020 02:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vmPFCYNd1b2Z269i3yTjn10KuJ/1yAN0FqONO4h3pYM=;
        b=C7y7H4jylEuEqMnGjgmT+H0M+h+femEJMIBzMgfB7vWd7xinxGtIWg5hjzVf97k5By
         81ichhlUxUcuE+gpzED+ObhW/gJUHJCXo9IIp0boG22bOraAX3BiBoHIYn9P8GpiYb8Y
         QRQCmU1ymbZCh4V933PSIeteImHsjiS8L3DcSHjmaCO869J2GUR2ocJ3uJW3Vy0CZvjo
         /SYd2V8GNZmLcti0/RWd8v9JbipZczwBq2DRNBnUskpwoxjESHOuZtbINP1ZI+8y/1XW
         kLzA7hV1HtTwhzhSMGIt+CelSr4UakLg/+G+0mSoxzCNAUYw2DrXYG8T4gXZjRjCKV+S
         m9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vmPFCYNd1b2Z269i3yTjn10KuJ/1yAN0FqONO4h3pYM=;
        b=FXVTXXZhTqD5op/QXyaMF7pZ40+GUEO5dI2xxd4I7ml41yhhdJ1xkBIFFfon9eGoee
         E47CJQLG6Shamt/UPy+SjW30g6OUPplpvTLwwEKW1YLxD7x/Pj+J8z0d8dX4xbLZTziu
         BYCtrDtMZPorfKuZ0zahXk2tn5wBR95V9Bt+Lh/qrURsV9Qcy7XX5sslD77BFhuzj+A0
         V4mMWSraTQvjrFNyaXCMwYp39HnFx0LNAacXgFOKTifcQGDvXv2TIObNIUO4fs6Mt8oi
         nFFdnTOcr2g7BGdN5iaIO1I13QedblvOf3MTn7xea3+3WUNdVEoT8WgvG6Cz+h+YwXNT
         bHOA==
X-Gm-Message-State: APjAAAX9y17YF66e6LdJct0xQRT7gE/2P1wydaWxGSmg7sjTjgjD/wNv
        EH2/oPMbTYIzXitRgFof0H+g4A3J/WH39SQsAyR+ig==
X-Google-Smtp-Source: APXvYqy3A2UvE/PunEwc9b95paj1uRKlANgXjihOMn+iQGFlsaa0yHC/L21T4dFZZ7k9amkC+MY+YUVX95o0/o8skaU=
X-Received: by 2002:a19:dc14:: with SMTP id t20mr1309882lfg.47.1581675408867;
 Fri, 14 Feb 2020 02:16:48 -0800 (PST)
MIME-Version: 1.0
References: <1579439601-14810-1-git-send-email-sricharan@codeaurora.org> <1579439601-14810-2-git-send-email-sricharan@codeaurora.org>
In-Reply-To: <1579439601-14810-2-git-send-email-sricharan@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 14 Feb 2020 11:16:37 +0100
Message-ID: <CACRpkda8XLZxqH9CROHUYpaq8z+z2zsdg8pyzqQ9DfavGMy6QQ@mail.gmail.com>
Subject: Re: [PATCH V6 1/5] dt-bindings: pinctrl: qcom: Add ipq6018 pinctrl bindings
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, sivaprak@codeaurora.org,
        Rajkumar Ayyasamy <arajkuma@codeaurora.org>,
        Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Jan 19, 2020 at 2:13 PM Sricharan R <sricharan@codeaurora.org> wrote:

> Add device tree binding Documentation details for ipq6018
> pinctrl driver.
>
> Co-developed-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
> Signed-off-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
> Co-developed-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
> Signed-off-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
> Co-developed-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
> [V6]

Patch applied  for v5.7 with Rob's Review tag.

Yours,
Linus Walleij
