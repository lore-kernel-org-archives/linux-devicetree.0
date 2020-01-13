Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EFFC33CAF
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 12:02:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9CE6720CC7
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 12:02:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YrwMozSe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgAMMCH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 07:02:07 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:56356 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgAMMCH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 07:02:07 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00DC1x5L110807;
        Mon, 13 Jan 2020 06:01:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578916919;
        bh=H2gDMp/Ne//Z1zeRNw2FyZRd1bmJxMtU/ICfn0o8bn8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=YrwMozSeEbxwQYqZ6eHn1HJ3hd1lE3Yu+JqwShV2x7AxkYNy/lfmrsFa+3GZ5XHGY
         z3XwTeT/DjEawhQCRX5xHHSkxsGfEHKTyHVYVxndDTo0wDDr7LloI6vD7LgvPlYzYK
         R77R8LHCocu0S85+vVqV+2PGlRh++FMvx4pLxlJQ=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00DC1xwq104092
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 13 Jan 2020 06:01:59 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 13
 Jan 2020 06:01:58 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 13 Jan 2020 06:01:58 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00DC1uN6105432;
        Mon, 13 Jan 2020 06:01:57 -0600
Subject: Re: [PATCH 2/3] ARM: dts: am437x-gp/epos-evm: drop unused panel
 timings
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Tony Lindgren <tony@atomide.com>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jyri Sarha <jsarha@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <20191114093950.4101-3-tomi.valkeinen@ti.com>
 <20191202130459.GH4929@pendragon.ideasonboard.com>
 <20191211165331.GC43123@atomide.com>
 <45dae8f7-2f5e-6948-5a05-dc8a09ace1fa@ti.com>
 <20191212203550.GB4892@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <add3d8af-6977-68e6-fb77-2fa748c4714a@ti.com>
Date:   Mon, 13 Jan 2020 14:01:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191212203550.GB4892@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 12/12/2019 22:35, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Thu, Dec 12, 2019 at 11:37:51AM +0200, Tomi Valkeinen wrote:
>> On 11/12/2019 18:53, Tony Lindgren wrote:
>>> * Laurent Pinchart <laurent.pinchart@ideasonboard.com> [191202 13:05]:
>>>> Hi Tomi,
>>>>
>>>> Thank you for the patch.
>>>>
>>>> On Thu, Nov 14, 2019 at 11:39:49AM +0200, Tomi Valkeinen wrote:
>>>>> panel-simple now handled panel osd070t1718-19ts, and we no longer need
>>>>> the panel timings in the DT file. So remove them.
>>>>
>>>> Should you in that case drop the panel-dpi compatible string too, as the
>>>> panel-dpi bindings require panel timings in DT ?
>>>
>>> Yeah sounds like if panel-dpi is no longer usable for this device it
>>> should be dropped from the compatible list.
>>
>> Ok, I agree.
>>
>> Looking at the dts files, panel-dpi is used in a bunch of boards. But
>> we even have 3 dts files with panel-dpi, without the detailed panel
>> model in compatible...
>>
>> Fixing those will break the compatibility with old dtbs and new
>> kernel, unless we add timings-from-dt to a panel driver that handles
>> panel-dpi.
> 
> I know, and I don't have a perfect answer for this :-( I don't see a
> third option, it's either breaking DT backward compatibility or adding
> timings parsing to a panel driver (either a new panel-dpi driver or to
> panel-simple). What's your preferred option ?

Hmm, I just realized that changing these will break omapfb. It relies on panel-dpi and timings from 
DT...

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
