Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C226C33CAD
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 12:04:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2FFE52084D
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 12:04:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="C9IirWiC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbgAMMEn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 07:04:43 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33174 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgAMMEn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 07:04:43 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00DC4ZJr097265;
        Mon, 13 Jan 2020 06:04:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578917075;
        bh=A1XedcPXvbRKBkpZOeHIwI2DnTHQR9L7cGA4caxJfWM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=C9IirWiCen5nn6EKNJxu2zG6GMegSEUoZyLcXB+Ot2bp2WPoVTBLeR5rZIfXNOB2H
         mOwUt9NcK4eHimYZA68dhxzeWZdfnLCacOMvO29BkpnWBOfv3h5rclEKJ/1FU/WQLA
         su4LNtKKR999Qu4Pm504oQOqA/UWmrz0rtUUSqf4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00DC4ZM0102040
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 13 Jan 2020 06:04:35 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 13
 Jan 2020 06:04:34 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 13 Jan 2020 06:04:34 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00DC4Wd8035858;
        Mon, 13 Jan 2020 06:04:33 -0600
Subject: Re: [PATCH 3/3] drm/panel: simple: fix osd070t1718_19ts sync drive
 edge
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>, Jyri Sarha <jsarha@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <20191114093950.4101-4-tomi.valkeinen@ti.com>
 <20191202130717.GI4929@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <beb62b97-f45e-2cbc-6e2b-a05f1ef60e29@ti.com>
Date:   Mon, 13 Jan 2020 14:04:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191202130717.GI4929@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Thierry,

On 02/12/2019 15:07, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Thu, Nov 14, 2019 at 11:39:50AM +0200, Tomi Valkeinen wrote:
>> The panel datasheet says that the panel samples at falling edge, but
>> does not say anything about h/v sync signals. Testing shows that if the
>> sync signals are driven on falling edge, the picture on the panel will
>> be slightly shifted right.
>>
>> Setting sync drive edge to the same as data drive edge fixes this issue.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> 
> I don't have access to the documentation, but this makes sense, so
> 
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
>> ---
>>   drivers/gpu/drm/panel/panel-simple.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
>> index 5d487686d25c..0784536ae6af 100644
>> --- a/drivers/gpu/drm/panel/panel-simple.c
>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>> @@ -2397,7 +2397,8 @@ static const struct panel_desc osddisplays_osd070t1718_19ts = {
>>   		.height = 91,
>>   	},
>>   	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
>> -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
>> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
>> +		DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE,
>>   	.connector_type = DRM_MODE_CONNECTOR_DPI,
>>   };
>>   
> 

Can you pick this one up?

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
