Return-Path: <SRS0=tl9x=5S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E452C43331
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 08:04:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 433912078B
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 08:04:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=waldekranz-com.20150623.gappssmtp.com header.i=@waldekranz-com.20150623.gappssmtp.com header.b="0HPfuqj3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387603AbgDBIE6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Apr 2020 04:04:58 -0400
Received: from mail-lj1-f173.google.com ([209.85.208.173]:45847 "EHLO
        mail-lj1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbgDBIE6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Apr 2020 04:04:58 -0400
Received: by mail-lj1-f173.google.com with SMTP id t17so2187148ljc.12
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2020 01:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=waldekranz-com.20150623.gappssmtp.com; s=20150623;
        h=content-transfer-encoding:in-reply-to:date:subject:from:to:cc
         :message-id;
        bh=XQZDDCfqzrHXRzCxBWJnl/aWw3Nw+jAcBp/lGh2mgiM=;
        b=0HPfuqj3MgB7P0rn53IWIK+Ne937bITDv2rsQXN6uCE2BBQebP547iaEHH6dRMSxNr
         4VGUhzqyo7Mg2d0txJgZgjIYwlJyJYY0btv+qNtG61olGOzl1Vj53K+3AwmVAK9KqKU4
         leWabsVJj3bu1+EyFSFuBc91OgVsMWQe910fgBTf9yufpFE+My8EpiS8DWQ/mQn04mrj
         dKRXimrB4mJxEIndN1x07LiRjw0juafqqMHVYF9Yaw9lYXJ5h4d2Er03yCKHVC0YEy95
         eGJV1VisYI7m99Q4v3uM/HWICfb60z1qDYoY8mTB3T2wHVilM+JXsUPxrvIuCstSGqmZ
         v6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:in-reply-to:date
         :subject:from:to:cc:message-id;
        bh=XQZDDCfqzrHXRzCxBWJnl/aWw3Nw+jAcBp/lGh2mgiM=;
        b=Yzx1nCKnwUKGbKU0bohhEPObJuPwbdvr/MyJOCrH2mZ+1mR0HAIiazrfRGs5UVY18h
         373mDXAoUS3Qb0Zm2aKiXW7EoSBEeWt/mf+idjy8idQk+piPfnm+J0EZ/Em+L2orzkkL
         OMsi8z2b+0GheUmGvMmv8N1EjMVYXIPjo3cSCajmm+/dxt4TBdFzssFF+p+0m6beFd5x
         5kK4x9+L6qXHNFZDVLXFHybnMNlrchCiKAQWQvR6u+9GVr852X4V52IT+2gx67dQRaFP
         9HKtLdnuKQXaZWmHSVVP7Gn0d8nOUT/gyaiothw6fv5xhQN1TZp4J/t8tkdPKvI1Ojwf
         YHxQ==
X-Gm-Message-State: AGi0PuZvOlmRP5vcFdMGuLDxd6nkM8Ou+mI5IO/S1XZ5KghFtlUkQ1eJ
        i5Go3U/+KXw98Juj7jQvNlfYChncmyDB1Q==
X-Google-Smtp-Source: APiQypLfgdVYubZFJtOenRgIER0sqtAl9x94eGBWVWyNDyNHwwuVQtskiKfjjxB/YfaG9A3JbKMmmA==
X-Received: by 2002:a2e:9252:: with SMTP id v18mr1273195ljg.114.1585814691777;
        Thu, 02 Apr 2020 01:04:51 -0700 (PDT)
Received: from localhost (static-193-12-47-89.cust.tele2.se. [193.12.47.89])
        by smtp.gmail.com with ESMTPSA id c2sm3426591lfb.43.2020.04.02.01.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 01:04:51 -0700 (PDT)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20200401175804.2305-1-robh@kernel.org>
Date:   Thu, 02 Apr 2020 09:52:22 +0200
Subject: Re: [PATCH] dt-bindings: net: mvusb: Fix example errors
From:   "Tobias Waldekranz" <tobias@waldekranz.com>
To:     "Rob Herring" <robh@kernel.org>,
        "David S. Miller" <davem@davemloft.net>
Cc:     <devicetree@vger.kernel.org>,
        "Tobias Waldekranz" <tobias@waldekranz.com>,
        <netdev@vger.kernel.org>
Message-Id: <C1QK4JZDOZ2B.24IAC4AFLHWP9@wkz-x280>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed Apr 1, 2020 at 1:58 PM PST, Rob Herring wrote:
> The example for Marvell USB to MDIO Controller doesn't build:

Thank you for fixing this. I did run 'make dt_binding_check' before
submitting, but my branch did not have the latest kbuild additions
which passed the examples through dtc.

I'll make sure to address the remaining comments once net-next is open
again.

Thanks,
Tobias
