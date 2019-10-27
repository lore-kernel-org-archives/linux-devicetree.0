Return-Path: <SRS0=8gXo=YU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525A6CA9EBC
	for <linux-devicetree@archiver.kernel.org>; Sun, 27 Oct 2019 16:57:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2891C20679
	for <linux-devicetree@archiver.kernel.org>; Sun, 27 Oct 2019 16:57:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="go0NQuHQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727237AbfJ0Q5e (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 27 Oct 2019 12:57:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34518 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727384AbfJ0Q5e (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 27 Oct 2019 12:57:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572195453;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=a0UgV3lT7kjp68nqTUQLv1IWHForOi5FfkcspwLJWPQ=;
        b=go0NQuHQfgl1fW15lTuLPf2oZsSQy+QeqelhOI56d5Lw5LcIF8SoCqdqg0xY7BDKr4pEQY
        tXs4GGXCcuCdmfzsEjJRot11KY9gNCU+kcu8tQnuIptUlaKcY5xiyfmcYb6aC75bPQBkiP
        naqdSe2yB2MPcgg+dLcE4MIgVpowYYg=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-dCUGQBzDMVeMAOfJ3wTfng-1; Sun, 27 Oct 2019 12:57:31 -0400
Received: by mail-io1-f71.google.com with SMTP id g126so6533591iof.3
        for <devicetree@vger.kernel.org>; Sun, 27 Oct 2019 09:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uiyGHBoRq5Dv8+7cLKe9dCEaHNIIIeUJ6r+ZGsY4CZw=;
        b=qwOtctKk2/rOyVGpuaMR2dPG0EKFPWtkoJOTeuDHj7WLZgNB3GaFa+jE9zhhlrz3Uy
         k5/paM/gXAtzUbn5YcMdilDUY4EMrN2TtpRSsO98uO3THeQilVl7EXWEAXr9Dm2qcG8w
         VxAONWyph1AD8XeW+BlWVawMW//7QYS5+nAmZCXVP108Alu/IQjpV7bmaBPmeGqz6ZtI
         jEn+DltS0XPdpz7WH7QFC9fWju1+sdyD9NVuSLfMMCKy+b+TRp6PglRFz2TGDEyG6DOi
         VvZyYpVJs67GPxldEmUYL+u7plYE5fFQAof5uC0tCg5GNlUOiT7tNiGAsZ+9BXdyrFj7
         AnIg==
X-Gm-Message-State: APjAAAXQEalA6s43XN4F8DLAbt6wxA/NVpmWhnRkeZPLyTUMg0TAaSta
        dCL5rZqga7MoYtuSt84Ltoz2mjR1QZADdBXrR+2EKrtS8FoRemt6nii5mk67dcirmbJ0e2fWLEh
        VQqxbYRxuTt8agDYru/6RzJV3IBEXZtnAf1b84w==
X-Received: by 2002:a05:6638:23b:: with SMTP id f27mr4267243jaq.55.1572195450875;
        Sun, 27 Oct 2019 09:57:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx5CLYZpxKjYU/Dulf+5fc0vZxxdn46JVSt0bEdgtord9iYUnQmyhJkuYYJr+Su4agJmXOKWN843O0zpcrsu9A=
X-Received: by 2002:a05:6638:23b:: with SMTP id f27mr4267231jaq.55.1572195450562;
 Sun, 27 Oct 2019 09:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571931470.git.lorenzo@kernel.org> <1e96ac17ca6819cf8f35c757a63e11e815455225.1571931470.git.lorenzo@kernel.org>
 <20191027164024.685c1ced@archlinux>
In-Reply-To: <20191027164024.685c1ced@archlinux>
From:   Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Date:   Sun, 27 Oct 2019 17:57:22 +0100
Message-ID: <CAJ0CqmWRVcd=VwBpVsbDVsqiQetVULtgHJG3KxQJA7aQZ4EJKQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: iio: imu: st_lsm6dsx: add lsm6dsrx
 device bindings
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Lorenzo Bianconi <lorenzo@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org
X-MC-Unique: dCUGQBzDMVeMAOfJ3wTfng-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

>
> On Thu, 24 Oct 2019 17:42:34 +0200
> Lorenzo Bianconi <lorenzo@kernel.org> wrote:
>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Applied.  If you get bored and feel like converting this over
> to yaml at somepoint that would be great ;)
>
> Thanks,

ack, added to my ToDo list :)

Regards,
Lorenzo

>
> Jonathan
>
> > ---
> >  Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt b=
/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
> > index fc018ecba086..cef4bc16fce1 100644
> > --- a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
> > +++ b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
> > @@ -15,6 +15,7 @@ Required properties:
> >    "st,ism330dhcx"
> >    "st,lsm9ds1-imu"
> >    "st,lsm6ds0"
> > +  "st,lsm6dsrx"
> >  - reg: i2c address of the sensor / spi cs line
> >
> >  Optional properties:
>

