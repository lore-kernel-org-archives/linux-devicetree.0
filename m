Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FC9C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 07:17:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FD8D205CB
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 07:17:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="lh4ywpSP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgHRHRR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Aug 2020 03:17:17 -0400
Received: from mout.gmx.net ([212.227.17.22]:55143 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726203AbgHRHRQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 18 Aug 2020 03:17:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1597734987;
        bh=oAd2cewFPaqUFLZ825vpetOfnNifBeng1WfOCc45x7o=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=lh4ywpSPgTuw2+vKtgXZiBpwaHVsXoWsPYpFSQ5yTaca5iVHubtO2j+pUlSZ+aYLB
         EJ7D6oCT0ibJ5pMymMDm7GDF/aRyZMxMJ4rj9GjhoDyiGSdTUBmg8LhYgdKESQKxDc
         csduBV8n1+LYWN02Vf1EEBmq2/kHQhlhB+f83JLE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.53.43.192] ([185.53.43.192]) by web-mail.gmx.net
 (3c-app-gmx-bap75.server.lan [172.19.172.175]) (via HTTP); Tue, 18 Aug 2020
 09:16:27 +0200
MIME-Version: 1.0
Message-ID: <trinity-bbc9a618-a916-40bb-b144-bffe715646a4-1597734987449@3c-app-gmx-bap75>
From:   Frank Wunderlich <frank-w@public-files.de>
To:     David Woodhouse <dwmw2@infradead.org>,
        chunkuang Hu <chunkuang.hu@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     devicetree@vger.kernel.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Subject: Aw: Re: [PATCH 1/2] arm: dts: mt7623: move more display-related
 nodes to mt7623n.dtsi
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 18 Aug 2020 09:16:27 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <cefc273c226c93c605f4dc76afa9eb5aacceaf26.camel@infradead.org>
References: <20200807082754.6790-1-linux@fw-web.de>
 <20200807082754.6790-2-linux@fw-web.de>
 <trinity-f5a5deb1-c123-44d7-b7ca-1f7a8dbe1c1c-1596889651064@3c-app-gmx-bap69>
 <CAAOTY_9o_hBWxWBdDoeeJ6zuV4rb4R_yEoN5+L0uHBGMw4Kduw@mail.gmail.com>
 <cefc273c226c93c605f4dc76afa9eb5aacceaf26.camel@infradead.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:1zwmta4pmD/tPLfGTCCkcWs2zRHllJCy6YJ+kiLxsZskXTnr6VI37DUYsFlii4Xb4L08W
 f2dRJpeQO0Xs1eLFfAzuNdy11GpFvoPIlEnBL0LGojAuTwkkdU4u9mDaJ53bY//epXuPgtboJj5e
 wvDFl4BGFQ/pR+khAiwc/2oyW5ZZEormFDLxWYj3P807hxx03892Jyud3Sbff7fo8/rtF9LtPCgf
 PXbFKcG9T23FVEUswYe0ufzVDzP0VnJL8QnXAhUqz94I8tYigJUPnMKNmQGVIm6NKBE/5NvuA2Qx
 JQ=
X-UI-Out-Filterresults: notjunk:1;V03:K0:+cfbgQjm7mI=:SgaOEzSXg+wCJWY5AoxjuP
 otZlxD2w7vmKWZ0OW8VcgB5OgLlWU/wmglcguOXtoDxp+A30SPlQ2PV3NapgExPgxnMkz1PVH
 +lSPdQOfVlKm77RKjzy2JfzQXm1lTm7mfbOfEl4srcL37dLSvM10l+qRv5djodSPI5jUWZO4q
 BzD726N7/qJHoTmMNIaT4Ons7mokzH66J4WNsihDxmehoDi28uBXOxTippUEXXwXLyJlvK/jr
 fv1l/UO5uSeDX9HROqOSHa1Tg7qBBWcCUt0MZL3w/r5xXuMvif67tqtal/AvGspe20BS7UgYm
 +S+jPblDaSLwTd1rT1YIwmka9FRyomNcyoql6ldmvJaLmBedNTlX5py3UYBYnJVT3BPHQ4PF9
 TMT86q/MJUsHxmtLf8NT3wpw8Mje/RwpUiD92s8b2o6md2cZbJ99h2jwheFqq/eQmBeUCUojt
 VUfhOd02amsMdKJS6dwghPXAh3DU+6WNwULDJQmZD8pMCeU4fBcoJCEZuyCXCZBMKGNYaINzI
 gMjau/hDHSBhztJViUijPQHUyOlZ+qR7sL7S0y+8k9fSvZoIU8X4ddcCAYHfz3gZtxQ+vTKNX
 hCngHwksomg/alFbQ+w6B+362elm6LNU7wOIChRHZAroRphhwlVxSHl3YCwvi1Vx/2+6pDUiH
 W02yOGvfIT0+bGM+JSu7/PXsNbI0yN9aNzyJ9cN8P85Mbm35k2ZA1qJ6UPmX25EnZSnY=
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

i rebased changes to 5.9-rc1 [1] and include parts from Davids Series in m=
y one.

David: is it ok to squash your mali-commit with mine moving the other disp=
lay-related nodes and use me as author?

CK Hu/Matthias/Ryder/Sean: is the structure of DTS ok now?

regards Frank

[1] https://github.com/frank-w/BPI-R2-4.14/commits/5.9-hdmi

> Gesendet: Montag, 10. August 2020 um 09:48 Uhr
> Von: "David Woodhouse" <dwmw2@infradead.org>
> Betreff: Re: [PATCH 1/2] arm: dts: mt7623: move more display-related nod=
es to mt7623n.dtsi
>
> On Sun, 2020-08-09 at 08:16 +0800, Chun-Kuang Hu wrote:
> > I would like to put all device in mt7623.dtsi with some device's
> > status is "disabled" and change its status in platform dtsi.
> > I would like to see all device in mt7623.dtsi because of its name. If
> > you move some device to platform dtsi, we would trace all platform
> > dtsi to find out how many device in mt7623. One day a new platform
> > enable different devices, you would reorganize all these platform
> > dtsi?
>
> No, this isn't "platform dtsi", surely? This is mt7623a and mt7623n
> dtsi for the two different SoCs, and platforms then just include
> mt7623a.dtsi or mt7623n.dtsi as appropriate for the SoC they are using.
>
> If you really want *all* the nodes for both MT7623A and MT7623N chips
> in a single mt7623.dtsi but disabled, could we still have mt7623a.dtsi
> and mt7623n.dtsi for the chips, enabling the nodes that are only-for-A
> or only-for-N, so that each platform doesn't have to do that for
> itself?
>
> Although putting those nodes that exist only in one chip or the other
> directly into the mt7623[an].dtsi still seems to make more sense to
> me.

