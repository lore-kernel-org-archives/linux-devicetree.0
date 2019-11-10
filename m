Return-Path: <SRS0=/VR8=ZC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A441AC43331
	for <linux-devicetree@archiver.kernel.org>; Sun, 10 Nov 2019 18:00:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 723362085B
	for <linux-devicetree@archiver.kernel.org>; Sun, 10 Nov 2019 18:00:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PWOeVJxr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbfKJSAY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 10 Nov 2019 13:00:24 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:43055 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726800AbfKJSAY (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Sun, 10 Nov 2019 13:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573408823;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Hixz/IzNhB0JpEt6Ya+nzMEp0JX0n9HHRljmP2H+u7k=;
        b=PWOeVJxrdPV96KX75VXDEHVAYtXZsH3xFUJtGvAQ0GCYAgwPfrRNhOsOetKvG14457VnL2
        xAtM/rKgP3FzEdkGsoPCYj0oQgpE4eQgXnDdszrZFjOlRfW4WmuySpcuhZ86bGV2QlANFj
        CmHTfuD1DBWmUru8N5EEbeYyfuyJSac=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-IOeI-j6lMSC_qF4NuJLVkg-1; Sun, 10 Nov 2019 13:00:14 -0500
Received: by mail-pl1-f197.google.com with SMTP id f7so8888799plj.12
        for <devicetree@vger.kernel.org>; Sun, 10 Nov 2019 10:00:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=Um2+4ViHEGLtX+G0u5WhQV8LmjxfVLK7h3RGaAChVEk=;
        b=BsN+8kcsf935YwWYWq0c2jT1hGnexy43Kc7eK6BUuvxD4o6RO3Xd12L2rehQ+Cc8Np
         wOecTcntyjTeS38y1073wQDoCfds7glFzqpG685qVVCb80fvlrTOc/RtTD17mWHnqVu1
         0UTez89I5+Z9UGm6QGXdBqPdnPic1y/Fc1/pGqfrdp1GVfrlpepCeDu+HNcKC+NDqg5U
         Tsm3gKhyEucr53hQdGbhku4SHrZYzlIdbWkbyWMHffnM1Fwqx6HD0/hvPoavToTpOtg/
         y2aG+iMKKak6KRxbH9Gzd+ju3zUqElRffuNQYc2WxCebzZ8qwTDNBsmr45AyltRQaxv3
         OY/A==
X-Gm-Message-State: APjAAAVvLleAk7d7brVuDxkYW5hzTPMkWdnmRfF0DvEswK8soIayCb51
        Gn6YEes/oJP9bq1nUj5RXSZT6EvV75uHxh22XBvLqK/mKlJ9wSxlXu0QqdXcLmgoPyvFUCs1RfI
        ylgSl0dwBI7vrtYN8fMqPLA==
X-Received: by 2002:a17:902:b20b:: with SMTP id t11mr22199281plr.211.1573408812854;
        Sun, 10 Nov 2019 10:00:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqyfWm4OglYklA+A7wQRUWJBtP0mHnD6YYVjbFQFg9Q6GxMN0YxEL0MKIhZn8HxYbk8Q0luQ3A==
X-Received: by 2002:a17:902:b20b:: with SMTP id t11mr22199248plr.211.1573408812514;
        Sun, 10 Nov 2019 10:00:12 -0800 (PST)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
        by smtp.gmail.com with ESMTPSA id 27sm12289493pgx.23.2019.11.10.10.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2019 10:00:11 -0800 (PST)
Date:   Sun, 10 Nov 2019 11:00:10 -0700
From:   Jerry Snitselaar <jsnitsel@redhat.com>
To:     amirmizi6@gmail.comg, Stefan Berger <stefanb@linux.vnet.ibm.com>
Cc:     Eyal.Cohen@nuvoton.com, jarkko.sakkinen@linux.intel.com,
        oshrialkoby85@gmail.com, alexander.steffen@infineon.com,
        robh+dt@kernel.org, mark.rutland@arm.com, peterhuewe@gmx.de,
        jgg@ziepe.ca, arnd@arndb.de, gregkh@linuxfoundation.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-integrity@vger.kernel.org, oshri.alkoby@nuvoton.com,
        tmaimon77@gmail.com, gcwilson@us.ibm.com, kgoldman@us.ibm.com,
        ayna@linux.vnet.ibm.com, Dan.Morav@nuvoton.com,
        oren.tanami@nuvoton.com, shmulik.hagar@nuvoton.com,
        amir.mizinski@nuvoton.com
Subject: Re: [PATCH v1 3/5] char: tpm: rewrite "tpm_tis_req_canceled()"
Message-ID: <20191110180010.xyvv4gf6jiqyrac3@cantor>
Reply-To: Jerry Snitselaar <jsnitsel@redhat.com>
Mail-Followup-To: amirmizi6@gmail.comg,
        Stefan Berger <stefanb@linux.vnet.ibm.com>, Eyal.Cohen@nuvoton.com,
        jarkko.sakkinen@linux.intel.com, oshrialkoby85@gmail.com,
        alexander.steffen@infineon.com, robh+dt@kernel.org,
        mark.rutland@arm.com, peterhuewe@gmx.de, jgg@ziepe.ca,
        arnd@arndb.de, gregkh@linuxfoundation.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-integrity@vger.kernel.org, oshri.alkoby@nuvoton.com,
        tmaimon77@gmail.com, gcwilson@us.ibm.com, kgoldman@us.ibm.com,
        ayna@linux.vnet.ibm.com, Dan.Morav@nuvoton.com,
        oren.tanami@nuvoton.com, shmulik.hagar@nuvoton.com,
        amir.mizinski@nuvoton.com
References: <20191110162137.230913-1-amirmizi6@gmail.com>
 <20191110162137.230913-4-amirmizi6@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191110162137.230913-4-amirmizi6@gmail.com>
X-MC-Unique: IOeI-j6lMSC_qF4NuJLVkg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun Nov 10 19, amirmizi6@gmail.com wrote:
>From: Amir Mizinski <amirmizi6@gmail.com>
>
>using this function while read/write data resulted in aborted operation.
>after investigating according to TCG TPM Profile (PTP) Specifications,
>i found cancel should happen only if TPM_STS.commandReady bit is lit
>and couldn't find a case when the current condition is valid.
>also only cmdReady bit need to be compared instead of the full lower statu=
s register byte.
>
>Signed-off-by: Amir Mizinski <amirmizi6@gmail.com>
>---
> drivers/char/tpm/tpm_tis_core.c | 12 +-----------
> 1 file changed, 1 insertion(+), 11 deletions(-)
>
>diff --git a/drivers/char/tpm/tpm_tis_core.c b/drivers/char/tpm/tpm_tis_co=
re.c
>index ce7f8a1..9016f06 100644
>--- a/drivers/char/tpm/tpm_tis_core.c
>+++ b/drivers/char/tpm/tpm_tis_core.c
>@@ -627,17 +627,7 @@ static int probe_itpm(struct tpm_chip *chip)
>
> static bool tpm_tis_req_canceled(struct tpm_chip *chip, u8 status)
> {
>-=09struct tpm_tis_data *priv =3D dev_get_drvdata(&chip->dev);
>-
>-=09switch (priv->manufacturer_id) {
>-=09case TPM_VID_WINBOND:
>-=09=09return ((status =3D=3D TPM_STS_VALID) ||
>-=09=09=09(status =3D=3D (TPM_STS_VALID | TPM_STS_COMMAND_READY)));
>-=09case TPM_VID_STM:
>-=09=09return (status =3D=3D (TPM_STS_VALID | TPM_STS_COMMAND_READY));

Stefan were these cases you found that were deviating from the spec? Wonder=
ing
if dropping these will cause issues for these devices.

>-=09default:
>-=09=09return (status =3D=3D TPM_STS_COMMAND_READY);
>-=09}
>+=09return ((status & TPM_STS_COMMAND_READY) =3D=3D TPM_STS_COMMAND_READY)=
;
> }
>
> static irqreturn_t tis_int_handler(int dummy, void *dev_id)
>--=20
>2.7.4
>

