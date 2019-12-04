Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E4E4C43603
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 18:41:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6441220675
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 18:41:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCOTNzFs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728357AbfLDSlV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 13:41:21 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34609 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728244AbfLDSlU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Dec 2019 13:41:20 -0500
Received: by mail-lj1-f193.google.com with SMTP id m6so503612ljc.1
        for <devicetree@vger.kernel.org>; Wed, 04 Dec 2019 10:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=bdg8PpD1MNHjs9vqnpj5cadFXnKlLB7xAq7e78HRGIc=;
        b=hCOTNzFsvN2B8K8ypwCfX75bNtw42G4wSgGWju7HH5Dle0mVeyGGoIPXGvUPJR72QN
         T9Oe9vwf2zwDeji2tmDCnHxEcWjwzKioscr6wpForK2QNgwpip70cJQ2JHjeUyhxAmWM
         8yUA5evuoc6gkwoubLp44ujxB28TcE90AKTXnoc/hQcRWWbfhvHauTb72AFPKVov0T7X
         opVrJwrfZROBDTXuOCikn/47ckGiCRYLNuzb9RqbzYKaZJL90TtT1xFtnbhCw+3jmC0+
         Xy2J2kVK4yQC07HFApsPygiW61rYBKeRig/sw88codai4BU2X2uF2USqOeZ/e8EzWTD4
         tH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=bdg8PpD1MNHjs9vqnpj5cadFXnKlLB7xAq7e78HRGIc=;
        b=pgl5qOAzrf+3CY5z018JGowqKVjvFLmeFk/YL7vWA75GksUhu/IVu0IEUJVeCUjlyY
         9SM0vVXdZQAuih2nLx6M0B9qtyoYhCmg+pmcKjdb64QlO1HND0KRAp+kT8IlSLdmfaQl
         zlDDmmLSvW83u3MdSksTFku2HAZy0gD9AgYDSI5l1scki5OfafTxP22q2PCbi2n1vhPn
         Vbyp6eb1fjlkaX/RhpjgodfoBpZl7Vx4srWJrA5tman6+kbJB7aNMnyy3ugXk98livCK
         qzwOwqTcKk4OgCJqTNp1f2MCsOh2GwgqaDdYA1LgE9M4/b0Yu3xDNoTROKj6Zrp2rwiT
         QLvA==
X-Gm-Message-State: APjAAAWeIosHmXr4U81fPYwzHc9J1LWQOHDBocNJWBgeqcXvtQr8gm33
        210z8/tLuz4F4iwWgJXgQgTCTS+lxa2jhVeNMg9YOQ==
X-Google-Smtp-Source: APXvYqxmamObVgr5isJY1iQfqh+YvbucMI0gq2iAqgxq/k3fx23zjKVofcyEJeZzTd12VKqdQBAgZRptCVATzP6UWF4=
X-Received: by 2002:a2e:85c9:: with SMTP id h9mr3055403ljj.155.1575484878898;
 Wed, 04 Dec 2019 10:41:18 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab3:699:0:0:0:0:0 with HTTP; Wed, 4 Dec 2019 10:41:18 -0800 (PST)
Reply-To: sgt.kayla12@gmail.com
From:   kayla <alexsson100@gmail.com>
Date:   Wed, 4 Dec 2019 18:41:18 +0000
Message-ID: <CAK=mMtxMeNKhC49SSH7PjqQ4ehg-92LnVxh5CYBrioSTr3ydqg@mail.gmail.com>
Subject: Hello,
To:     devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Happy new month to you my dear,how are you today?,have you received my
massage?,please write me back,God bless you.
