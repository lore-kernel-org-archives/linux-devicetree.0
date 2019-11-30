Return-Path: <SRS0=1K1h=ZW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A81DC43215
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 13:45:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 236962082E
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 13:45:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="i3Z02aWO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbfK3Npf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 30 Nov 2019 08:45:35 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38481 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbfK3Npf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 30 Nov 2019 08:45:35 -0500
Received: by mail-ot1-f66.google.com with SMTP id z25so27103165oti.5
        for <devicetree@vger.kernel.org>; Sat, 30 Nov 2019 05:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wTyZEPvpo0PLpOTd5AKDM3P2wmdibZMqRSO63AHR/58=;
        b=i3Z02aWOSfMH+lmJzw3TTt09QTqNIuFbl6pSzVOoLoOV48NLZGjDf43kbc6gxsaNYA
         G20Q9JyYJQZhw7FCC7nXsyqJtMHoQqthGgUOYVKyYsyTN/fBnU6Mvb+o+GxMN+ISbUn9
         1Tp9MWe1NUk66rDkdCia0J9kmvh+AMnxcfu6wmv5AD1mSkK3xBiBxh7PpQ18YnWJ9sl3
         XQOHqHFZZWKDiWwDMwyuhcdOW2lTVncacHonGVTV3XCmJHHF1QwESvkbtVzAgwjzR+j4
         q/EE4JAHKP6ySmQo+WsXLjznS8oIqoaMmxpH6Wex7+06XyHdwYvkTuLMLDLOy7mmVj2P
         yalw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wTyZEPvpo0PLpOTd5AKDM3P2wmdibZMqRSO63AHR/58=;
        b=cbzFmdOf9FKFy4683mZUrJcj7a49fEFMShlt8NPcHxOHI52Z3xmQxuLP80b3x2RgJv
         hwEY/QMtuq0gHMIgqu7vi5lE3bMnJFfgC/CZ8tHYHrMd0V8tlicr23eMrLnduJUf0YIN
         kXVScP3xU93we4WBuzyWBgz5KgY5JgxCFivVIBu8msLwytDatp+tGjV60+8Vk9wtxV9X
         Xk5x7WO4EC9wmeX7QtwUlZZTyIffcKakZj5jP4kU8SaGmz0MVtWA9T2xLh5PhHKggpRA
         XjOGp68rYn6UP9OT30PnEjvLyte7EorL6GZ5oovPxE1Gs/BFNfral0OdqmEipFVh+R9i
         Qh0A==
X-Gm-Message-State: APjAAAXPXsaLWsdW/yak9257gu+gVoGlilMoae179R5Wb2Tcr3XYeTCJ
        G2V6T8Groe3oyfxvkiOrelyHqpZmYCnUgx+sITU=
X-Google-Smtp-Source: APXvYqyCX4BuLvR+840AH+NJOOsG8+inx0w8y9R42Xu8hiZugnd05R0p06CIl7qpGgmUt0Bv+tMcEqHrkicvsv/CULM=
X-Received: by 2002:a9d:6a4c:: with SMTP id h12mr12131649otn.81.1575121533758;
 Sat, 30 Nov 2019 05:45:33 -0800 (PST)
MIME-Version: 1.0
References: <20191130115824.31778-1-mohammad.rasim96@gmail.com> <20191130115824.31778-2-mohammad.rasim96@gmail.com>
In-Reply-To: <20191130115824.31778-2-mohammad.rasim96@gmail.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 30 Nov 2019 14:45:22 +0100
Message-ID: <CAFBinCCg5GdHprEKfXU1LBtgQi2G7P30=bmLh8Acrn82vYGfeg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: Add vendor prefix for Videostrong
To:     Mohammad Rasim <mohammad.rasim96@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Mohammad,

On Sat, Nov 30, 2019 at 12:58 PM Mohammad Rasim
<mohammad.rasim96@gmail.com> wrote:
>
> Videostrong Technology Co., Ltd., A manufacturer of Android Players & STB
> (Android with DVB Hybrid box & DVB-T2/S2/C/ISDB-T/DTMB-TH/ATSC )as well as
the space after ATSC should be after the ")"

> HD media players.
>
> Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
with above typo fixed:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
