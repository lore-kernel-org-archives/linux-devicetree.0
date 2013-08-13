Return-Path: <devicetree-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:19774 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753964Ab3HMHig (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 13 Aug 2013 03:38:36 -0400
From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V2 0/3] regulator: palmas: add support for external control of rail
Date: Tue, 13 Aug 2013 13:23:09 +0530
Message-ID: <1376380392-19723-1-git-send-email-ldewangan@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: broonie@kernel.org, sameo@linux.intel.com
Cc: swarren@wwwdotorg.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, rob@landley.net, lee.jones@linaro.org, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, gg@slimlogic.co.uk, kishon@ti.com, j-keerthy@ti.com, ian.campbell@citrix.com, Laxman Dewangan <ldewangan@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

This series add the enable/disable of the Palmas regulators to be controlled by
external input signals ENABLE1, ENABLE2 and NSLEEP.

The change is generated on top of
[PATCH v4] regulator: palmas: model SMPS10 as two regulators
by Kishone.

I think it should go on regulator tree if it is fine after review.

Changes from V1:
Fix typos: palams ->palmas

Laxman Dewangan (3):
  regulator: palmas: Update the DT binding doc for smps10 out1 and out2
  mfd: palmas: add support for external control configuration
  regulator: palmas: add support for external control of rails

 .../devicetree/bindings/regulator/palmas-pmic.txt  |   12 +-
 drivers/mfd/palmas.c                               |   97 ++++++++++++++
 drivers/regulator/palmas-regulator.c               |  139 +++++++++++++++++++-
 include/linux/mfd/palmas.h                         |   49 +++++++
 4 files changed, 287 insertions(+), 10 deletions(-)

