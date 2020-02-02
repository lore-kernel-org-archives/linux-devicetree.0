Return-Path: <SRS0=/AfF=3W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF9A6C35249
	for <linux-devicetree@archiver.kernel.org>; Sun,  2 Feb 2020 00:14:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D98C20661
	for <linux-devicetree@archiver.kernel.org>; Sun,  2 Feb 2020 00:14:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="W8mIytyO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbgBBAO0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 1 Feb 2020 19:14:26 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:28197 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbgBBAOZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 1 Feb 2020 19:14:25 -0500
X-Greylist: delayed 344 seconds by postgrey-1.27 at vger.kernel.org; Sat, 01 Feb 2020 19:14:25 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1580602464;
        s=strato-dkim-0002; d=xenosoft.de;
        h=In-Reply-To:Date:Message-ID:Subject:From:References:Cc:To:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=M2p6BlJKlzc7zwD9OCcddn1toLSZU/FWLhGgP48heGQ=;
        b=W8mIytyOz7zu8hRVf0LBlcdPbkpi6amlUZ2A5aypJUHh1aniu3IhoxdNQDgFlmCrE0
        ZXM1ASOtdvPZuwMVmAnhOJ94S1QFnTQcsTdkEEQfwaNqWj5EBFNC9n2U8oPWkzPgR594
        zVSj+JOHH0EL5bUq7Qa44Hkf5Z9BzSH7SH6+z4rnwdvJmuGEMAAufVe6/IjHy1ZUp/J+
        ZWEiRsipPVSOCDKU5YlER/N4OEiHuCC5yofWXb+ReWKOWwpHTY2JBk5Cxu082e3zy9wl
        Zze3ThOFBwxGGqaupl0hmb9OlCZ/EZ+Wq2/fRFHmAuGRLIJRvaafXV2kvND/zk3Jf5bg
        UxMw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhSLlpvF7aofGh9KUohSyVOsmPy"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:188b:8a2:e727:e5f1]
        by smtp.strato.de (RZmta 46.1.12 AUTH)
        with ESMTPSA id 40bcf3w1208HBpI
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 2 Feb 2020 01:08:17 +0100 (CET)
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Darren Stevens <darren@stevens-zone.net>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>, linuxppc-dev@ozlabs.org,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        "contact@a-eon.com" <contact@a-eon.com>
References: <20200126115247.13402-1-mpe@ellerman.id.au>
 <CAPDyKFrbYmV6_nV6psVLq6VRKMXf0PXpemBbj48yjOr3P130BA@mail.gmail.com>
From:   Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Latest Git kernel: avahi-daemon[2410]: ioctl(): Inappropriate ioctl
 for device
Message-ID: <58a6d45c-0712-18df-1b14-2f04cf12a1cb@xenosoft.de>
Date:   Sun, 2 Feb 2020 01:08:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAPDyKFrbYmV6_nV6psVLq6VRKMXf0PXpemBbj48yjOr3P130BA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

We regularly compile and test Linux kernels every day during the merge 
window. Since Thuesday we have very high CPU loads because of the avahi 
daemon on our desktop Linux systems (Ubuntu, Debian etc).

Error message: avahi-daemon[2410]: ioctl(): Inappropriate ioctl for device

Could you please test the latest Git kernel?

It is possible to deactivate the avahi daemon with the following lines 
in the file "/etc/avahi/avahi-daemon.conf":

use-ipv4=no
use-ipv6=no

But this is only a temporary solution.

Thanks,
Christian
