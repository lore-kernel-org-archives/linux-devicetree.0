Return-Path: <SRS0=7Fj0=HP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail2.overkiz.com ([80.245.18.67]:34829 "EHLO mail2.overkiz.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754727AbeDZOe3 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 26 Apr 2018 10:34:29 -0400
Received: from web-bm.overkiz.com (web-bm.overkiz.com [213.186.35.215])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail2.overkiz.com (Postfix) with ESMTPS id 6C8FD304A7
        for <devicetree@vger.kernel.org>; Thu, 26 Apr 2018 16:25:01 +0200 (CEST)
Received: from [192.168.2.95] (unknown [80.245.18.66])
        (Authenticated sender: k.carli@overkiz.com)
        by web-bm.overkiz.com (Postfix) with ESMTPSA id C6A5C90005B
        for <devicetree@vger.kernel.org>; Thu, 26 Apr 2018 16:25:32 +0200 (CEST)
From: =?UTF-8?Q?K=c3=a9vin_Carli?= <k.carli@overkiz.com>
Subject: Custom module to add device tree overlay - kernel 4.14-rc4
Message-ID: <923659b8-a093-f793-9b6a-d2df06b18d04@overkiz.com>
Date: Thu, 26 Apr 2018 16:25:18 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

I made a custom module using the kernel API (of_fdt_unflatten_tree + 
of_resolve_phandles + of_overlay_create ) to dynamically (after my 
kernel has booted) insert an overlay.

It seems to work just fine, I can see the result in /proc/device-tree, 
but theses changes are not propagated to /dev or to 
/sys/devices/plateform. So I can't use what I have added using my overlay.

I first though that the device/plateform driver was not re-probed, but 
even if I include a line like this one :

platform_device_register_simple("at91_rtc", -1, NULL, 0);

it does not work :/.

So I was wondering if someone knows a way to dynamically add an overlay 
and can see the changes. (not only in /proc/device-tree).

PS: I don't use U-Boot, nor configfs, and I don't want to use my overlay 
through the bootloader.

Best regards,
Carli-K

