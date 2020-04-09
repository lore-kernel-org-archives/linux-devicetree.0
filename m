Return-Path: <SRS0=+eCa=5Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A93AAC2BB55
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 10:14:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1ED062083E
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 10:05:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LPOJzDJI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbgDIKFT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Apr 2020 06:05:19 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35688 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgDIKFS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Apr 2020 06:05:18 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 039A57ho057328;
        Thu, 9 Apr 2020 05:05:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1586426707;
        bh=j1GslTHceembFNhT40rMOJP6pLMS4NODDHZOZOkVCV4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LPOJzDJIaY0Q4xl4sWHQmUvTs/JSANyVc525+I96/6K3Q4Ev23vvttckGTDX9+Gt1
         3tvbfDlYRnhUjgW2d+x9mHl8yCJMmR7LqvRlM0iDp/u0KIdHgnAD4rjEHzdHieChIc
         S12PHxmv7F4s2oa03Bbb2Y5CTCozzSoZfKSfG1ms=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 039A57EL108371
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 9 Apr 2020 05:05:07 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 9 Apr
 2020 05:05:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 9 Apr 2020 05:05:07 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 039A547a014611;
        Thu, 9 Apr 2020 05:05:04 -0500
Subject: Re: [PATCH v9 0/5] drm/tidss: New driver for TI Keystone platform
 Display SubSystem
To:     Sam Ravnborg <sam@ravnborg.org>
CC:     Jyri Sarha <jsarha@ti.com>, <dri-devel@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <peter.ujfalusi@ti.com>, <bparrot@ti.com>, <subhajit_paul@ti.com>,
        <praneeth@ti.com>, <yamonkar@cadence.com>, <sjakhade@cadence.com>
References: <cover.1580129724.git.jsarha@ti.com>
 <d3931419-aa73-daeb-c8f6-8e29166d586a@ti.com>
 <20200407164426.GB2220@ravnborg.org>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <1aaa420d-a29b-3266-d152-209a87a81ba6@ti.com>
Date:   Thu, 9 Apr 2020 13:05:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200407164426.GB2220@ravnborg.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 07/04/2020 19:44, Sam Ravnborg wrote:
> On Tue, Apr 07, 2020 at 04:18:20PM +0300, Tomi Valkeinen wrote:
>> Hi Jyri,
>>
>> On 27/01/2020 18:00, Jyri Sarha wrote:
>>> This is intended to be the last patch series. I'll apply these trough
>>> drm-misc-next tomorrow.
>>
>> Were these ever merged?
> 
> See 32a1795f57eecc3974901760400618571c9d357f
> ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
Ah, sorry, I replied to a wrong thread. I was looking for the patch that adds the DT data to the soc 
dts file... Somehow I thought it's in this series.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
