Return-Path: <SRS0=kwC1=3S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C74C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jan 2020 19:47:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 984F4206D4
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jan 2020 19:47:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbgA2TrQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jan 2020 14:47:16 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:40278 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbgA2TrQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jan 2020 14:47:16 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 9FDDF8046E;
        Wed, 29 Jan 2020 20:47:12 +0100 (CET)
Date:   Wed, 29 Jan 2020 20:47:11 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc:     Rob Herring <robh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        Yannick Fertre <yannick.fertre@st.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: one file of all simple DSI panels
Message-ID: <20200129194711.GA29646@ravnborg.org>
References: <20200102101712.5085-1-sam@ravnborg.org>
 <20200102101712.5085-3-sam@ravnborg.org>
 <CA+M3ks5Zs5j0FMD4SQiva2soW62tSnu14qiq3kErhLvCMxrxAA@mail.gmail.com>
 <CAL_Jsq+g8mVdC=aOZDpMGMt3j1Y=Lgku-OcfoBP_V7PGabq5Lg@mail.gmail.com>
 <CA+M3ks4sD971mCUQRJO+9gXaAWcwgzy2iNtMNVBRov5JSJk=HQ@mail.gmail.com>
 <CA+M3ks7GkVSi2WcwpK+tkoBx=EpJLfFVAp=qs2ygZyW114hWfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+M3ks7GkVSi2WcwpK+tkoBx=EpJLfFVAp=qs2ygZyW114hWfw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=2pC7oDVXEgjFpRlVQu8A:9 a=CjuIK1q_8ugA:10
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Benjamin.
> > >
> > > Here's the problem. If it is not required, then panels with multiple
> > > supplies will get added here because they didn't care to begin with.
> > > Then when someone decides to think about the supplies it will have to
> > > be moved. Bindings need to be complete from the start.
> >
> > Fair enough, I will add fixed supply in dts files.
> > If reset-gpios could be added in this schema then we could include
> > oristech panel here.
> 
> Does this patch has been merged ?

I was sidetracked by other things.
Maybe you can move it forward?

	Sam
