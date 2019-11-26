Return-Path: <SRS0=scSd=ZS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11E1C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 20:40:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC9622084D
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 20:40:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AyMO8rPj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbfKZUkq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 Nov 2019 15:40:46 -0500
Received: from mail-qv1-f68.google.com ([209.85.219.68]:36232 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbfKZUkp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 26 Nov 2019 15:40:45 -0500
Received: by mail-qv1-f68.google.com with SMTP id cv8so7913090qvb.3
        for <devicetree@vger.kernel.org>; Tue, 26 Nov 2019 12:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hZS0DOzhdXc14SRcDepXoDm9fZsWuamRk2Ch1O62Y6M=;
        b=AyMO8rPj9LC6qYrwszqbZ4FAZrfDRjArzZAfENajH2/k54YS7qEovG3akaP1pfq998
         oupGI0fYi00PGvxzZzGMaLi+EWH6KEMUbqza6qlQCmZQCOsuqrj+BFPw02uFj6PZV+pN
         NErENlOUIIeSCg8QvAUE7qBGs8sCvr79sXlSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hZS0DOzhdXc14SRcDepXoDm9fZsWuamRk2Ch1O62Y6M=;
        b=lecL55H+i6RdfvS3WO/EyOL472MhFrwL7j79xTVVIS+Mfp49KoSNroY/NylH8QhBHH
         +eDXhySZ1iQa2QHH8bwB/9INuNq+JgpBwmvqhzftFr5z3dRQNjoGIrmWS8gWSLPUIRzZ
         8+zkKVn3k/sTQD2Nv83gSb9rVhSHiK1ns6NiDXxH30wkHfoj00Xe4IL5G0EJINFD7bQd
         B3lEC3KIoEXgnlM65BI4p44Lm0m9WLo0Wgtd5a2itIzQePMvBmZz7diD3DhzNSr1ietS
         E0+nroIOcP9y9fXxSH7aBk4ZY6vLDNmWtwLXAheGIY3X+cgWL6KVahbjr7P0+0VRDFry
         u73Q==
X-Gm-Message-State: APjAAAWuEqtAWKuYzfYUaF9XmGCa9KZ0Yu+bx+Tza+gA+JqMN8u8U9In
        XVcOYCUWmErzVyBubbZnsxF2VuzJ9WfjFyR3mVvf6g==
X-Google-Smtp-Source: APXvYqyHWYlmAddGhtDAqk04GEexsdJ04kAI1FRb4pWTtUfU042FjywMeWoKRVllBy2/VViLe4Hc7w3el+bRbeVWXlU=
X-Received: by 2002:ad4:568d:: with SMTP id bc13mr768895qvb.102.1574800844776;
 Tue, 26 Nov 2019 12:40:44 -0800 (PST)
MIME-Version: 1.0
References: <20191118192123.82430-1-abhishekpandit@chromium.org>
 <1CEDCBDC-221C-4E5F-90E9-898B02304562@holtmann.org> <CANFp7mXNPsmfC_dDcxP1N9weiEFdogOvgSjuBLJSd+4-ONsoOQ@mail.gmail.com>
 <1CEB6B69-09AA-47AA-BC43-BD17C00249E7@holtmann.org>
In-Reply-To: <1CEB6B69-09AA-47AA-BC43-BD17C00249E7@holtmann.org>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Tue, 26 Nov 2019 12:40:34 -0800
Message-ID: <CANFp7mU=URXhZ8V67CyGs1wZ2_N_jTk42wd0XveTpBDV4ir75w@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Bluetooth: hci_bcm: Additional changes for BCM4354 support
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Ondrej Jirman <megous@megous.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hey Marcel,

The series looks good to me.

Thanks
Abhishek

On Mon, Nov 25, 2019 at 11:19 PM Marcel Holtmann <marcel@holtmann.org> wrote:
>
> Hi Abhishek,
>
> > It looks about the same as one of my earlier patch series. Outside a
> > few nitpicks, I'm ok with merging this.
>
> I fixed the nitpicks up and send a v2.
>
> However we should still work towards a generic description of Bluetooth PCM settings for all vendors. Any ideas are welcome.
>
> Regards
>
> Marcel
>
