Return-Path: <SRS0=VXX5=B5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50F9C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 03:17:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90FD320639
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 03:17:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="E3Jxw9St";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="MfQABpbe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgHSDRi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Aug 2020 23:17:38 -0400
Received: from pb-smtp20.pobox.com ([173.228.157.52]:57225 "EHLO
        pb-smtp20.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726751AbgHSDRi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Aug 2020 23:17:38 -0400
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
        by pb-smtp20.pobox.com (Postfix) with ESMTP id B60DDE91D9;
        Tue, 18 Aug 2020 23:17:34 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
        :subject:date:message-id:mime-version:content-transfer-encoding;
         s=sasl; bh=ECtNqBpX1KiG7sDXco5D3tp9GEI=; b=E3Jxw9StgpQOblzQL9+w
        Uf81+1KLqrkKJkuSALqGlWEvMGuylE0WKANWONtW/eA0tX1jDMHbJn0+EEre9dBN
        ItBDuzsjyhijRhJj4bpY/x/ngjW0LMhr/mGjVnQ7FxaOBjM12S0w9URDGlcUuclM
        b9nBYDD2SiLyjTt2cG17rZ4=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp20.pobox.com (Postfix) with ESMTP id 85709E91D8;
        Tue, 18 Aug 2020 23:17:34 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:mime-version:content-transfer-encoding;
 s=2016-12.pbsmtp; bh=OHq8lowul/yS7KQtHipQH3zSCAQ8fvSd7S+l1QV4RxE=;
 b=MfQABpbeGS7cpPTSE3Mq0kr7y61OMjWM/0Hd1ngJEP+qaCa2jN5jr7V71dBHJMXZhBZIyGaHIPUcVsvr+BxddfgqfjlizGxJiqLO+WP/NeO5ftkdWxMlMiZpcOz3pg2ebfguIEqkxWxMKT5owzVHCaX9RzNGiaJDcukI87h5kt0=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp20.pobox.com (Postfix) with ESMTPSA id F2F7BE91D7;
        Tue, 18 Aug 2020 23:17:29 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTP id 16B5D2DA0182;
        Tue, 18 Aug 2020 23:17:28 -0400 (EDT)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Pitre <npitre@baylibre.com>,
        Laura Nixon <laura.nixon@team.mipi.org>,
        Robert Gough <robert.gough@intel.com>,
        Matthew Schnoor <matthew.schnoor@intel.com>
Subject: [PATCH v2 1/2] MIPI I3c HCI (Host Controller Interface) driver
Date:   Tue, 18 Aug 2020 23:17:21 -0400
Message-Id: <20200819031723.1398378-1-nico@fluxnic.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Pobox-Relay-ID: 83DC84BE-E1CA-11EA-96D7-F0EA2EB3C613-78420484!pb-smtp20.pobox.com
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
supported with varying degree due to the above. And of course v2 support
is likely to change as the spec is finalized, but it is included now
in its preliminary form as all I have for testing at the moment is based
on an early v2 draft.

Even v1.0 hardware is still scarse so it hasn't been tested yet. As more
hardware becomes available for testing it is expected that adjustments
will be needed on top of this submission. But it is best to have the
current code merged earlier so it gains better exposure for future
contributions.

Feedback appreciated.

Changes from v1:

- moved DT binding to schema format (Rob)
- fix sparse warnings (kernel test robot)
- fix build warnings on 32-bit targets (kernel test robot)
- avoid PIO_OFFSET symbol conflict (kernel test robot)
- minor cosmetic changes

diffstat:

 .../devicetree/bindings/i3c/mipi-i3c-hci.yaml   |  41 +
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
 drivers/i3c/master/mipi-i3c-hci/dma.c           | 781 ++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/ext_caps.c      | 249 +++++
 drivers/i3c/master/mipi-i3c-hci/ext_caps.h      |  19 +
 drivers/i3c/master/mipi-i3c-hci/hci.h           | 150 +++
 drivers/i3c/master/mipi-i3c-hci/ibi.h           |  42 +
 drivers/i3c/master/mipi-i3c-hci/pio.c           | 961 ++++++++++++++++++
 20 files changed, 4161 insertions(+)


