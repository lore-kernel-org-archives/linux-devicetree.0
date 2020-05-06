Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E14C38A2A
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 23:14:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B59320735
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 23:14:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsjLVjJO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgEFXOF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 19:14:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbgEFXOC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 19:14:02 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F03DCC061A0F;
        Wed,  6 May 2020 16:14:00 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id fb4so1756566qvb.7;
        Wed, 06 May 2020 16:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=/FSZGkNLSJDDR4n1PqDaPoz0aI+Ea15kGRpkEPckonU=;
        b=BsjLVjJOST+HEBPglIqllYkYrofRjyIPV/3DQUSy6oiS5qtdH0hKD5KRKpxPMLbPfe
         EdWrk0u7bu7wlMsWjnMsUWklVL19ig0xGJYittSrc8K7bQVadJT2XeqRC8+ERkhmFyNh
         sjFPePAPfvvpV3PImu8umPx5olAS6NMrDNyNZRuGxJnFyUss4Qmv9oYBIoidSn9fiBUQ
         TpK+z27QiR+mruIbjSUCjSWsqYNR4akaCsdToPa+4q7CNnE3LGr4X9BUhVLDApiouj48
         OAfK/wEasfdPBS5WgkTprOmWpqaB7NMsHPwPlHWOaiAaflmRrEvnOpNs4aQoy0hINTEN
         mdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=/FSZGkNLSJDDR4n1PqDaPoz0aI+Ea15kGRpkEPckonU=;
        b=mz84wTGAEQvy7INf5tTARIvT1z/UoZgoD6qEFyozRucljqWGhDDn0TIllh3SpFCVcd
         S57X4Ik1L29qoV6+oAX0cxjqu6n6MD6j1baimm9YUNeh5RntP3PqlBgWuntYVZ0x48dW
         FOYOy+rgwWkXFV/7ZzUX25WO1cN5yx9331kNIrjvUkSJG3S+G5AIWDcpKdfodIiOZ/lA
         YQ2HUzhime71f6zv7QcSFRwmFeFc9Ownu95F1LTYkHaNrE+O8Rt+InFq8ZZwMzl/L1hC
         l2XNiaT6qYSv9LfzrbKVyHuV9nUxEinPuJ6cmRsqJsx/gBYMbt8Q76VYVNHtz9yUfZww
         UBWA==
X-Gm-Message-State: AGi0PuZvsJIve42q8AdrcTwKTusBY7VnHOUeFrijtEtP1a39sOjHgehO
        4i5t88eiGKwLVwMDmItK0nnLgiZW2Yg=
X-Google-Smtp-Source: APiQypLX+8UR89ZGRmwwx/ExIJVWjxeCcSb5ZS6sTPRbM36UJWIYag3vXHgyGZRg+RpEBBTRyDHICw==
X-Received: by 2002:a0c:ed26:: with SMTP id u6mr10648410qvq.220.1588806840048;
        Wed, 06 May 2020 16:14:00 -0700 (PDT)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id k127sm2875230qkb.35.2020.05.06.16.13.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 May 2020 16:13:59 -0700 (PDT)
To:     devicetree@vger.kernel.org,
        "devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>,
        Devicetree Compiler <devicetree-compiler@vger.kernel.org>
From:   Frank Rowand <frowand.list@gmail.com>
Subject: interested in Devicetree plumbers 2020 session?
Message-ID: <b2e90447-6917-83fb-d006-b647ad86aad3@gmail.com>
Date:   Wed, 6 May 2020 18:13:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi All,

Is anyone interested in attending a Devicetree session at the Plumbers 2020
conference?

And who all is considering traveling to Nova Scotia if the conference is
held in person?

Plumbers 2020 is scheduled for August 25-27.  Details at:

   https://www.linuxplumbersconf.org/

The microconference proposals are due on Thursday May 7.

-Frank
