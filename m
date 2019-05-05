Return-Path: <SRS0=IWi0=TF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from outils.crapouillou.net ([89.234.176.41]:57940 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbfEES4g (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 5 May 2019 14:56:36 -0400
Date: Sun, 05 May 2019 20:56:21 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Multiple device drivers sharing one node
Message-Id: <1557082581.1990.0@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

I have one devicetree node shared by several drivers.

Should the node have one single compatible string, and each
driver matches it, or should it have one different compatible
string per driver?

Thanks,
-Paul
