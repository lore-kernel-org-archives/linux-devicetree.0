Return-Path: <SRS0=Evye=3H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 114FBC32771
	for <linux-devicetree@archiver.kernel.org>; Sat, 18 Jan 2020 22:05:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D7324246A8
	for <linux-devicetree@archiver.kernel.org>; Sat, 18 Jan 2020 22:05:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="rrWBZd43"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgARWFy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 18 Jan 2020 17:05:54 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38383 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbgARWFy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 18 Jan 2020 17:05:54 -0500
Received: by mail-ed1-f67.google.com with SMTP id i16so25881496edr.5;
        Sat, 18 Jan 2020 14:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IZo36abDKqjdvzc5GwhroDqR39xgOE1dZtSOdvhsHaY=;
        b=rrWBZd43dKN2kOfO+ejr5Z7+dyqYVVj50e+wGMqTbZBEstOVS6YXQyRUpr0Y+7R5h9
         FjlQICJh7caGHGRWzQpSCOqXZUnhH6y2uHCnal9eJNho/+TEdrP9BNWZWERYWrrlJVq2
         BEDYyjW6IgnNOM1Qov5RBgUBP6gAByvEzSGyUMV9Yg3aXnxU4WKsfMdB3ZeiHsuNCTfU
         ikTwlAJcNycKOPvnbJ7sIKy3vHNuReSSHgSASLXzfJRbNPt/zeDkqDkWEgO35WzvZsYL
         vTzVHHy44Ism6FVpp8/k7o81pySIKU2xH2qxB+KrRC8I8j8+cO8bROIyf7qokKdW9ViY
         vDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IZo36abDKqjdvzc5GwhroDqR39xgOE1dZtSOdvhsHaY=;
        b=qy4zv2EA8y79O11H6Vjqv3CVAPFJtlkvG7RkertY1Z+XjrHt76Ogedp8zmacyBSokO
         0zxgWn/cotRhkhY8uW430Xq3pjGmWo6aTGmOrIBdkDkeZPJg2KHiVnieUhmYTDcCOfN+
         uNDXHU3gIEgAgAgt54k3J/VNskOr6BEH+bSzej2K41PE4suh+CWt+zO8FDHxEAUyfivc
         h3d65BBKzmxN7zYEyGOI/hjXcBl6Hp6GOZxdQrc5B+PazR24AWqiWfh7x+NPGaufTw7k
         zvyxdA+6SF1aUAw7VkrDIFT1OsUSRCSuFW9RFwdiLqmiODlEBn1H7MQiUqbLHfbDThLu
         JQ5A==
X-Gm-Message-State: APjAAAULdS2/aBZUKRot99qigpDPFdbqimaFvD7ZpsUXamjWygt85RtW
        YqGduqWbRX5PCzBKUcmHMjKZGjCcf/cjHiLy8XHNL8gO
X-Google-Smtp-Source: APXvYqyNH1kS9f9T6kQko9VTwsuHR9OgAGx0Ogkz4TN5x/HgDfDbqpYogNZD1zO4DAwEf3ZVTRNcAK5Ra6gnLeWPTDs=
X-Received: by 2002:a17:906:90c3:: with SMTP id v3mr14156897ejw.30.1579385151960;
 Sat, 18 Jan 2020 14:05:51 -0800 (PST)
MIME-Version: 1.0
References: <1579220504-110067-1-git-send-email-hanjie.lin@amlogic.com> <1579220504-110067-6-git-send-email-hanjie.lin@amlogic.com>
In-Reply-To: <1579220504-110067-6-git-send-email-hanjie.lin@amlogic.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 18 Jan 2020 23:05:41 +0100
Message-ID: <CAFBinCD9iwBHYArqU55kg_uG3xc=JnL=F1P0KW1+6BP2xHoN0g@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] arm64: dts: meson: a1: Enable USB2 PHY
To:     Hanjie Lin <hanjie.lin@amlogic.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
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

On Fri, Jan 17, 2020 at 1:22 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
>
> Enable USB2 PHY for Meson A1 SoC.
>
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
personally I would squash this with patch 6/6 because it's only useful
together with patch 6/6
on the other hand: it's not worth sending a v7 just for this

> @@ -100,6 +101,18 @@
>                                 #power-domain-cells = <1>;
>                                 status = "okay";
>                         };
> +
> +                       usb2_phy1: phy@40000 {
> +                               status = "okay";
we typically use one of the following patterns:
- status = "disabled" in SoC.dts
- status = "okay" in board.dts whenever the peripheral should be used
(example: I2C, USB, ...)
OR
- no status property if the peripheral is mandatory on all boards (for
example: clock controller, ...)

so for consistency with other Amlogic .dts I would either drop the
status property or set it to disabled (and enable it in
meson-a1-ad401.dts)
same applies to patch 6/6


Martin
