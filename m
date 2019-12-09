Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DACDC43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 18:00:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2726E2465B
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 18:00:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbfLISAl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 13:00:41 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:51370 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbfLISAl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 13:00:41 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 975532006E;
        Mon,  9 Dec 2019 19:00:37 +0100 (CET)
Date:   Mon, 9 Dec 2019 19:00:35 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Convert a bunch of panels to DT
 schema
Message-ID: <20191209180035.GA14817@ravnborg.org>
References: <20191119231309.18295-1-robh@kernel.org>
 <20191130194337.GE24722@ravnborg.org>
 <CAL_Jsq+AsCOQh89t1foJjDFFoQzfx5NythgdcbQGYNxRHRjB2A@mail.gmail.com>
 <20191204201452.GA30193@ravnborg.org>
 <CAL_JsqLNSF3j9q49SVTpg=742dgt-60BRhXUxEVUXyYtroAqOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLNSF3j9q49SVTpg=742dgt-60BRhXUxEVUXyYtroAqOQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=_nXCi8Np0ha-vpYLopoA:9 a=CjuIK1q_8ugA:10
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob.

> 
> Yes. The issue would be enforcing the big disclaimer of "Do not add
> your panel here unless it has a single power rail." (And anything else
> we think of). Between a single line add vs. a whole new doc, you know
> what people will pick. I guess panels could still be moved out of the
> common doc later on. We'd also have to be fighting off the "let me add
> just one new property for my panel".

If the panel cannot be supported by the panel-simple driver then
this is a good sign that it does not belong in the bindings file.
Or something like this.

I do not see it as a 1:1 for all panels but I guess most panels
supported by panel-simple would go in a single bindings file.

> You did. I'd like to hear Thierry's thoughts on this before going down
> this path.
Seconded, Thierry?

	Sam
