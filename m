Return-Path: <SRS0=Bobf=ZU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3559C432C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 07:03:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 958972154A
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 07:03:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eI6hxl3P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbfK1HDj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 02:03:39 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:34256 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbfK1HDi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 Nov 2019 02:03:38 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAS73WRI056601;
        Thu, 28 Nov 2019 01:03:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574924612;
        bh=RQ0zcmpZWcxSL7j9Y78G5ZOBLq3EnnLJQ/BVgcwqkS0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=eI6hxl3PQ+Bi5Afqw/k9sCt+yXZxAEG0tkkMA1RGF3yhS+UJ/msJ4FLvxVwDZohY4
         raGlds/j7rNgaGYyq4L+A95TDbdOPHw7m5hY/ekfpA6Lh5VMQcSf4UCEWBTBrNSnNO
         qYPXToc5R3oSr5Y1s7FaueEaleyzX20zl5Qs+TPA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAS73WiX084039
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 28 Nov 2019 01:03:32 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 28
 Nov 2019 01:03:31 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 28 Nov 2019 01:03:31 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAS73TtG107070;
        Thu, 28 Nov 2019 01:03:30 -0600
Subject: Re: [PATCH 0/3] drm/omap: fix am4 evm lcd
To:     Tony Lindgren <tony@atomide.com>
CC:     <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jyri Sarha <jsarha@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <52608d4e-dd67-1232-41e7-e6d0cba58783@ti.com>
 <20191127154556.GI43123@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <777ac96f-1d27-9a2e-f11a-ab453340b9bd@ti.com>
Date:   Thu, 28 Nov 2019 09:03:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191127154556.GI43123@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Tony,

On 27/11/2019 17:45, Tony Lindgren wrote:

>>> Interestingly, the actual panel at least on my EVMs and ePOSes is not
>>> osd057T0559-34ts, but osd070t1718-19ts. Also, I was unable to find any
>>> information about osd057T0559-34ts. I don't know the history with this,
>>> so it is possible that the early versions of the boards did have
>>> osd057T0559-34ts, but was later changed to osd070t1718-19ts.
> 
> I guess you could keep the old compatible there too if really needed.
> But then again if the old compatible is known to be incorrect, it
> should be just updated.
> 
> So it looks good to me for the dts changes. Do you want me to pick
> them into fixes as it seems that the panel driver fix is a separate
> issue?

Yes, the third patch can be handled separately, so please pick the first two ones.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
