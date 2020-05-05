Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368D6C47254
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 23:26:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 133A4206FA
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 23:26:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MQyPrHIm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729119AbgEEX0R (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 19:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728642AbgEEX0R (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 May 2020 19:26:17 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B65EC061A0F
        for <devicetree@vger.kernel.org>; Tue,  5 May 2020 16:26:17 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id f5so11643ybo.4
        for <devicetree@vger.kernel.org>; Tue, 05 May 2020 16:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dSNUOaj5KxlkmD3E6We3JZzhQHqRCx3I4wcT9gUGuhg=;
        b=MQyPrHImzLs/VQfBJV923ppx7fQWNvo0uqdxIdrZDaFeE6/xsKpn1noL2Ke51fqI7+
         3t5sbTe6qX4wp2AcvVt3jgCB/KDPBHj2c4YQgmN4AHEcsjwY/P865XqvLIt9fNxMfl+S
         eD/qipQkbesQ7vYbA0IurM6pfOgqPb1vBO97mkv7Yhf2NiFgTjIgDJQTgEFTBxZrt8og
         4LzaA9jPda8IzrCaN9HXotXumGTYXpS++DxyEokv7hyUi2em5AKqQztF6EtcTSafZqg4
         OP4bX1uLqV2FnlBG9Dzx5NOA3ufeNdD8UCNF61lczzJ0V4FFtk7Ykn5/G2noFvFTPhGU
         Lxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dSNUOaj5KxlkmD3E6We3JZzhQHqRCx3I4wcT9gUGuhg=;
        b=cgF5XB7nujvJejSE9bL4x+CeQKqFAoQLKLXMl/iRs22QwYH/62FCNWkUUQBrkR7UnT
         vOb/2wGMP5NmsaqlqC+MRPt6yUAqliW6jGr9bznBIfRJXtB/u/quszRf7GtaPdhSXXmg
         Nucv82W6UzOAYpRjs3WACHG/u4NnKBl2HwV6DS6QXsoO8hHc1FVXNFRLUjg+oJAH+rqL
         BksvtI1V753lv6J2s8PftF1QTmIJRqxpoP5ksgU9Qpt+kb1iaqbrfBDnWzWC1F2t42GK
         y47VZ5Yn1ZhrhM9WkeA0pOv+5cfSeuShHDr2yqkUlxyqlABJ0qfaI9JDuQXluTznydgp
         E7sA==
X-Gm-Message-State: AGi0PuYGU9/6SUuRgDsAm4oUwrPjOH/UlR7deukA6X/2k4l4+lukM3sB
        RLikKmDh0WKol9i2Kr5gVUBv+QQ94vDr9eTHvrpABg==
X-Google-Smtp-Source: APiQypKKDQU2Sw118oCoUpMcYow1NLSmmvRnupnXJQZ/a9ro8u95AnjtEu8uifc2boNhNYZe/1BXwzxYTQKsis2AMhs=
X-Received: by 2002:a25:ba8f:: with SMTP id s15mr9039706ybg.34.1588721175380;
 Tue, 05 May 2020 16:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200424053819.220276-1-jnchase@google.com> <20200424053819.220276-2-jnchase@google.com>
 <74c08463-7052-2ac4-3662-7301ecb8150d@xs4all.nl> <CALTkaQ2dnWdkAsqYXF+msN+Jnz_1RuvbQtJd4PFwVT_Q7FTc5Q@mail.gmail.com>
 <290277ee-f1a1-db02-9885-d4193a40e8f8@xs4all.nl>
In-Reply-To: <290277ee-f1a1-db02-9885-d4193a40e8f8@xs4all.nl>
From:   Jeff Chase <jnchase@google.com>
Date:   Tue, 5 May 2020 19:26:04 -0400
Message-ID: <CALTkaQ0tp91FJJbrzj3=+qP5z4myuUyOA9fO0L-V4CMG6Qc=nA@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: cec: i2c: ch7322: Add ch7322 CEC controller driver
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Apr 25, 2020 at 5:16 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 24/04/2020 21:33, Jeff Chase wrote:
> > Hi Hans,
> >
> > Thank you for the quick review.
> >
> >> Is the register documentation available somewhere? I only found the product brief.
> >
> > No, it's not publicly available.
> >
> >> The chip can only detect OK vs NACK? There are no error states for Arbitration Lost
> >> or Low Drive conditions? Just checking, not all hardware has support for that.
> >
> > Correct, message transmit completion just has a one-bit status.
> >
> >>> +static int ch7322_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
> >>> +{
> >>> +     struct ch7322 *ch7322 = cec_get_drvdata(adap);
> >>> +
> >>> +     dev_dbg(&ch7322->i2c->dev, "cec log addr: %x\n", log_addr);
> >>> +
> >>> +     return 0;
> >>
> >> This can't be right. I expect that logical addresses are set/cleared here,
> >> because the device needs to know that so that it can ignore messages not
> >> intended for it.
> >
> > As far as I can tell the device doesn't filter based on logical
> > address. I'll have to save
> > the logical address to the driver and filter manually.
>
> That can't be right. If this CEC adapter is assigned logical address 4, and
> it has to Ack any received messages from other CEC devices with destination 4,
> and ignore (i.e. not explicitly Ack) messages with other destinations.
>
> If the CEC adapter wouldn't know what LA to use, then it would have to Ack
> all messages, regardless of the destination, which would make this a complete
> mess.
>
> There must be a register that tells the CEC adapter which logical address(es)
> should be Acked. It's usually a bitmask (one bit for each possible LA) or the
> LA itself is stored.

Sorry, you're right, of course. The register isn't in the
documentation I have but I found it referenced in some sample code. By
default it seems the device automatically stores the logical address
if it recognizes a polling message (with src == dst) that was not
ack'd. The behavior can be configured to allow explicit logical
address assignment instead. I assume that would be preferred?

Thanks,
Jeff


>
> It might be that you still receive all messages (in which case monitor_all
> is effectively always enabled), but it really needs to be told which LAs should
> be Acked.
>
> Regards,
>
>         Hans
>
> >
> >>> +}
> >>> +
> >>> +static int ch7322_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
> >>> +                                  u32 signal_free_time, struct cec_msg *msg)
> >>> +{
> >>
> >> Does the hardware correctly handle Signal Free Time? If this isn't handled right
> >> then one CEC device can flood the CEC bus, preventing anyone else from using it.
> >>
> >> In some devices it has to be programmed, in others it is hardwired.
> >
> > It must be hardwired -- I don't see a way to program it.
> >
> >>> +     struct ch7322 *ch7322 = cec_get_drvdata(adap);
> >>> +     int ret;
> >>> +
> >>> +     dev_dbg(&ch7322->i2c->dev, "cec transmit: %x->%x: %x\n",
> >>> +             cec_msg_initiator(msg), cec_msg_destination(msg),
> >>> +             cec_msg_opcode(msg));
> >>> +
> >>> +     mutex_lock(&ch7322->mutex);
> >>> +     ret = ch7322_send_message(ch7322, msg);
> >>> +     mutex_unlock(&ch7322->mutex);
> >>> +
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +static const struct cec_adap_ops ch7322_cec_adap_ops = {
> >>> +     .adap_enable = ch7322_cec_adap_enable,
> >>> +     .adap_log_addr = ch7322_cec_adap_log_addr,
> >>> +     .adap_transmit = ch7322_cec_adap_transmit,
> >>
> >> If the HW supports CEC monitoring (aka snooping), then I recommend that
> >> adap_monitor_all_enable is also implemented. It's very useful for debugging
> >> CEC in userspace. Not all HW supports it, though.
> >
> > Okay, I'll add this along with the logical address filtering I mentioned above.
> >
> > Thanks,
> > Jeff
> >
>
