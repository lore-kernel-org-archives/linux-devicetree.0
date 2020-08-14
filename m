Return-Path: <SRS0=/1Tz=BY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2085C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Aug 2020 03:49:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FC992078D
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Aug 2020 03:49:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="DzLPNtjm";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="LKLkIYAI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbgHNDtX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Aug 2020 23:49:23 -0400
Received: from pb-smtp2.pobox.com ([64.147.108.71]:53832 "EHLO
        pb-smtp2.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726570AbgHNDtV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 13 Aug 2020 23:49:21 -0400
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id C576F7DE79;
        Thu, 13 Aug 2020 23:49:17 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
        :subject:date:message-id:mime-version:content-transfer-encoding;
         s=sasl; bh=3EOAK/AIuTICdHDACnG4b7XirBw=; b=DzLPNtjmOd9REvFVlXbl
        9fSM21sAXWn/bTagCm47BGuSrC4o3Rj5Vg6FjFQmdHQbZaP77B8Aw860GWUGvRK0
        tLloRQSpA0Ix8YL7bhTEenAxTS8upamkmuYhhc49fQdWTwZYBDcozQm2Wfc5HbzA
        4fcOfIh5Atf53jh7mVshEMQ=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id BDC487DE78;
        Thu, 13 Aug 2020 23:49:17 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:mime-version:content-transfer-encoding;
 s=2016-12.pbsmtp; bh=dPbO6nCZhG8BrQOMkPTrZaHyMFrVur7sPH0FpeDT9Q0=;
 b=LKLkIYAIetAQ+sH0geyPuKrKge/IxbQU1jS4osjhyGirHIZJ8Du0za6LXGyAuFW5zXXfB3BMxuYYo9J3JKfKHqzLpFt5MvkgUCt4vKSPq4k9lVl/ZzAdPSz7ezsa9MP7K+gvgV8MbJni53xGQXorSmkQtezYUNer4eDjjaz2Z74=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 3FEF67DE75;
        Thu, 13 Aug 2020 23:49:17 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTP id 4F8112DA0BC7;
        Thu, 13 Aug 2020 23:49:16 -0400 (EDT)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Pitre <npitre@baylibre.com>,
        Laura Nixon <laura.nixon@team.mipi.org>,
        Robert Gough <robert.gough@intel.com>,
        Matthew Schnoor <matthew.schnoor@intel.com>
Subject: [PATCH 0/2] MIPI I3c HCI (Host Controller Interface) driver
Date:   Thu, 13 Aug 2020 23:48:52 -0400
Message-Id: <20200814034854.460830-1-nico@fluxnic.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Pobox-Relay-ID: 209D6220-DDE1-11EA-9949-2F5D23BA3BAF-78420484!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The MIPI I3C HCI (Host Controller Interface) specification defines
a common software driver interface to support compliant MIPI I3C
host controller hardware implementations from multiple vendors. This
is the initial Linux driver implementing support for this specification.

Due to limitations in the I3C subsystem, this driver doesn't implement
everything the spec specifies. For example, scheduled commands,
auto-commands and NCM are major features not yet supported.

There are different revisions of the spec: v1.0, v1.1 (to be released
imminently), and 2.0 (still under active development). All of them are
supported with varying degree due to the above, and of course v2 support
is likely to change as the spec is finalized. But it is included
nevertheless as all I have for testing at the moment is based on
an early v2 draft. Even v1.0 hardware is still scarse so it wasn't
tested yet. As more hardware becomes available for testing it is likely
that adjustments will be needed on top of this. But it is best to have
the code merged earlier so it gains better exposure for future
contributions, etc.

Feedback appreciated.

diffstat:

 .../devicetree/bindings/i3c/mipi-i3c-hci.txt    |  15 +
 drivers/i3c/master/Kconfig                      |  13 +
 drivers/i3c/master/Makefile                     |   1 +
 drivers/i3c/master/mipi-i3c-hci/Makefile        |   9 +
 drivers/i3c/master/mipi-i3c-hci/cmd.h           | 106 ++
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c        | 362 +++++++
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c        | 280 +++++
 drivers/i3c/master/mipi-i3c-hci/core.c          | 801 +++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/dat.h           |  28 +
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c        | 170 ++++
 drivers/i3c/master/mipi-i3c-hci/dct.h           |  16 +
 drivers/i3c/master/mipi-i3c-hci/dct_v1.c        |  36 +
 drivers/i3c/master/mipi-i3c-hci/debug.c         |  79 ++
 drivers/i3c/master/mipi-i3c-hci/debug.h         |  17 +
 drivers/i3c/master/mipi-i3c-hci/dma.c           | 767 ++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/ext_caps.c      | 249 +++++
 drivers/i3c/master/mipi-i3c-hci/ext_caps.h      |  19 +
 drivers/i3c/master/mipi-i3c-hci/hci.h           | 150 +++
 drivers/i3c/master/mipi-i3c-hci/ibi.h           |  42 +
 drivers/i3c/master/mipi-i3c-hci/pio.c           | 961 ++++++++++++++++++
 20 files changed, 4121 insertions(+)

