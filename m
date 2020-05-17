Return-Path: <SRS0=ZMZy=67=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B78C433E0
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 May 2020 11:27:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C016A206D4
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 May 2020 11:27:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYroECOf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727898AbgEQL1q (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 17 May 2020 07:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727893AbgEQL1q (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 17 May 2020 07:27:46 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C51BBC061A0C
        for <devicetree@vger.kernel.org>; Sun, 17 May 2020 04:27:45 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id o10so6370544ejn.10
        for <devicetree@vger.kernel.org>; Sun, 17 May 2020 04:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=wFo4edMgiMvDCE2ZNhrsI8JxusUUeYELSKbsEkZuweU=;
        b=eYroECOfkbshRN4UHce19TarI42rYOPdoOO+Ae5Nvz54wRupZXnV/wp734PaIrRK0I
         Gwbbwr5pIrfyRL71CrZCuQz1hOOrysD7VYolrMJeWbTGk/r/cwk7z2kvL2SFp/NobJs1
         jbsyODoR/xA4Qtm6Jv3KSg+v8Kyi5Y1L+73MRedIKQkNlNwU41vWNU2jRyiNJbu4pVlJ
         FRtBNsCL8lK+huBmker8gzIrDYc7PtoP0tbPSF3YeI/99t+S9O+2S9Ax9oCd/Oy4Z/CG
         4Jf+aZD4U1vLPo64fMAPtSrs3BluE/GSPeaVvERlI0d+l6eHYm/WQhuormaWhcJF6NGc
         071w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=wFo4edMgiMvDCE2ZNhrsI8JxusUUeYELSKbsEkZuweU=;
        b=e3Bd1ljIm173zKkbXEjGi7BaqXgydCW4Pf7pAZhMBc0cmORDlHPGyd3KuZOaz81ScP
         OzuZRfe6FUqFUKh33mU+l/KJ9bhXs0zmkT+k1H0pZczDjjCHglPOT1NyhP0Uf8tVHAym
         c7ogbHmKupLPBaevDW3kKQN0AGvV1oTqER2ZSsHxztZ6p250v8GbUOj8MvZEzoQ6v1G1
         vjuK8o29vmVyl3f890RN46B3QJh1891WGJh0Yy+i3RVDj9hQZqwZSc8UHhGA5alLyw6z
         zw4Zc20H4XeahUwQuvMd9k4wb46JeoiLBN0nvZIFVy07li6S3T258fZ5N9aTjcnk6Gm4
         TFWQ==
X-Gm-Message-State: AOAM531VQgT+tm5CRJeZLepCPYIZqJL+1gYkJZ61IZwLhIAm73JD86YX
        SD52Jmpe96g5QXelW26asl28qJQ9ic1R6cTSca/uva5H
X-Google-Smtp-Source: ABdhPJzEzPGimMRiyAfg2Ypa5oq0NmZuWJm0dAmlAp0WVhFv98aBqUbL9NK3nj9Y8vhrka8EL/zGBz9rbOgRuDmRLvs=
X-Received: by 2002:a17:906:4c8e:: with SMTP id q14mr11262106eju.208.1589714864311;
 Sun, 17 May 2020 04:27:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab4:a881:0:0:0:0:0 with HTTP; Sun, 17 May 2020 04:27:43
 -0700 (PDT)
From:   Jupiter <jupiter.hce@gmail.com>
Date:   Sun, 17 May 2020 21:27:43 +1000
Message-ID: <CAA=hcWQ8ZjjdzdTVtBas42L0_qbhJhayqogz_Gg5wgtDBVo+hg@mail.gmail.com>
Subject: Issue with 'ubi part' ubi_io_read: error -74 (ECC error)
To:     linux-mtd <linux-mtd@lists.infradead.org>
Cc:     u-boot@lists.denx.de
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Sorry for a bit recalcitrant with the issue of calling 'ubi part"
error -74 -EBADMSG, is it MTD issue or u-boot issue?

I used Linux kernel 4.19 to flash UBIFS volume images ubi.img to
imx6ull NAND using following command in Linux:

flash_erase /dev/mtd2 0 0
ubiformat /dev/mtd2 -f ubi.img

The flashing image process went well, not errors, but in NAND booting
(u-boot version 2018), running "ubi part" stuck following errors:

ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 2
35:0, read 64 bytes
ubi0 error: ubi_io_read: error -74 (ECC error) while reading 2048 bytes from PEB
 235:2048, read 2048 bytes

The document says "The -74 error code is -EBADMSG and means an ECC
error. In other words, UBI tried to read some data from the flash, but
the flash driver found that there is an uncorrectable ECC error, and
returned -EBADMSG."

My question for ubiformat, how does it write ECC to UBIFS volume
partition when it flashed UBIFS image to NAND?

In NAND booting, how does the "ubi part" read ECC (DTB) from?

Thank you very much, appreciate your kind advice.

- j


-- 
"A man can fail many times, but he isn't a failure until he begins to
blame somebody else."
-- John Burroughs
