Return-Path: <SRS0=98KY=4J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DE8C35647
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 10:43:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC93920722
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 10:43:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wNdjBGFC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727581AbgBUKnq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 05:43:46 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34772 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbgBUKnq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Feb 2020 05:43:46 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01LAhW1o094026;
        Fri, 21 Feb 2020 04:43:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582281812;
        bh=AEQZl1stVNCyYiQ2uYf0+iWIzY42kDBnkpNU3d42SXQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=wNdjBGFCM8Ky8PtqwENmYr/oSgd194UBZVXt+MqEK9Ie47yDKpkS/z0OC5+rUzixP
         cECFlCe9Z4c0dTKflBxLDq2/ti6FCfSOT7a7k4o0WkTjNkD6+kf3kuCZISJhl1lmFf
         AcmDuodRcysxdOVR1NYaXg3x5VPkvK2IHPM2mrrg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01LAhWdp014099
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 21 Feb 2020 04:43:32 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 21
 Feb 2020 04:43:31 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 21 Feb 2020 04:43:31 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01LAhTtK025236;
        Fri, 21 Feb 2020 04:43:30 -0600
Subject: Re: [PATCH 3/3] drm/panel: simple: fix osd070t1718_19ts sync drive
 edge
To:     Sam Ravnborg <sam@ravnborg.org>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
        <dri-devel@lists.freedesktop.org>, Jyri Sarha <jsarha@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <20191114093950.4101-4-tomi.valkeinen@ti.com>
 <20191202130717.GI4929@pendragon.ideasonboard.com>
 <a9cf515c-dbdd-e70d-5a89-1211c1049d16@ti.com>
 <20200214213902.GA22233@ravnborg.org>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <b36c42ea-3162-7462-7a51-c7b63620404f@ti.com>
Date:   Fri, 21 Feb 2020 12:43:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214213902.GA22233@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sam,

On 14/02/2020 23:39, Sam Ravnborg wrote:
> Hi Tomi.
> 
> On Mon, Feb 10, 2020 at 10:15:33AM +0200, Tomi Valkeinen wrote:
>> Hi Thierry,
>>
>> On 02/12/2019 15:07, Laurent Pinchart wrote:
>>> Hi Tomi,
>>>
>>> Thank you for the patch.
>>>
>>> On Thu, Nov 14, 2019 at 11:39:50AM +0200, Tomi Valkeinen wrote:
>>>> The panel datasheet says that the panel samples at falling edge, but
>>>> does not say anything about h/v sync signals. Testing shows that if the
>>>> sync signals are driven on falling edge, the picture on the panel will
>>>> be slightly shifted right.
>>>>
>>>> Setting sync drive edge to the same as data drive edge fixes this issue.
>>>>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>>>
>>> I don't have access to the documentation, but this makes sense, so
>>>
>>> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>
>>>> ---
>>>>    drivers/gpu/drm/panel/panel-simple.c | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
>>>> index 5d487686d25c..0784536ae6af 100644
>>>> --- a/drivers/gpu/drm/panel/panel-simple.c
>>>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>>>> @@ -2397,7 +2397,8 @@ static const struct panel_desc osddisplays_osd070t1718_19ts = {
>>>>    		.height = 91,
>>>>    	},
>>>>    	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
>>>> -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
>>>> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
>>>> +		DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE,
>>>>    	.connector_type = DRM_MODE_CONNECTOR_DPI,
>>>>    };
>>
>> Can this be merged?
> 
> I have lost the original mail.
> Can you re-send or provide a patchwork pointer or similar.
> Then I will apply.

Here are lore and patchwork links. Note that the first two patches in the series have already been handled.

https://lore.kernel.org/dri-devel/20191114093950.rT5m86Xh0-a9FZGq7JipQ3O3vldctJYcvRdhxUMGBVE@z/#t

https://patchwork.freedesktop.org/series/69459/

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
