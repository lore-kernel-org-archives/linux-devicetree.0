Return-Path: <SRS0=V00+=YS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5646CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 20:43:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E5C82084C
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 20:43:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLQjGEsJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728696AbfJYUnh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 25 Oct 2019 16:43:37 -0400
Received: from mail-pf1-f174.google.com ([209.85.210.174]:38250 "EHLO
        mail-pf1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbfJYUng (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Oct 2019 16:43:36 -0400
Received: by mail-pf1-f174.google.com with SMTP id c13so2364638pfp.5
        for <devicetree@vger.kernel.org>; Fri, 25 Oct 2019 13:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=MhIfWZvUTsT+3cykBQoz7GSXm1KmvPEXFrA8Ke1u0Qg=;
        b=TLQjGEsJPO1Keyqorjh5aUQsQ3FuYZfiVLuflV+gR5gpHV0EExJedA08st0eyqpjUD
         EPA3pFgSNIlFWZBZzh2pEu2tlcuYNCY+5HnESb9lwRNw469wCmwYteX4dqhKDCsIMBT2
         0thseqRHTUq21OjKKfxugwCCiEue2rgrANYL7vvzI0a1cjsgi2ShJtN4AgVZAlCJUrBr
         4cXGHwTDe2gQb0VRZ/t2tlZ/z/e3dw5kET8q/SyBA/lRQgaswDJBGcu/OagmFWhurqQJ
         +KgfXoQusFq46y5nzr2z+qsmpTtoKsweVVvDO+KUkbwoiuM5OFHtF1qLAaNww5W28Nt3
         wovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=MhIfWZvUTsT+3cykBQoz7GSXm1KmvPEXFrA8Ke1u0Qg=;
        b=owu2Hcmqh3mNA/6q1wsNYdIFsR1HLsX2ToyIdSlXEXHFSWTfdB7w0KZYpRDWEF9pfa
         gtTxu7Kha3tSJWH1qA+z3B6vNXGijQoIwSXS+Z590bpLf+TAQmMA1bqZhph6WmW0+9xK
         3OGT9o5/blt5q0gmtf3tkuRmcvoSmg6CJtnzIMDB/ZJBLSZFWvvZSWpUPzY+1dn1mDjh
         wR+UeI22tY6vCHRVNTsyOsr3aVAE75yVrpbVB/xuQnu2GA9BVSdHh4XoXrAp2FU69qoO
         rczvtltxYPTIz3+zVaevSrzE/5bHHlj8qRrN0tnPqlt6oyUmygaGhHAtr5rsSwWxg4c5
         F7sA==
X-Gm-Message-State: APjAAAXb896oIHVE0Ng++dnOvOtKrQSBDZq2e6XCPC/IpFq5u2as8fkZ
        Kq2peoVD2fnIVhrqsZO56vg=
X-Google-Smtp-Source: APXvYqzY5c5Q7GuAMNZGrNKlMVdDIM6rOqtdaJgueEfhs/dkRVEoRm5yeovDsOiH/POwNbp8LPJ6MQ==
X-Received: by 2002:a17:90a:ec10:: with SMTP id l16mr6631978pjy.37.1572036215877;
        Fri, 25 Oct 2019 13:43:35 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id d7sm3232814pfr.108.2019.10.25.13.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 13:43:35 -0700 (PDT)
Date:   Fri, 25 Oct 2019 13:43:33 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>
Subject: DT schemas for multi-transport bindings
Message-ID: <CAKdAkRQNrDGWFOcoVTfjMS25E4JqSFs98yOQ8_1q7V612az_0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

I am trying to wrap my mind around converting multi-transport bindings
(let's say TSC2004/5 controller which is pretty much the same part, but
one is I2C while another is SPI interface). There is a set of common
properties, and then we can have transport-specific ones (for example,
spi-max-frequency for SPI case). Is it possible to annotate that some
properties are only needed for certain compatible, similarly to how
patternProperties work (but instead of matching node name we'd match on
compatible)?

Also, from syntax POV, how do I reference file ooutside of current
directory? I.e. how do I reference .../spi/spi-controller.yaml from
.../input/touchscreen/tsc2005.yaml?

Thanks.

-- 
Dmitry
