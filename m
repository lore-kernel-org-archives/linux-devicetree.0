Return-Path: <SRS0=12Nb=ZV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5679AC432C0
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 21:11:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2412C21771
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 21:11:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lB9otGP+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbfK2VLZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 Nov 2019 16:11:25 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:40426 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727073AbfK2VLZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 Nov 2019 16:11:25 -0500
Received: by mail-il1-f195.google.com with SMTP id b15so4923974ila.7
        for <devicetree@vger.kernel.org>; Fri, 29 Nov 2019 13:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J737RfycvasrkDMuXXVhGv8GjJozMIk9WjH6tUo8YNU=;
        b=lB9otGP+R7D5FDCg+yCl5lzrEbHVc6Uxs0+r8izKBMVVOofA3vofUwCrTGfrnh/HzZ
         nQhDEkKv9iFoZWHxi6Lm1vM755MYXzxCy5RZp4jPRE/gJ2i9XvIJGWnd9ekCs/i9szP+
         517eLdsZZuxFUU4mWYjZgOVY1hD6uyvbW1lnCzq/wktHxgnQA6T1f0c9qQjJHQmI0zbI
         8V+2XFBdclfe41bWEdDMCU2YuW4KMdfuROPYnbBrNDN52yqzzuCMy8RtBtAnZxGVEyDm
         ntE4PwYVP+sP+TljhMeQQ5sxV0Ry0ylzC2Nuyf3oC2BT/Tqn/gwKUaSZXUT6AHKd8tDK
         rpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J737RfycvasrkDMuXXVhGv8GjJozMIk9WjH6tUo8YNU=;
        b=Qar2glpHVTyAoRW/zcrCRMW74Nq6a8RA2w1TEmPp2KzywECG1KT/ZZSmfDT4XbUEm9
         4zpgaUg5SkwkoORjLxz457VPxoxEdio1nxzY/A87hSFxW4eLzvoabwiokZACWQXrd5GC
         dnITCgIJqQ+9cGKEt/CaPcR2Kdzt9Vt7OgdEqx6fpAZAyrmPndFqyUhh5qtEcQMTKWSn
         DhP2MhiMoJYFHM3wUOndee40yL2+p/7MutLcZIQRdbGE7sARday3t3w5Ryb2nPmXHQ0E
         +THDWkv9nBH9ZQC4AGcpHhcWbRonmUKR75dMuPtAE9xYvEZeW5edCutwHclNnkLf4T1D
         1Kyg==
X-Gm-Message-State: APjAAAUsFP9cBhy+ypn1PdGG+eqLWwUTYEvcNMHQ6M1jlaVeC8OC9Se3
        wLsarrWdlwHVSLG67p0UsNhz9XNaInr3F2vgQ/8Xkw==
X-Google-Smtp-Source: APXvYqyOXHCVc3ozOJPEmGcC3VwB8m0Qnuuz5GE4mQlGcSQvgINwg2paqQAOa7PK0kmgMZbGH4Jw33/Thcthow443Ck=
X-Received: by 2002:a92:1547:: with SMTP id v68mr13668342ilk.58.1575061884570;
 Fri, 29 Nov 2019 13:11:24 -0800 (PST)
MIME-Version: 1.0
References: <20191119231912.12768-1-mike.leach@linaro.org> <20191119231912.12768-8-mike.leach@linaro.org>
 <20191125212258.GB18542@xps15> <35357ff3-2b1e-764e-cfbd-65bcc7a4faa6@arm.com>
In-Reply-To: <35357ff3-2b1e-764e-cfbd-65bcc7a4faa6@arm.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Fri, 29 Nov 2019 14:11:13 -0700
Message-ID: <CANLsYkxqO71aBzf=BqcFDWccp3XH3gXc4OESgRy0-rTEe27fJA@mail.gmail.com>
Subject: Re: [PATCH v5 07/14] coresight: cti: Add device tree support for
 custom CTI.
To:     Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Cc:     Mike Leach <mike.leach@linaro.org>,
        Coresight ML <coresight@lists.linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 29 Nov 2019 at 07:16, Suzuki Kuruppassery Poulose
<suzuki.poulose@arm.com> wrote:
>
> On 25/11/2019 21:22, Mathieu Poirier wrote:
> > On Tue, Nov 19, 2019 at 11:19:05PM +0000, Mike Leach wrote:
> >> Adds support for CTIs whose connections are implementation defined at
> >> hardware design time, and not constrained by v8 architecture.
> >>
> >> These CTIs have no standard connection setup, all the settings have to
> >> be defined in the device tree files. The patch creates a set of connections
> >> and trigger signals based on the information provided.
> >>
> >> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> >> ---
> >>   .../coresight/coresight-cti-platform.c        | 250 +++++++++++++++++-
> >>   .../hwtracing/coresight/coresight-cti-sysfs.c |  11 +
> >>   2 files changed, 257 insertions(+), 4 deletions(-)
>
> >> +static int cti_plat_create_impdef_connections(struct device *dev,
> >> +                                          struct cti_drvdata *drvdata)
> >> +{
> >> +    int rc = 0;
> >> +    struct fwnode_handle *fwnode = dev_fwnode(dev);
> >> +    struct fwnode_handle *child = NULL;
> >> +
> >> +    if (IS_ERR_OR_NULL(fwnode))
> >> +            return -EINVAL;
> >> +
> >> +    fwnode_for_each_child_node(fwnode, child) {
> >> +            if (cti_plat_node_name_eq(child, CTI_DT_CONNS))
> >> +                    rc = cti_plat_create_connection(dev, drvdata, child);
> >> +            if (rc != 0)
> >> +                    break;
> >> +    }
> >> +    fwnode_handle_put(child);
> >
> > As far as I can tell we don't need to call fwnode_handle_put()?
>
> Actually we do, if we break the scan in between, at least for of_nodes.
> I had to literally look it down all the way down to confirm this.
>
> So for CONFIG_OF it ends up in of_get_next_available_child(), which
> drops the ref on "prev" and grabs the "next". So in case we break
> the loop, we must drop the ref on the child.

Well spotted.

> Otherwise, the last
> result would be NULL, which would have dropped the ref on the "last"
> valid entry. And this is harmless with a NULL ptr.
>
> Suzuki
