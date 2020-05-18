Return-Path: <SRS0=92uP=7A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1907EC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 11:31:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3C6E20756
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 11:31:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgERLbr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 07:31:47 -0400
Received: from foss.arm.com ([217.140.110.172]:38570 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726585AbgERLbr (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 18 May 2020 07:31:47 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0AC5106F;
        Mon, 18 May 2020 04:31:46 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6B7FA3F52E;
        Mon, 18 May 2020 04:31:45 -0700 (PDT)
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 00/20] dts/dt-bindings: Fix Arm Ltd. ARMv8 "boards"
Date:   Mon, 18 May 2020 12:31:32 +0100
Message-Id: <158980112843.33280.16226851289892007676.b4-ty@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513103016.130417-1-andre.przywara@arm.com>
References: <20200513103016.130417-1-andre.przywara@arm.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 13 May 2020 11:29:56 +0100, Andre Przywara wrote:
> A few updates compared to v2. The most important is to fix the
> interrupt-maps, triggered by changing the number of address-cells in
> the GIC node. For this I split the former patch 07/17 into two (09/20
> and 10/20), one for the foundation model, the other for Juno.
> Also I fixed a dtc complaint about device nodes without reg properties
> being inside simple-bus nodes, those are the new patches 04-06/20.
> Will took patch 01/17 from v2 already, so I removed this from this
> series.
> The rest of the patches stayed the same.
> -----------------------------------
> 
> [...]

Hi Andre,

Patch 12/20 was missing your Signed-off tags, re-applied adding the same.

Applied to scmi-vexpress-juno (for-next/juno), thanks!

[02/20] arm64: dts: fvp/juno: Fix node address fields
        https://git.kernel.org/sudeep.holla/c/bb5cce12ac
[03/20] arm64: dts: fvp: Move fixed devices out of bus node
        https://git.kernel.org/sudeep.holla/c/849bfc3dfc
[04/20] arm64: dts: vexpress: Move fixed devices out of bus node
        https://git.kernel.org/sudeep.holla/c/d9258898ad
[05/20] arm64: dts: fvp: Move fixed clocks out of bus node
        https://git.kernel.org/sudeep.holla/c/feebdc3f79
[06/20] arm64: dts: juno: Move fixed devices out of bus node
        https://git.kernel.org/sudeep.holla/c/948204a1bf
[07/20] arm64: dts: juno: Fix mem-timer
        https://git.kernel.org/sudeep.holla/c/0e529dae51
[08/20] arm64: dts: fvp: Fix GIC compatible names
        https://git.kernel.org/sudeep.holla/c/336edacfb9
[09/20] arm64: dts: juno: Fix GIC child nodes
        https://git.kernel.org/sudeep.holla/c/a78aee9e43
[10/20] arm64: dts: fvp: Fix GIC child nodes
        https://git.kernel.org/sudeep.holla/c/78631aecc5
[11/20] arm64: dts: fvp: Fix ITS node names and #msi-cells
        https://git.kernel.org/sudeep.holla/c/fac959c93f
[12/20] arm64: dts: juno: Use proper DT node name for USB
        https://git.kernel.org/sudeep.holla/c/a66ab61b2c
[13/20] arm64: dts: fvp/juno: Fix serial node names
        https://git.kernel.org/sudeep.holla/c/1d33445a19
[14/20] arm64: dts: fvp: Fix SMMU DT node
        https://git.kernel.org/sudeep.holla/c/386270bad0
[15/20] arm64: dts: fvp/juno: Fix bus node names
        https://git.kernel.org/sudeep.holla/c/48db29f2c9
[16/20] arm64: dts: juno: Fix GPU interrupt order
        https://git.kernel.org/sudeep.holla/c/90280c4dc0
[17/20] arm64: dts: vexpress: Fix VExpress LED names
        https://git.kernel.org/sudeep.holla/c/dc6e874179
[18/20] arm64: dts: juno: Fix SCPI shared mem node name
        https://git.kernel.org/sudeep.holla/c/267c673233

--
Regards,
Sudeep

