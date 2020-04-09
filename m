Return-Path: <SRS0=+eCa=5Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD55C2BA2B
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 16:04:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E5D020768
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 16:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586448267;
	bh=jHl2tXuPUqSaQC+oyWJix3OnWQectQwicEvPWmdxhFQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=YvRuCK5FKhPxvShhhEitlRGTAOh3ltDbduOEpue9N+9ftw2GjAgT8bDBMkPLLiw20
	 bTpQh0NY+gLq/6ocsuaslQ1GCue8swbEZGd/bUZCE3w3SMFCYc70qW9q3Dt0z+cgmI
	 X9DrBFp/4u2bfYCS88YaSgobILtpuWcsqqE3Jqag=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbgDIQE0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Apr 2020 12:04:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:39018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728193AbgDIQEZ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 9 Apr 2020 12:04:25 -0400
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DE93A2082D
        for <devicetree@vger.kernel.org>; Thu,  9 Apr 2020 16:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586448266;
        bh=jHl2tXuPUqSaQC+oyWJix3OnWQectQwicEvPWmdxhFQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JvQO1zcrMuUG+G5yhLQ+FC82141KHggoH55IydrkE9dcXvWyDOTx0LTZ8G+DeNqlK
         rX1a6zIdEqdAN3ocTVxK+Ok6FToMIDzn+3Vn9py2AAZfjdP9qFDE9qHrh/HY6w40Hr
         6WKFCtS/GgpM6sIqTnVtu0d/noeQ+uaMzN7ZgQSg=
Received: by mail-qk1-f181.google.com with SMTP id m67so4430747qke.12
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2020 09:04:25 -0700 (PDT)
X-Gm-Message-State: AGi0PuZVXcJdxSfcYrH9plGoH0tr+DummuzDly8ZJ6RIXJMePcJPFDMC
        yClFdK0LzYauVIP2SSe/hZdB+YKz78l9oqpYjw==
X-Google-Smtp-Source: APiQypJORe0eaQnOiuivPG/xIQ+NoeNev+Wot1Kl7zM7TIi6OX4XybaKhfLLknumjo9+oc4cE7ZrNPC+AtZSpQVaJvs=
X-Received: by 2002:a37:61cd:: with SMTP id v196mr511059qkb.393.1586448265058;
 Thu, 09 Apr 2020 09:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200328183641.11226-1-festevam@gmail.com> <20200328203001.GD32230@ravnborg.org>
In-Reply-To: <20200328203001.GD32230@ravnborg.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 9 Apr 2020 10:04:13 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+JXb3DHo-on-52TN6fGeukdPQPe+S+ZNrJmLxFT0rFOw@mail.gmail.com>
Message-ID: <CAL_Jsq+JXb3DHo-on-52TN6fGeukdPQPe+S+ZNrJmLxFT0rFOw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: ltk500hd1829: Remove the reg property
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Mar 28, 2020 at 2:30 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Sat, Mar 28, 2020 at 03:36:40PM -0300, Fabio Estevam wrote:
> > Commit 52120e8c7ae3 ("dt-bindings: display: fix panel warnings") removed
> > the dsi unit name, but missed to remove the 'reg' property, which causes
> > the following 'make dt_binding_check' warning:
> >
> > Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.example.dts:17.5-29.11: Warning (unit_address_vs_reg): /example-0/dsi: node has a reg or ranges property, but no unit name
> >
> > Fix it by removing the unneeded 'reg' property.
> >
> > Fixes: 52120e8c7ae3 ("dt-bindings: display: fix panel warnings")
> > Signed-off-by: Fabio Estevam <festevam@gmail.com>
>
> Thanks, applied to drm-misc-next.

This should go in fixes for 5.7 as well as the one for xinpeng,xpp055c272.

Rob
