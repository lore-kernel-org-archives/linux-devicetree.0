Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48951C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 07:37:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20DCD2076E
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 07:37:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lJ9q1usP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgHRHhL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Aug 2020 03:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgHRHhK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Aug 2020 03:37:10 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C624C061389
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 00:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Message-ID:From:CC:To:Subject:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
        Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=Tuui4JKywOGQP//vjZ5uTcHQ/MsFtjm89enFy1ffrY8=; b=lJ9q1usPa0OPMfcT+WTeY3aNOC
        FwNmgE+/6QiX3F85eiFyl8rzB1t9wKlbdvR8NpJbxTpr9F4q8Szv1jB/+UmsJ0zvN4dET/AzXfaZZ
        +Rn/TPzAB3Qz/RcQPxRhBZftG8u1q3SQI6LRT+BSCZYfrIo1/1e9Ng2gioZxmADmknanZKuxTuMNA
        +3zRLTgZPk4jKbT2mj9cnkt2hWPsZly3IvNFjKy3hP0cpnRW8u1gKZqVYOOxhkVs93KdcYYcW8KHE
        NoL6UfkKbdLIqiXo8/Oj37NJl7QcvGrCalv78ps0ZUnjdgEhdPgOVBNrNlNL9bj4C8Pg8jAKTJyfM
        i7b3TZJQ==;
Received: from [51.219.137.136] (helo=[10.0.1.19])
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k7wAy-0007EV-HN; Tue, 18 Aug 2020 07:36:57 +0000
Date:   Tue, 18 Aug 2020 08:36:55 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <trinity-bbc9a618-a916-40bb-b144-bffe715646a4-1597734987449@3c-app-gmx-bap75>
References: <20200807082754.6790-1-linux@fw-web.de> <20200807082754.6790-2-linux@fw-web.de> <trinity-f5a5deb1-c123-44d7-b7ca-1f7a8dbe1c1c-1596889651064@3c-app-gmx-bap69> <CAAOTY_9o_hBWxWBdDoeeJ6zuV4rb4R_yEoN5+L0uHBGMw4Kduw@mail.gmail.com> <cefc273c226c93c605f4dc76afa9eb5aacceaf26.camel@infradead.org> <trinity-bbc9a618-a916-40bb-b144-bffe715646a4-1597734987449@3c-app-gmx-bap75>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] arm: dts: mt7623: move more display-related nodes to mt7623n.dtsi
To:     linux-mediatek@lists.infradead.org,
        Frank Wunderlich <frank-w@public-files.de>,
        chunkuang Hu <chunkuang.hu@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     devicetree@vger.kernel.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
From:   David Woodhouse <dwmw2@infradead.org>
Message-ID: <5EB39D93-57C0-47AD-B0F3-09AEE643CFBF@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 18 August 2020 08:16:27 BST, Frank Wunderlich <frank-w@public-files=2Ed=
e> wrote:
>Hi,
>
>i rebased changes to 5=2E9-rc1 [1] and include parts from Davids Series
>in my one=2E
>
>David: is it ok to squash your mali-commit with mine moving the other
>display-related nodes and use me as author?
=20
Absolutely=2E Can the U7623 patch go along for the ride too? Was there any=
thing else you weren't including?

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
