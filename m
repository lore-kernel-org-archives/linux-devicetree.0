Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9A8C38A2A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 14:05:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9B092082E
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 14:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588860305;
	bh=do7jj4xNiV93/Ok5rLnVTv8RM5tgiHm8W42BbdTJhtg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=1nBFKOhBsLvyv2/U4WfU/HbxL7tMY3P4J6LgLRnaL4s3iCTfwUGOXvP8ShSIS8A8H
	 0GvL94Xbify/T1ns4KUiHHe5T6Xnez4326eMbAOX5r8+YJhk0fD0E9EiEK2pt46nWe
	 8xayJtlGhLwn10cxXmGTTyi74eokQpw1U9euw5dg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgEGOFE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 10:05:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:55228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbgEGOFE (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 7 May 2020 10:05:04 -0400
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 32DE4205C9;
        Thu,  7 May 2020 14:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588860304;
        bh=do7jj4xNiV93/Ok5rLnVTv8RM5tgiHm8W42BbdTJhtg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ihvV3xfnDKpebQZ3Ywf5sLUtP522MrZXgyFJFLL6xvm1K7NICybc9EkWnEBnUvrt3
         zpw1blEz4xFNQjy1YPstcN3IqAWG46LTywYV4IaOyqnEiAfIJVg8v1FctIjfohU9GN
         HJcEKsTlK1EWrOs9YMTszd52O2RkDWjFiekG+nfY=
From:   Will Deacon <will@kernel.org>
To:     Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Rob Herring <robh@kernel.org>,
        Andre Przywara <andre.przywara@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     catalin.marinas@arm.com, Will Deacon <will@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 00/17] dts/dt-bindings: Fix Arm Ltd. ARMv8 "boards"
Date:   Thu,  7 May 2020 15:04:53 +0100
Message-Id: <158885788096.89602.16621379341221804648.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200507112430.183940-1-andre.przywara@arm.com>
References: <20200507112430.183940-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 7 May 2020 12:24:13 +0100, Andre Przywara wrote:
> Just some small fixes in v2: changing the GIC binding instead of the
> compatible strings used for Juno, re-ordering the patches, and, most
> importantly, (hopefully) fixing the subject lines ;-)
> I keep the last two patches in, even though I agree that there should be
> a more generic solution.
> -----------------------------------
> 
> [...]

Applied the SMMU patch to will (for-joerg/arm-smmu/updates), thanks!

[01/17] dt-bindings: arm-smmu: Allow mmu-400, smmu-v1 compatible
        https://git.kernel.org/will/c/bd0d696023cb

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
