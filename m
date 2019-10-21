Return-Path: <SRS0=tRzh=YO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F85CA9EAF
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 17:16:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B1A02084B
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 17:16:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks-com.20150623.gappssmtp.com header.i=@gateworks-com.20150623.gappssmtp.com header.b="ZS5+9g90"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbfJURQD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 21 Oct 2019 13:16:03 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:39320 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbfJURQC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 21 Oct 2019 13:16:02 -0400
Received: by mail-il1-f196.google.com with SMTP id i12so2222200ils.6
        for <devicetree@vger.kernel.org>; Mon, 21 Oct 2019 10:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WDDusCJCrTMEWx9uUOU4sUpxfKkOpL87Brxi2v+/7T8=;
        b=ZS5+9g90sp9mtEhsLeSCsdXdtG0gD7fLx9/M5gyAVt9do+k99KPnl/IB0lTIIcvFda
         FKPPcxjWo5WcfZTyWJy2jr7F7kGSp/baCYi1fKvhc7Q5Dsr7KPvw172CAwGqxmLANFki
         rUgjeUA3E4A+2CZde6eDdP0W2IHO0zGmgYtbGdNEZwfE/wik+rwdamnafhke6ewl8cVY
         GAgisff0vOiJVnnjNpg3ms+t9TJqkf/zAkMbpmHM1S81CCullUFF65j141f8gDB6Xlst
         xBZD9WUwCPQiuiIQnaJm6dLCbTAk0KoLXNsq0ZeGICMQ0XTSewcE4JxPA1ZuFPP2Twht
         nbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WDDusCJCrTMEWx9uUOU4sUpxfKkOpL87Brxi2v+/7T8=;
        b=CC8fRdBdIY/O+4DXlJKSPAeNjP/2HARg5o49ZSaF0UNeVlqAnuDI4ZLuBuir1J315h
         qpL14EGdjJ7QkC88TAQ+ap/HDvXvh9TPOEYFdcNELqhsPCqIm1ra+0BT7cBL4je8VQ7W
         h1Ydnn8NRPZQ8UHGwtGcYxdbaR8fJ9GhuhJ0SoouMbxynWV7Gts+/F5KXBVrt9tpO2lx
         tynOJ2bWNGJjgxJe6UdcKuMkoXyqILqtXCeb1HCP2DJxf2feC/lL+xvTgyLH87Ny0aDg
         craAYV56vL+ZWYa1iPHCIo4UFepWPioXFN4rSrkEs4ikesBC3/Daj4l1pEGEuRZfBOoy
         Q2wA==
X-Gm-Message-State: APjAAAW2srNCUurW2UwT9tWbVAGj04O2sAWAt+5s6RPrPT0I0QKvXDcN
        HAC8huXOh3p0FXCcw7JuL+yaucAfSmw2qSMFHsTk5A==
X-Google-Smtp-Source: APXvYqw/r3cw9wHVD/RltakAaUes+6GlTcdOa6+YiFBTc3rMsGD7htWqHfb0BWmmVHA3xkkWjs7by79vOMMacj/xyxs=
X-Received: by 2002:a92:6701:: with SMTP id b1mr25750053ilc.181.1571678161960;
 Mon, 21 Oct 2019 10:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191010175648.10830-1-rjones@gateworks.com> <20191014184921.22524-1-rjones@gateworks.com>
 <20191014184921.22524-3-rjones@gateworks.com>
In-Reply-To: <20191014184921.22524-3-rjones@gateworks.com>
From:   Bobby Jones <rjones@gateworks.com>
Date:   Mon, 21 Oct 2019 10:15:51 -0700
Message-ID: <CALAE=UAN=JXMo59-6Cm_wLx1qdiQ4VBpbkSMUsiUP7cLiiZQ1g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] iio: imu: Add support for the FXOS8700 IMU
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello Jonathan,

Just wanted to check to see if you had gotten a chance to look at my
response to your questions and the following submission.  I was able
to get a reviewed-by from Rob on the device tree bindings, and I have
some free time to work on this if you have any feedback.

Regards,
Bobby
