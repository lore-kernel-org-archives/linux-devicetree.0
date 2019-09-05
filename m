Return-Path: <SRS0=ZhZM=XA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25508 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729809AbfIEHi7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Sep 2019 03:38:59 -0400
From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: MMC: Ingenic: Add support for 8bit mode and LPM and JZ4760 Soc
Date: Thu,  5 Sep 2019 15:38:05 +0800
Message-Id: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, ulf.hansson@linaro.org, paul.burton@mips.com, linus.walleij@linaro.org, paul@crapouillou.net, malat@debian.org, yuehaibing@huawei.com, ezequiel@collabora.com, robh+dt@kernel.org, mark.rutland@arm.com, syq@debian.org, jiaxun.yang@flygoat.com
List-ID: <devicetree@vger.kernel.org>

1.adjust the macro definition name to match the corresponding
  register name in the datasheet.
2.add support for 8bit mode, now supports 1bit/4bit/8bit modes.
3.add support for probing mmc driver on the JZ4760 Soc from Ingenic.
4.add support for Low Power Mode of Ingenic's MMC/SD Controller.
