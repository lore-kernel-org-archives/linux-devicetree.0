Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D88C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 09:38:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC488214D8
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 09:38:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qfBA9crz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728360AbfLLJiD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 04:38:03 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:42568 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728230AbfLLJiD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 04:38:03 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBC9bt3X116840;
        Thu, 12 Dec 2019 03:37:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576143475;
        bh=HUf0DkE09sggmGmSyuBFAtRESt4VmzM6TaB0sHXLLw4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=qfBA9crzpKVHm+EX+83RdlPlLEdraV9cncsnv6Lijw8Dzxl+zVjMQPCjZJbiVDzZs
         9ZqsxBHA5zUHRZ3KKaVqxeu5cFQFFRiiieuq1E7R+3VjfMPes+d8f0/8fObgpuUCCu
         ZTcibzjzIUutSAsmTT91BGhQYMvJ2gy9FVzb6Oaw=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBC9btm1120032;
        Thu, 12 Dec 2019 03:37:55 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 03:37:54 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 03:37:54 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBC9bqSk007059;
        Thu, 12 Dec 2019 03:37:52 -0600
Subject: Re: [PATCH 2/3] ARM: dts: am437x-gp/epos-evm: drop unused panel
 timings
To:     Tony Lindgren <tony@atomide.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jyri Sarha <jsarha@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <20191114093950.4101-3-tomi.valkeinen@ti.com>
 <20191202130459.GH4929@pendragon.ideasonboard.com>
 <20191211165331.GC43123@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <45dae8f7-2f5e-6948-5a05-dc8a09ace1fa@ti.com>
Date:   Thu, 12 Dec 2019 11:37:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191211165331.GC43123@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 11/12/2019 18:53, Tony Lindgren wrote:
> * Laurent Pinchart <laurent.pinchart@ideasonboard.com> [191202 13:05]:
>> Hi Tomi,
>>
>> Thank you for the patch.
>>
>> On Thu, Nov 14, 2019 at 11:39:49AM +0200, Tomi Valkeinen wrote:
>>> panel-simple now handled panel osd070t1718-19ts, and we no longer need
>>> the panel timings in the DT file. So remove them.
>>
>> Should you in that case drop the panel-dpi compatible string too, as the
>> panel-dpi bindings require panel timings in DT ?
> 
> Yeah sounds like if panel-dpi is no longer usable for this device it
> should be dropped from the compatible list.

Ok, I agree.

Looking at the dts files, panel-dpi is used in a bunch of boards. But we even have 3 dts files with 
panel-dpi, without the detailed panel model in compatible...

Fixing those will break the compatibility with old dtbs and new kernel, unless we add 
timings-from-dt to a panel driver that handles panel-dpi.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
