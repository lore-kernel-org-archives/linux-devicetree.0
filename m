Return-Path: <SRS0=B/fR=Z4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CCDC2BD09
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 17:39:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF52E2245C
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 17:39:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YQ+P0k13"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbfLFRjj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 6 Dec 2019 12:39:39 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:35673 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726312AbfLFRjj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 6 Dec 2019 12:39:39 -0500
Received: by mail-qt1-f196.google.com with SMTP id s8so7907850qte.2
        for <devicetree@vger.kernel.org>; Fri, 06 Dec 2019 09:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rvJbez3t1i6gr8sW7DfacyqP3hxyEs0+ty+IefO5wYc=;
        b=YQ+P0k1376rwyy3MBhYUhCp2SRitHFce3O8IugmZBj1pL9dPvREWJPn1d8zzQZAniw
         qDJzdjH9aC3MzUVBnDgyrpbm+sl3YifPM4EBevE6a7nvp4TzvqC6sCs3TdepvktZy2C9
         4ViYAsqTqbdCNqw6nw+4JEYDjGCmeBFU/LlO+oRO9Hrs2P+yzQkn7YkqeYlwePPbodXL
         O1HXKExMpXxbNaJyuF5Q9mWiegLSXXXpJiY/9rdlniiIBAZ+kHibGOhoGp1wwv2zUL7Q
         gzuTrHvBs90qrPMgQHKvcH/oe8e0jHjsJzW4BnC3nwW2gjWs2i/ghUAZVKBT3X9xE9L+
         9kjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rvJbez3t1i6gr8sW7DfacyqP3hxyEs0+ty+IefO5wYc=;
        b=e1xurFpNhgul0iZZEfMTru9cj5Tb9qW2YGOeeEOM4Z6H525oulzh8JXeSCVrYRY0qS
         gV40B5uodVhEZar0H+RLdsj0a0G7Go5gGCOBcZ3y6kbsIFOX/DSbBT/6ldYQyIIrrIf+
         4l3QmZx1mSWkKw/zqaQcgQqoKO1mzUglY0xl4zzTKWV650ou55wt9AekeTfFBV2f7R2o
         RpWIkd+UTxGjbWaSgRTkXoiZYAa6BZ+YlIWJUarY4sq9vp9oSdJcRvW4/m3v6Qyj0ugA
         32hRDxuCoj6pXQ/Y3XBnCgyT8n2nALIP/Kspmk6pIlGYUyQrwwCdHLljDbwXLoYyEryz
         o7Ew==
X-Gm-Message-State: APjAAAW0rC9KuwAMJ4P7UykkoXy00fuVE1GWwbp6gNdxYu4o6kEdHuTP
        AfnyZ3XQRI7cNqYUaB9/IGrzg4xC0zsoaawT0PHFZg==
X-Google-Smtp-Source: APXvYqyHH54J9471sJiemYPbjSsd/iWk1KAbT0Z6XDcC/wDdzcfnGvRyl7sOz0RxbO5t9sO6YaaRCLtT96aXrWAGNcc=
X-Received: by 2002:ac8:41c3:: with SMTP id o3mr13647714qtm.88.1575653978018;
 Fri, 06 Dec 2019 09:39:38 -0800 (PST)
MIME-Version: 1.0
References: <20191119231912.12768-1-mike.leach@linaro.org> <20191119231912.12768-14-mike.leach@linaro.org>
 <1076b0e3-6b50-7be9-0a25-cb003bd77674@arm.com>
In-Reply-To: <1076b0e3-6b50-7be9-0a25-cb003bd77674@arm.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Fri, 6 Dec 2019 17:39:27 +0000
Message-ID: <CAJ9a7VjUmDA6Sx2CQzttXnptSJDVhobiSj_8z5ez_SFMC7L14Q@mail.gmail.com>
Subject: Re: [PATCH v5 13/14] docs: coresight: Update documentation for
 CoreSight to cover CTI.
To:     Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Cc:     Coresight ML <coresight@lists.linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Mathieu, Suzuki,

Fixed per you suggestions.

Thanks

Mike

