Return-Path: <SRS0=eKwZ=3A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B72C282DD
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Jan 2020 20:54:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B2776206ED
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Jan 2020 20:54:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="dEMbuvbf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731300AbgAKUyr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 11 Jan 2020 15:54:47 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41593 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731297AbgAKUyr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 11 Jan 2020 15:54:47 -0500
Received: by mail-ed1-f67.google.com with SMTP id c26so5015065eds.8;
        Sat, 11 Jan 2020 12:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0OTy5bWu7ituTAMunYtNOtrElBjU8L+HwcC81VLSIUU=;
        b=dEMbuvbfWaeBtraw9zZnV+PFA3wKM6TgNhF/CzZBEfd1V8JUoS92jT6VjaJCrE9gXo
         AdA397m17nAsdbmHVzi/A54qDJGQkvCBDk0bzmkxK2xgkE8o1Y0YJ+7UD05EcPSpw5iq
         pWo0pQUZHHNAF51LhyEka/D/egFoXXB4bkAlTV1UDiuVSMGjJjMxiZGUvC5C3R5jD7tk
         wVdpcnNhF63CQHqqspIQbn4FMtAkNO7zNIWh6k9IEb/cfocRUIsu0e2abEycx5O+DdB4
         +kpfzn44pjqdPF4vqydMOPR69Ph2Pf4Rq4DDnJlYgKDIKnUXlhsXpF8lz1u5vH8jwda5
         6fAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0OTy5bWu7ituTAMunYtNOtrElBjU8L+HwcC81VLSIUU=;
        b=kKoEmdj4igeD/18wLvB8jBOzb/fX8oVQbkvWzaG/umEDPmDBPNJ9PAmXcQ8M8nDYn5
         atg2SFEyAPcd+JuSBUMXVzmxsEE6tC6FvImpYM4HQgD/ZyUrgpWRcgReF+Yq/xoTBvde
         ErxpsdBZg8JxMHL6He9b3cxCJOXn8Odnv99GHSI5J2TuiMZZ5DXvIHaVX+AA3ZJGU+Wd
         tAN6e7zw4C1vvIRXqd8XpBvPSvQa8vonQ9LfXoGEEAMBSpSMi+ty7zMps8n0/NN/xPga
         i5kXLLeE8am9vCEBNEFvHxd7CQHVtJnbnZYLpUj5gna6EpFOgeSzjLgOmv0N9kKb6dCe
         iqww==
X-Gm-Message-State: APjAAAV3cLVxFylTOTQDlY/jfX7erM3OT0gclAkzUNMmdye9a3HCmUuq
        CVCCfVn/IkkEvYZOCWI6gxk/FEj167isiM/yp3A=
X-Google-Smtp-Source: APXvYqz0LCEetCL0C26+oJCqz1q7IMN4akVRCVVYqX4oiFOSFM3JsgRptl38/YKtB70YcL7gMACFa0zGeMazXQEl06o=
X-Received: by 2002:aa7:d511:: with SMTP id y17mr9783140edq.41.1578776085155;
 Sat, 11 Jan 2020 12:54:45 -0800 (PST)
MIME-Version: 1.0
References: <1578634957-54826-1-git-send-email-hanjie.lin@amlogic.com> <1578634957-54826-2-git-send-email-hanjie.lin@amlogic.com>
In-Reply-To: <1578634957-54826-2-git-send-email-hanjie.lin@amlogic.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 11 Jan 2020 21:54:34 +0100
Message-ID: <CAFBinCA-w6GnPzFCbmUFNrOY3PeW3=74+ToC9CvXoSAWoe+VLw@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: phy: Add Amlogic A1 USB2 PHY Bindings
To:     Hanjie Lin <hanjie.lin@amlogic.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Yue Wang <yue.wang@amlogic.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Hanjie,

On Fri, Jan 10, 2020 at 6:43 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
>
> Add the Amlogic A1 Family USB2 PHY Bindings
>
> It supports Host mode only.
>
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> ---
>  .../bindings/phy/amlogic,meson-a1-usb2-phy.yaml    | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
there are only two differences to the existing
amlogic,meson-g12a-usb2-phy.yaml binding:
- different compatible string (the existing binding already has an
enum, so that would be easy to extend)
- new, mandatory power-domains property
(Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
has examples how to make properties mandatory based on the compatible
string)

have you considered merging this with the existing
amlogic,meson-g12a-usb2-phy.yaml binding?
this is not a "must have" in my opinion, I still want to hear your
opinion on this topic!


Martin
