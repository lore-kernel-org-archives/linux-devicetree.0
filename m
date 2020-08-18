Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B14C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 07:45:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9E3A20738
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 07:45:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="i6WRLedk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgHRHpe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Aug 2020 03:45:34 -0400
Received: from mout.gmx.net ([212.227.17.20]:53699 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726582AbgHRHpd (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 18 Aug 2020 03:45:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1597736703;
        bh=ap693LLFeqKCPEJc56ThJpeeYc97CmzfomkRjHhl5Lc=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=i6WRLedkh61h9EWnwL8+agH/ZhPLFobT8LQwX97RutWb02W8g51ojjqea5SoSJgRp
         pSQiyHg4h+JQz5eDzRZs1LxBH/TqxomEq3UsfPl502I8Lh6YYHHTrIMneUNuc4cb8e
         5CDlAxNeLU+UJvNobxpV58kb6BG/AZiC1d5daxlg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.53.43.192] ([185.53.43.192]) by web-mail.gmx.net
 (3c-app-gmx-bap75.server.lan [172.19.172.175]) (via HTTP); Tue, 18 Aug 2020
 09:45:03 +0200
MIME-Version: 1.0
Message-ID: <trinity-8b2a2966-9e61-4617-9cdc-fa496cfdd1af-1597736703797@3c-app-gmx-bap75>
From:   Frank Wunderlich <frank-w@public-files.de>
To:     David Woodhouse <dwmw2@infradead.org>
Cc:     linux-mediatek@lists.infradead.org,
        chunkuang Hu <chunkuang.hu@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org
Subject: Aw: Re: [PATCH 1/2] arm: dts: mt7623: move more display-related
 nodes to mt7623n.dtsi
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 18 Aug 2020 09:45:03 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <5EB39D93-57C0-47AD-B0F3-09AEE643CFBF@infradead.org>
References: <20200807082754.6790-1-linux@fw-web.de>
 <20200807082754.6790-2-linux@fw-web.de>
 <trinity-f5a5deb1-c123-44d7-b7ca-1f7a8dbe1c1c-1596889651064@3c-app-gmx-bap69>
 <CAAOTY_9o_hBWxWBdDoeeJ6zuV4rb4R_yEoN5+L0uHBGMw4Kduw@mail.gmail.com>
 <cefc273c226c93c605f4dc76afa9eb5aacceaf26.camel@infradead.org>
 <trinity-bbc9a618-a916-40bb-b144-bffe715646a4-1597734987449@3c-app-gmx-bap75>
 <5EB39D93-57C0-47AD-B0F3-09AEE643CFBF@infradead.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:85BOu6BZdj2Wig1BiNK0aOOhPHhkbzUQavsJfIXv/VN9miFbvhQHTt6im8lCBMQ+0oeEh
 ulmrdb/qo9PZvIVceuhKSdzs1AwzuG3BlQu1U7nIKN8i83ItITsAAddk7nlIBOH3yzpz5+513U/i
 SNIY2EIoMsHRr0Ie7x0Y4AwbaqlOwtk26v8oAm463L+J4RSdi57ZXMdd8qlGrUeRx1p3yBeUaTJf
 BwmKDZbBDGdxpUrHoCgn8BohE0r2ZKbEJ8/M3M5a25LQVVOEK2lTGVNnJXBmK+7Jjlb1ts7L5hjx
 jA=
X-UI-Out-Filterresults: notjunk:1;V03:K0:s0ZG40dufYo=:hcHuqQMJtbMsOT9VqYBWd1
 5p/sXKqEySlXE7TBgaELLBeCDvBjzNy77c0v6XFV8OKM2TKRv+vxm8n8FxDkg02DJLze2XBt3
 cVJk3BKRNUWpFhvPOsv6nYjHqh+vzFEnDyhoDEvnuefRBNMoUsbwj0FB66OTnrPAxHlzv5n63
 12Vgg3CEqm2EAwXuO+K9A2gLbsMWV07KDVal8mgs+OMKvZ8GrgBfX/7WTlvkjj3v6JbIQmlQV
 huKSm0Gv+khQbdmAQThhd/klkRxRDDd8FEb6R5wl/9m9O3uGA1x5FkrIlPdr783oS4t4/Y/mp
 qwQkDUbuvyRsnR69V1HyIDZKMi8FuwofVnmZRgo1WqcviPLJW3PQKvVU1qh5/aIwnfrg1kin+
 vaNpUy9F5TspjPhlTf35KlZaQL56V9ATB1tKKKCHZoxvzOPIBpu7kST+iFyynL8aGT9sQTLrE
 jo98IAxuOET+LR16X7KNHuTGKGVPTTQnlerA0ogW2r2IoEce9z9WvthgXLEgKJYi5XBdQV7H+
 Nav2yK4ObULITv0KiYDRS9Pj69sPz2vO5ILFZLgv2AijdZpOZocWqOxK56CDdCu7TTeM0l3/Y
 dWbjLri1EvnJoSw51SJtecsfoegvllfufY3SCqaKRftqz77GtRaxdEaAfj7mwZ/gI+plZngd5
 Aw8siV1RZxJMrvJkn4npHJgzkq85+7yHb3Xy3Ksxi8iV55NKpBZFeDG9MotsEI8OwVOM=
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> Gesendet: Dienstag, 18. August 2020 um 09:36 Uhr
> Von: "David Woodhouse" <dwmw2@infradead.org>
> >David: is it ok to squash your mali-commit with mine moving the other
> >display-related nodes and use me as author?
>
> Absolutely. Can the U7623 patch go along for the ride too? Was there any=
thing else you weren't including?

i did not included the mt7623a-patches because they are not related to my =
hdmi-series ;)
but it should be easy to add them on top/separately

regards Frank
