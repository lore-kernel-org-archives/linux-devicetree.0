Return-Path: <SRS0=58Ja=6S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22980C28CBC
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 02:31:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E75682071C
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 02:31:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qam7d7US"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgEDCbD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 3 May 2020 22:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbgEDCbD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 3 May 2020 22:31:03 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09CE1C061A0E
        for <devicetree@vger.kernel.org>; Sun,  3 May 2020 19:31:02 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id q206so7285946ybg.1
        for <devicetree@vger.kernel.org>; Sun, 03 May 2020 19:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3m8mFiJJFlls0jL7OldEMji7AwjJiliGvx/P5K33AUs=;
        b=Qam7d7USzlv+nj5JiT4AM+NhxY2pit1lpFFzMzzpFkVwdtg3nmwuWRwCXDWJH7UTCS
         x69ZenAa675bWnkgRa+Btm0vcXiHS57r2Wk3ChqV3wQhT2iCv6bbH0ZHMLEjdtB0/8z8
         KJ7p5o0Yf6hdC9Cs3Cn3jwmAGzXNQX0EgTKhLYbZF8w5MdBHPuR3KPz2Uwpi2rEEQ4Qw
         AHn62bvcwgrRqNr5rcrpMMaGtbuwXP23ivbTX+drIdyxLH+9GfryQlqWliryy3jkPD4l
         6Giwr3SKri3tu2c/jqoNkm327x+rfBX0Ba9Gi+uhFrHuBE8cBv51uUY52ipJ2AclJdP+
         1pUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3m8mFiJJFlls0jL7OldEMji7AwjJiliGvx/P5K33AUs=;
        b=skQWal7RkYlqCDsZvEPfQ9nKf7QdZ6eLShkPjCbQ6aWLPhPH9iXgb1GiVZMo3/VL6F
         n/F8wliQL6XzgBRt2R4GnA9P4MyomkuAWTk90oEKMzFNpmllWYvVey1yZPneWNjb84Vl
         sAyg5+IBrUVfILUjBW5rIvIPX4WjEqo+nFPyVYstXNl+Zc0xWdQnYeHlG1J+WiYt/wTv
         lSuWd5ybL80WJg178LVY6UIunJ7MHnbl0D7zh1kjAvKxfyk8IF5i45/hlxSgUjUJFtTm
         tKrehp5nTUlyVetRuGa9cVcHUOaun4BLMyT4gkFOX/yMUL+SG0UVKWizypjA3NYAkOWC
         4RQA==
X-Gm-Message-State: AGi0PuYA0l3ihXMxPOSqNP9uICtJdrs+fbPOdpKWxYJMyrsxWeEfIPBV
        VQS63/psN1M5qrYEryulyT2eRETKU1nSwiuvLLJL2YWu
X-Google-Smtp-Source: APiQypKtla2fm9tiFGvO50LdmQ10uZzynXifTZAffJJJidPcN+crNXe2O1fKBX8P5LCczAR8Y4eETM9yvTFDHfLdR3I=
X-Received: by 2002:a25:eb09:: with SMTP id d9mr11084216ybs.237.1588559462150;
 Sun, 03 May 2020 19:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200430222439.0ae1c4fa9572c8487fca96b6@linaro.org> <CAK7LNAS7U-SxEhsdfAr=ioOP0DGksTWhW1hDVA4AN8a6YG-t-w@mail.gmail.com>
In-Reply-To: <CAK7LNAS7U-SxEhsdfAr=ioOP0DGksTWhW1hDVA4AN8a6YG-t-w@mail.gmail.com>
From:   Masami Hiramatsu <masami.hiramatsu@linaro.org>
Date:   Mon, 4 May 2020 11:30:51 +0900
Message-ID: <CAA93ih3DpajKf3CcVXo=2E3KM8WFbFmEwb2uwLo4rapsiU3Mxg@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] dts: uniphier: Add Akebi96 Board support
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

2020=E5=B9=B45=E6=9C=884=E6=97=A5(=E6=9C=88) 10:22 Masahiro Yamada <masahir=
oy@kernel.org>:
>
> On Thu, Apr 30, 2020 at 10:24 PM Masami Hiramatsu
> <masami.hiramatsu@linaro.org> wrote:
> >
> > Hello,
> >
> > Here is the 5th version of the patches to add a devicetree for
> > Akebi96 board.
> >
> > This version removes redundant setting of RGMII, fixes some
> > parameters for max3420-udc node and add the address to
> > framebuffer node name.
> >
> > The Akebi96 is a certified 96boards which is based on Socionext
> > UniPhier LD20 SoC. Most of the part is similar to LD20 reference
> > board, but there are some changes.
> >
> >   - MAX3421 USB-SPI chip on SPI port3 (for USB gadget port.)
> >   - Simple frame buffer with 1080p fixed resolution.
> >   - I2S port which is connected to aout1b instead of aout1.
> >   - 3 serial ports, only serial3 has CTS/RTS.
> >   - No NAND, only eMMC on the board.
> >   - OP-TEE installed firmware.
> >
> > See https://www.96boards.org/product/akebi96/ for details.
> >
> > Thank you,
> >
> > ---
>
> Both applied.

Thank you so much!


--=20
Masami Hiramatsu
