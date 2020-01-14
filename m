Return-Path: <SRS0=kXJJ=3D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671A5C33CB2
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 14:17:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 33D6D24685
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 14:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579011435;
	bh=Vs5vp9Q0pO/rYvjiF2G3gSvq89rNmL0cw1LbNBbTuZk=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=pBmTvo3v+1uAW7SL0GjjyTFRT8RzVKrrD7I0LHvLFIWZmdUejbCPxQAl0oYdlIGKY
	 TSi+F2TjWOWWbaNmP5LjgrVo+9BWgiuy4oMKTy8jpkhmic6zX5G95o6I8mVUprzLBO
	 52Ir+9YpAWRnlzacmuNc3iszv8LtjmoBmlysOUe0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgANORE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jan 2020 09:17:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:33834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725994AbgANORE (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Jan 2020 09:17:04 -0500
Received: from localhost.localdomain (aaubervilliers-681-1-7-206.w90-88.abo.wanadoo.fr [90.88.129.206])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 20F7D24680;
        Tue, 14 Jan 2020 14:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579011423;
        bh=Vs5vp9Q0pO/rYvjiF2G3gSvq89rNmL0cw1LbNBbTuZk=;
        h=From:To:Cc:Subject:Date:From;
        b=zAfYuw+DRSckBl1J8CDfyssuIGNNADGPIq+IlafAMdRa9CDb5ylpO4WgVUI0AO0in
         2pbR/6QA2Pj1MJkrUn/6keNgeNff43d8N3FWlV6rQ4aUzYoVbaCtyO+I/6lYQF2Mk0
         rq69AeBDAi3s5AA45dz3dOpNSuRUOT61cyjvwzkM=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Ard Biesheuvel <ardb@kernel.org>, jarkko.sakkinen@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, masahisa.kojima@linaro.org,
        devicetree@vger.kernel.org, linux-integrity@vger.kernel.org,
        peterhuewe@gmx.de, jgg@ziepe.ca
Subject: [PATCH v2 0/2] synquacer: add TPM support
Date:   Tue, 14 Jan 2020 15:16:45 +0100
Message-Id: <20200114141647.109347-1-ardb@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds support for driving the TPM on Socionext SynQuacer platforms
using the existing driver for a memory mapped TIS frame.

v2:
- don't use read/write_bytes() to implement read/write16/32 since that uses
  the wrong address

Cc: jarkko.sakkinen@linux.intel.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: masahisa.kojima@linaro.org
Cc: devicetree@vger.kernel.org
Cc: linux-integrity@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: peterhuewe@gmx.de
Cc: jgg@ziepe.ca

Ard Biesheuvel (2):
  dt-bindings: tpm-tis-mmio: add compatible string for SynQuacer TPM
  tpm: tis: add support for MMIO TPM on SynQuacer

 Documentation/devicetree/bindings/security/tpm/tpm_tis_mmio.txt |  1 +
 drivers/char/tpm/tpm_tis.c                                      | 50 +++++++++++++++++++-
 2 files changed, 49 insertions(+), 2 deletions(-)

-- 
2.20.1

