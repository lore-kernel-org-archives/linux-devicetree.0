Return-Path: <SRS0=2gCm=5I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA28C4332E
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 01:34:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BF782206F8
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 01:34:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgCWBeI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Mar 2020 21:34:08 -0400
Received: from regular1.263xmail.com ([211.150.70.202]:49674 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726895AbgCWBeI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 22 Mar 2020 21:34:08 -0400
Received: from localhost (unknown [192.168.167.209])
        by regular1.263xmail.com (Postfix) with ESMTP id 2787D415;
        Mon, 23 Mar 2020 09:33:35 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from hp1216 (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P11671T139978406659840S1584927214117798_;
        Mon, 23 Mar 2020 09:33:34 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <1b0edf511b5824d2ec8bf57941cdf57b>
X-RL-SENDER: zyf@rock-chips.com
X-SENDER: zyf@rock-chips.com
X-LOGIN-NAME: zyf@rock-chips.com
X-FST-TO: miquel.raynal@bootlin.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Date:   Mon, 23 Mar 2020 09:33:35 +0800
Organization: =?UTF-8?B?55Ge6Iqv5b6u55S15a2Q?=
From:   =?UTF-8?B?6LW15Luq5bOw?= <yifeng.zhao@rock-chips.com>
To:     "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc:     richard <richard@nod.at>, vigneshr <vigneshr@ti.com>,
        robh+dt <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-mtd <linux-mtd@lists.infradead.org>,
        =?UTF-8?B?SGVpa29TdMO8Ym5lcg==?= <heiko@sntech.de>,
        linux-rockchip <linux-rockchip@lists.infradead.org>
Subject: Re: Re: [PATCH v4 0/3] Add Rockchip NFC drivers for RK3308 and others
References: <20200320093342.15470-1-yifeng.zhao@rock-chips.com>, 
        <20200320111841.3386d415@xps13>
X-Priority: 3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.15.80[cn]
Mime-Version: 1.0
Message-ID: <2020032309312035921797@rock-chips.com>
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SGkgTWlxdWVsLAoKRG8geW91IG1lYW4geW91IGhhdmUgcmVjZWl2ZWQgVjQgc2VyaWVzIHRocmVl
IHRpbWVz77yfIAoKSSBvbmx5IHNlbmQgdjQgZm9yIHRoaXMgc2VyaWVzIG9uZSB0aW1lLgrCoApU
aGFua3MsCllpZmVuZwoKPkhpIFlpZmVuZywKPgo+WWlmZW5nIFpoYW8gPHlpZmVuZy56aGFvQHJv
Y2stY2hpcHMuY29tPiB3cm90ZSBvbiBGcmksIDIwIE1hciAyMDIwCj4xNzozMzozOSArMDgwMDoK
Pgo+PiBSb2NrY2hwJ3MgTkZDKE5hbmQgRmxhc2ggQ29udHJvbGxlcikgaGFzIHRocmVlIHZlcnNp
b25zOiBWNiwgVjggYW5kIFY5Lgo+PiBUaGlzIHNlcmllcyBwYXRjaCBjYW4gc3VwcG9ydCBhbGzC
oCB0aHJlZSB2ZXJzaW9ucy4KPj4KPj4KPkl0IGxvb2tzIGxpa2UgaXQncyB0aGUgdGhpcmQgdGlt
ZSB5b3Ugc2VuZCBhIHY0IGZvciB0aGlzIHNlcmllcywgaWYgeW91Cj5jaGFuZ2UgdGhpbmdzIGlu
IHRoZSBzZXJpZXMsIHBsZWFzZSBpbmNyZWFzZSB0aGUgdmVyc2lvbiBudW1iZXIuIElmCj5pdCBp
cyBhIG1pc3Rha2UsIHBsZWFzZSB0ZWxsIHVzIHNvLCBiZWNhdXNlIGl0IGlzIG5vdCBlYXN5IHRv
IGZvbGxvdyA6KQo+Cj4KPlRoYW5rcywKPk1pcXXDqGwKPgo+Cj4=