On Mon, 2 Dec 2019 at 10:43, Suzuki Kuruppassery Poulose
<suzuki.poulose@arm.com> wrote:
>
> On 19/11/2019 23:19, Mike Leach wrote:
> > Add new document covering CTI / CTM usage in CoreSight.
> >
> > Add section in coresight.rst introducing CTI and CTM modules with link
> > to new document.
> >
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > ---
> >   .../trace/coresight/coresight-ect.rst         | 200 ++++++++++++++++++
> >   Documentation/trace/coresight/coresight.rst   |  13 ++
> >   2 files changed, 213 insertions(+)
> >   create mode 100644 Documentation/trace/coresight/coresight-ect.rst
> >
> > diff --git a/Documentation/trace/coresight/coresight-ect.rst b/Documentation/trace/coresight/coresight-ect.rst
> > new file mode 100644
> > index 000000000000..6448cf910f20
> > --- /dev/null
> > +++ b/Documentation/trace/coresight/coresight-ect.rst
> > @@ -0,0 +1,200 @@
> > +=============================================
> > +CoreSight Embedded Cross Trigger (CTI & CTM).
> > +=============================================
> > +
> > +    :Author:   Mike Leach <mike.leach@linaro.org>
> > +    :Date:     November 2019
> > +
>
> ...
>
>
> > +
> > +Channels API Directory
> > +~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +This provides an easy way to attach triggers to channels, without needing
> > +the multiple register operations that are required if manipluating the
> > +'regs' sub-dir elements directly.
> > +
> > +A number of files provide this API::
> > +
> > +   >$ ls ./cti_sys0/channels/
> > +   chan_clear         chan_inuse         chan_xtrigs_view      trigin_detach
> > +   chan_free          chan_pulse         chan_xtrigs_view_sel  trigout_attach
> > +   chan_gate_disable  chan_set           trig_filter_enable    trigout_detach
> > +   chan_gate_enable   chan_xtrigs_reset  trigin_attach         trigout_filtered
> > +
> > +Most access to these elements take the form::
> > +
> > +  echo <chan> [<trigger>] > /<device_path>/<operation>
> > +
> > +where the optional <trigger> is only needed for trigXX_attach | detach
> > +operations.
> > +
> > +e.g.::
> > +
> > +   >$ echo 0 1 > ./cti_sys0/channels/trigout_attach
> > +   >$ echo 0 > ./cti_sys0/channels/chan_set
> > +
> > +Attaches trigout(1) to channel(0), then activates channel(0) generating a
> > +set state on cti_sys0.trigout(1)
> > +
> > +
> > +*API operations*
> > +
> > +   * ``trigin_attach, trigout_attach``: Attach a channel to a trigger signal.
> > +   * ``trigin_detach, trigout_detach``: Detach a channel from a trigger signal.
> > +   * ``chan_set``: Set the channel - the set state will be propogated around
> > +     the CTM to other connected devices.
> > +   * ``chan_clear``: Clear the channel.
> > +   * ``chan_pulse``: Set the channel for a single CoreSight clock cycle.
> > +   * ``chan_gate_enable``: Write operation sets the CTI gate to propagate
> > +     (enable) the channel to other devices. This operation takes a channel
> > +     number. CTI gate is enabled for all channels by default at power up. Read
> > +     to list the currently enabled channels on the gate.
> > +   * ``chan_gate_disable``: Write channel number to disable gate for that
> > +     channel.
> > +   * ``chan_inuse``: Show the current channels attached to any signal
> > +   * ``chan_free``: Show channels with no attached signals.
> > +   * ``chan_xtrig_view``: write a channel number to select a channel to view,
> > +     read to show the cross triggers programmed for the selected channel.
> > +   * ``trig_filter_enable``: Defaults to enabled, disable to allow potentially
> > +     dangerous output signals to be set.
> > +   * ``trigout_filtered``: Trigger out signals that are prevented from being
> > +     set if filtering ``trig_filter_enable`` is enabled. One use is to prevent
> > +     accidental ``EDBGREQ`` signals stopping a core.
> > +   * ``chan_xtrigs_reset``: Write 1 to clear all channel / trigger programming.
> > +     Resets device hardware to default state.
> > +
> > +e.g.::
> > +
> > +   .../cti_sys0/channels# echo 2 1 > trigin_attach
> > +   .../cti_sys0/channels# echo 2 6 > trigout_attach
>
> minor nit: It may be a good idea to add a comment to describe what you
> are doing with the above operations, to avoid looking up and mapping it
> for someone looking it up. I am not too keen, but it is definitely
> helpful.
>
> > +   .../cti_sys0/channels# cat chan_free
> > +   0-1,3
> > +   .../cti_sys0/channels# cat chan_inuse
> > +   2
> > +   .../cti_sys0/channels# echo 2 > chan_xtrigs_view
> > +   .../cti_sys0/channels# cat chan_xtrigs_view
> > +   [2] IN: 1 OUT: 6
> > +   .../cti_sys0/# echo 1 > enable
> > +   .../cti_sys0/channels# echo 2 > chan_set
> > +   .../cti_sys0/channels# cat ../regs/choutstatus
> > +   0x4
> > +   .../cti_sys0/channels# cat ../regs/trigoutstatus
> > +   0x40
> > +   .../cti_sys0/channels# echo 2 > chan_clear
>
> > +   .../cti_sys0/channels# cat ../regs/trigoutstatus
> > +   0x0
> > +   .../cti_sys0/channels# cat ../regs/trigoutstatus
> > +   0x0
>
> nit: duplicate lines ?
>
> Otherwise:
>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
