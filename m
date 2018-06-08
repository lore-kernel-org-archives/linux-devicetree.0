Return-Path: <SRS0=zHxe=I2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ua0-f169.google.com ([209.85.217.169]:34758 "EHLO
        mail-ua0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750858AbeFHGPe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 Jun 2018 02:15:34 -0400
Received: by mail-ua0-f169.google.com with SMTP id 74-v6so8176982uav.1
        for <devicetree@vger.kernel.org>; Thu, 07 Jun 2018 23:15:34 -0700 (PDT)
MIME-Version: 1.0
From: Aravind Machiry <machiry@cs.ucsb.edu>
Date: Thu, 7 Jun 2018 23:15:33 -0700
Message-ID: <CANozA0hg1FWOxnPYJrh459nJEJFOdG5x5hGu=1spC_P8ze-q6w@mail.gmail.com>
Subject: Security patches and CVEs
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

HI all,


We are researchers looking at Linux kernel patches, we noticed that
there are few patches which fix a potential security issue but do not
have a CVE (https://cve.mitre.org/) number associated with it.


Recent Example:
https://github.com/torvalds/linux/commit/482137bf2aecd887ebfa8756456764a2f6a0e545#diff-37ac0f0eaad3a953bb2d050a9506b784

Few questions:

It is commonly understood in academia that security patches have
associated CVE numbers, but is it surprising to see that there are
potential security patches missing CVE numbers, Why is this so?

What is the policy of assigning CVEs?

Is it the responsibility of the person submitting the patch to request
a CVE number?


-Best,
Aravind
