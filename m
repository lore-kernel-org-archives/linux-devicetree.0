Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA63EC433E3
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 14:02:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADD09207DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 14:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594389774;
	bh=sPHnyFrT+qxKtGBUJegtEf5cWJ1hNsRdvHyYkSenN88=;
	h=Date:From:To:To:To:Cc:Cc:Subject:In-Reply-To:References:List-ID:
	 From;
	b=Hvta9bsxfgyAEF9FETqgf0aBg8dBXd1jc/rp2eG6GxVXsly9FXMJ36Lb7w5Eaifkk
	 uhx1LaXNNvbSqJc8MgHDZfWCkUHQ00MZwJ9v0UODGkfy310M9NEK8VFqGqNvEzTK1v
	 itMmYhjnmaZ5vvl37vl663R/yCBAcw6ihvEZQbSk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbgGJOCr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 10:02:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:49776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728328AbgGJOCo (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 10 Jul 2020 10:02:44 -0400
Received: from localhost (unknown [137.135.114.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6097C207BB;
        Fri, 10 Jul 2020 14:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594389764;
        bh=sPHnyFrT+qxKtGBUJegtEf5cWJ1hNsRdvHyYkSenN88=;
        h=Date:From:To:To:To:Cc:Cc:Subject:In-Reply-To:References:From;
        b=yJP2EcgkVLL3gWd0gyUu7mJrsLdmxob5/Bu2hr9dRBP4ui92qGL6zDQjzVsCCUzD0
         Y7XMYFxgp4pcp5SQP6t1H7a1IlGPyYfkNdwLKi1gtunCYzWopZ0xtsxMzPa6FS1Edv
         HDq7MrCxH94vZ0SGSkdrJ8e1MpReaNaJq4cyPi2o=
Date:   Fri, 10 Jul 2020 14:02:43 +0000
From:   Sasha Levin <sashal@kernel.org>
To:     Sasha Levin <sashal@kernel.org>
To:     Dinh Nguyen <dinguyen@kernel.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     dinguyen@kernel.org, devicetree@vger.kernel.org
Cc:     stable@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: stratix10: add status to qspi dts node
In-Reply-To: <20200629203949.6601-2-dinguyen@kernel.org>
References: <20200629203949.6601-2-dinguyen@kernel.org>
Message-Id: <20200710140244.6097C207BB@mail.kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: 0cb140d07fc7 ("arm64: dts: stratix10: Add QSPI support for Stratix10").

The bot has tested the following trees: v5.7.7, v5.4.50, v4.19.131.

v5.7.7: Build OK!
v5.4.50: Failed to apply! Possible dependencies:
    3c0f3b8545e79 ("arm64: dts: add NAND board files for Stratix10 and Agilex")

v4.19.131: Failed to apply! Possible dependencies:
    116edf6e5239e ("MIPS: mscc: add DT for Ocelot PCB120")
    1ac832509f2ea ("nds32: Support FP emulation")
    387181dcdb6c1 ("RISC-V: Always compile mm/init.c with cmodel=medany and notrace")
    3c0f3b8545e79 ("arm64: dts: add NAND board files for Stratix10 and Agilex")
    4b36daf9ada30 ("arm64: dts: agilex: Add initial support for Intel's Agilex SoCFPGA")
    704cfd7f5f71c ("ARM: sti: remove pen_release and boot_lock")
    78e3dbc166a13 ("ARM: Prepare RDA8810PL SoC")
    7938e6315c9af ("nds32: Power management for nds32")
    9671f7061433e ("Allow to disable FPU support")
    9fb29c734f9e9 ("ARM: milbeaut: Add basic support for Milbeaut m10v SoC")
    c32e64e852f3f ("csky: Build infrastructure")
    c4c14c3bd177e ("csky: remove builtin-dtb Kbuild")
    e46bf83c1864a ("nds32: nds32 FPU port")
    ebd09753b5707 ("nds32: Perf porting")
    ec8f24b7faaf3 ("treewide: Add SPDX license identifier - Makefile/Kconfig")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
