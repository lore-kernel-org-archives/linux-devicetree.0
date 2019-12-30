Return-Path: <SRS0=2Mri=2U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93EB2C2D0C2
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Dec 2019 18:02:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C72120748
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Dec 2019 18:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577728970;
	bh=gRKYcl0jCq7nW7Gxn+7gNtKzmmdScmcjqsaffdi6YAc=;
	h=In-Reply-To:References:From:Cc:To:Subject:Date:List-ID:From;
	b=r4MyEdMJkainXgH7pZZ+6mRamL7oRwqEkuHj/owb4o86p1GtjQT4xW6jcNlOvULX7
	 DmGck+9OxzS3tQ2omFaOsOr8AdwVmN02IS0vPV1xBbpIe3xqN5V6ZiwZBmHvUjscDa
	 MhXdoeB70c3K/upLlDj2RH+hdCyQJPtHnZ1QXoO0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbfL3SCr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 30 Dec 2019 13:02:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:60216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726602AbfL3SCq (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 30 Dec 2019 13:02:46 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E76A820718;
        Mon, 30 Dec 2019 18:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577728966;
        bh=gRKYcl0jCq7nW7Gxn+7gNtKzmmdScmcjqsaffdi6YAc=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=vSiG+ePNA5iMVvnrQ9qXREgzn1ME5/fjIl9LGPYvAP3NwvAh+s5VPG60KXKssWe0m
         fNa+nIK1v43x+g+N1Luwxwz5KvAnx1yvVgvJxQEGJ7UjMCf62sTxJo9kFMtcCuRyL/
         58qjHbTJsxzWjKYqvhI+MznhgVYhhnF4VZqAeMrs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1577421760-1174-1-git-send-email-tdas@codeaurora.org>
References: <1577421760-1174-1-git-send-email-tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v2 0/3] Add modem Clock controller (MSS CC) driver for SC7180
User-Agent: alot/0.8.1
Date:   Mon, 30 Dec 2019 10:02:45 -0800
Message-Id: <20191230180245.E76A820718@mail.kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Taniya Das (2019-12-26 20:42:37)
> [v2]
>   * Update the license for the documentation and fix minor comments in the
>     YAML bindings.

I see Sibi has comments. Please resend with those comments addressed.

