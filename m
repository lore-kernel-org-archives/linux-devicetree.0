Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC70C33C9E
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 22:47:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B17A2080A
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 22:47:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g0z+DSnk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgAFWrM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 17:47:12 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41077 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbgAFWrM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 17:47:12 -0500
Received: by mail-lj1-f196.google.com with SMTP id h23so52646111ljc.8
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 14:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iINXiMFidNPmE7c3AtxT3THDZ1hEuF3OMM13Pg6sk6w=;
        b=g0z+DSnklv6iu5J3Afvb/fXFAHDuKf7PzDA3LoC2ygbFu0coxpdCIpffPdp82RveZi
         cxryO/aUuIb0EuNFY1w/n7kDCOM7UzXHAV0vuSths54Yk3/4ciJbNe0FhvUUW2KJSGzu
         AMY4hSpKCEmEOOMceh+ndpGA/p1Jl+K7DK8G8Y2RWW3VXr77AbKNU+2h1w6vO9VxpY/6
         IEfb2xnPwuQqLNBwdriTJsu5OLJ4oxpyLDAtNH83LXZopMOmpJRnqlwKBW+rHFlbMncF
         UI3c4G4AVCT8yI4HVpksGA9rdtH0CrgOQBk+zoJEPb24vN3aVTasxKrKGAWkQjxKMCPv
         CKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iINXiMFidNPmE7c3AtxT3THDZ1hEuF3OMM13Pg6sk6w=;
        b=e/1mZOORNf2j0jcgaihfuH66aWFv0Yp3RkFP8zr9whI+dBL2VrPQYohLDgVAUZA8NU
         4lVddK8nApK4toM9cCVhZwh9waY+DcOncr3WmzucQdp340QumqNqrw00Gl5nQw6pr6vL
         7pmD/+NWo5IlqsPUO7w4mX7GT3JYgTnyPZ8cJZq/SEajTuM8oWWVs+PagdUKh2UMapGe
         4W0q7pDRmBSPe/NEsEWGx30FX0zmwkaoL5yRr0K0M372TS8TGcZ+j3NQbz9slfpebGIC
         p/P0PwTXgiQvr0/NdlRxOZDH177rN64YNz5IAs+kv/V7+yqOp5YiNS0wfE+X+jvKI1md
         dNHA==
X-Gm-Message-State: APjAAAVAQK3+9mGp4+y6SP8bmZxpcStrLcnhCi9Jl1ObeOinp8F9BPQ2
        GNu4BaaTXevyAvp7xUbwF5hGCvuc0wBNRtg7vQXMtw==
X-Google-Smtp-Source: APXvYqyb4+z1PnlvO0PT0IM3lRyC4AM5S5O/rRzCFuE2xIcizWcFowXRhyD9waT90956XcAyA0plvbvrQ5LOJyWoZwA=
X-Received: by 2002:a2e:86d6:: with SMTP id n22mr50441415ljj.77.1578350830450;
 Mon, 06 Jan 2020 14:47:10 -0800 (PST)
MIME-Version: 1.0
References: <1576426864-35348-1-git-send-email-zhouyanjie@wanyeetech.com> <1576426864-35348-2-git-send-email-zhouyanjie@wanyeetech.com>
In-Reply-To: <1576426864-35348-2-git-send-email-zhouyanjie@wanyeetech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Jan 2020 23:46:59 +0100
Message-ID: <CACRpkdbfZjqd_ChPhX52wwu56TwXQJhHyUvRVRKw6WUD33utCw@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] Fix bugs in X1000/X1500 and add X1830 pinctrl
 driver v8
To:     =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Paul Burton <paulburton@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Mark Rutland <mark.rutland@arm.com>, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Dec 15, 2019 at 5:21 PM =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)
<zhouyanjie@wanyeetech.com> wrote:

> v7->v8:
> Separate the part of introduce reg_offset in [4/4] in v7 into [3/5] in v8=
.

Patches applied. Sorry it took so long.

Yours,
Linus Walleij
