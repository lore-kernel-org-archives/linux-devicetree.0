Return-Path: <SRS0=4Y7L=45=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46589C2BB1D
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 13:13:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 15B6F20663
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 13:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584018823;
	bh=OLCs9wDW5DLwK6glkoG1xXvwb8u+w1JpNNt/MSUzvEw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=XueWFaIB/XYREz9d9tywzA/D7O/4JCkZPzi9Mb9uIT6875S1SvH97sNfUpmv6dqGD
	 jau+Rkq+xQPl21pG8ZbVhsP70hqYO72P/ggisqzQDYXVRtHry/wYXfR1sRj/Y95bA9
	 ++SE+/N1ajWpAnPc5iAuGckT4ZsqBfYHGA4qhtBQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbgCLNNm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Mar 2020 09:13:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:55612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725978AbgCLNNm (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 12 Mar 2020 09:13:42 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8F0622071C
        for <devicetree@vger.kernel.org>; Thu, 12 Mar 2020 13:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584018821;
        bh=OLCs9wDW5DLwK6glkoG1xXvwb8u+w1JpNNt/MSUzvEw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ESG9DyqOBtb3RY9JZ8+KWe4xtjArS1LrAi62Ut7Q9YGKrM49cnixegAQl2+B//l1p
         5vF1N7TMBktea7/YfUwAOe6WZZSUS9hFlfar8X+r16vp9X58Fve69WgAVHhGpGeQ/C
         F3Awe52tsGjZQOvFr+uhrxusXABsT1jl1XnEamKM=
Received: by mail-qk1-f169.google.com with SMTP id b5so5990958qkh.8
        for <devicetree@vger.kernel.org>; Thu, 12 Mar 2020 06:13:41 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3SiJOaJIBCgkKh3ZW8H69BaqmtP2U4gOwtVCtdyqPjUSBz6B/e
        mpDW/L3DfKKcwBetNXXQke2Qo0NhHwZUBCepmA==
X-Google-Smtp-Source: ADFU+vsl+NWGl4RtiFZjKswLmhm4fAbnZDjrreYI1ja6LxDiRHZLHZlRiEDnADMNoidWwaIebO8AI/TFTKYi20bRWw0=
X-Received: by 2002:a37:aa92:: with SMTP id t140mr6922921qke.119.1584018820626;
 Thu, 12 Mar 2020 06:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200308115017.18563-1-sam@ravnborg.org> <20200308115017.18563-2-sam@ravnborg.org>
 <e584e779-aab3-1a41-f198-a5585d9be2e8@st.com>
In-Reply-To: <e584e779-aab3-1a41-f198-a5585d9be2e8@st.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 12 Mar 2020 08:13:25 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK4Wa-Z+2EOOTsUqfcXwV33o18eaUzq5-cYE5Zpirtyzw@mail.gmail.com>
Message-ID: <CAL_JsqK4Wa-Z+2EOOTsUqfcXwV33o18eaUzq5-cYE5Zpirtyzw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] dt-bindings: display: fix panel warnings
To:     Benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Mar 12, 2020 at 5:21 AM Benjamin GAIGNARD
<benjamin.gaignard@st.com> wrote:
>
>
>
> On 3/8/20 12:50 PM, Sam Ravnborg wrote:
> > Fix following type af warnings in the panel bindings:
> >
> > Warning (unit_address_vs_reg): /example-0/dsi/panel: node has a reg or ranges property, but no unit name
> > Warning (unit_address_vs_reg): /example-0/dsi@ff450000: node has a unit name, but no reg property
> >
> > Removing the "@xxx" from the node name fixed first warning.
> > Adding a missing reg property fixed the second warning
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> I will add W=1 in my command line when check the yaml files to not
> reproduce this later.

No need to starting in 5.7.

Rob
