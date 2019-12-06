Return-Path: <SRS0=B/fR=Z4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=BITCOIN_SPAM_02,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,PDS_BTC_ID,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921B4C43603
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 10:44:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 52F5224659
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 10:44:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.org header.i=@raspberrypi.org header.b="eLPrbAOE";
	dkim=pass (2048-bit key) header.d=raspberrypi.org header.i=@raspberrypi.org header.b="MTzmN/6q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbfLFKof (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 6 Dec 2019 05:44:35 -0500
Received: from mx08-00252a01.pphosted.com ([91.207.212.211]:41116 "EHLO
        mx08-00252a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726084AbfLFKof (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 6 Dec 2019 05:44:35 -0500
X-Greylist: delayed 1704 seconds by postgrey-1.27 at vger.kernel.org; Fri, 06 Dec 2019 05:44:33 EST
Received: from pps.filterd (m0102629.ppops.net [127.0.0.1])
        by mx08-00252a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xB6AEl5p032364
        for <devicetree@vger.kernel.org>; Fri, 6 Dec 2019 10:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raspberrypi.org; h=subject : to :
 cc : references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp;
 bh=9GgYl9S1nL+peS4sDvUeeZmWgbpy1Ur8lxeMl3yRwtc=;
 b=eLPrbAOE+XtcjHwZKfgDJEG3f2szxOL9CzvD4u5Tp76yaXOu8HZ5u4BpfjMBlH14u0T8
 ggDpf3cMXALAHypkJntqi5WDHvYm4HPec88GP+6sxCoOGL4e296fe3WPlxbY0xlR+zwa
 EUuqEXOzXeRQZfyFezW7qaJnKBs60vaMu8AmUq+bI78e91WdvAHNfah11hLxgU+zcfD/
 JaqJuNvfAHz52JwEpt9HbFVgBdmGy8uJb5JygEcnBusjdLdCmA/uqsFUe/cEH2dhawao
 Ye04aAp++vKppGxGbA8a+zGinIsh0NKEGhhu/0pD3mItkAdFksPLY069vuPAdXO9XCj6 Eg== 
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        by mx08-00252a01.pphosted.com with ESMTP id 2wncsy1sbw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
        for <devicetree@vger.kernel.org>; Fri, 06 Dec 2019 10:16:09 +0000
Received: by mail-wr1-f70.google.com with SMTP id t3so2903283wrm.23
        for <devicetree@vger.kernel.org>; Fri, 06 Dec 2019 02:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9GgYl9S1nL+peS4sDvUeeZmWgbpy1Ur8lxeMl3yRwtc=;
        b=MTzmN/6q2yxsK9wikV4N236QQisGPJskuPO98xzlu2pYAU8GTzCp4Kt1BQnQswl17H
         v70r1/iLhJKHzznB035De8bQ/UWTXLaknHmdl+Y+F6aVs2MM2k/7MUxACTWH93Rfyf6D
         czFcdDfHfpjUTqaki8VUj/nEeVM+LpZMIFQ8nGNjRi4k4d77BRx5Ch5+VIzZLIEySS5R
         1IQq5fea6OgrsfWr/0K2YuBfMmSvlWJNs2WyAdnP+xkCFzFcOee2EMx5SObtRLJ5tk0c
         1sGZXXK3pMCCK6J3hKYL3r/8BTd2brNrSylfy4XDkMxSW2wAs4OVTSSP5iEs+DyNFIp2
         DZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9GgYl9S1nL+peS4sDvUeeZmWgbpy1Ur8lxeMl3yRwtc=;
        b=r+UMp9QVkJ/xUAbQ9+j2gfBgguPGkpvZlThBeqDbUFvMIRisExvfNCMCKUZ2XTyGsp
         +lhUo/8zpD5XgBdqTrA4WNOFg43wquFt0d9eiqPdax7XhEGC5cOkJlLC0qEF9Xi6aDSx
         cnesIPRr6eLwPCxSBr/0BXA4ARrLoSIisDpgaAuBSQ4OBQhOBCpT+Ncm3qYwEaae7hyU
         8vqk5ALV236VekQybD0v8GonKyaM4Wk6EzDP5W2lRw5f0BGLQ1oeVjecQ0xY8dyHqWQr
         S/fJGAxq5cCW/dz7/2vXpznVnZ13Z0r4cgyvQimrRPwmGbKDA8BARBi5kEwVinPG6cn/
         znPQ==
X-Gm-Message-State: APjAAAWEj96KlDcOu7NP/pnIEkyAZqQjqsDWZlURc0uAyW96ocK4QdK6
        vrDq+TPj/5FvJCTu77G8ZWUraHkSth5dNH9zDt7LRDG3F3f5libIG3LxrP9k7fj209FbzHr9w3J
        6xMG7O6QZcrpAZVgoJgfLEw==
X-Received: by 2002:a1c:8086:: with SMTP id b128mr9783706wmd.80.1575627368331;
        Fri, 06 Dec 2019 02:16:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqwM9YKOu9+eW68BfSK6Z25zAVRza8PYLDiZw6h7bdstTwR+zRv+oNeeaBi3D0KaNXNz/2j1Ew==
X-Received: by 2002:a1c:8086:: with SMTP id b128mr9783661wmd.80.1575627368031;
        Fri, 06 Dec 2019 02:16:08 -0800 (PST)
Received: from ?IPv6:2a00:1098:3142:14:8514:61d5:b7c0:16be? ([2a00:1098:3142:14:8514:61d5:b7c0:16be])
        by smtp.gmail.com with ESMTPSA id a78sm1647809wme.9.2019.12.06.02.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2019 02:16:07 -0800 (PST)
Subject: Re: [PATCH] ARM: dts: bcm2711: fix soc's node dma-ranges
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>
Cc:     mbrugger@suse.com, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20191204125633.27696-1-nsaenzjulienne@suse.de>
 <711470d3-e683-69d4-8f4e-791a76faab29@gmail.com>
From:   Phil Elwell <phil@raspberrypi.org>
Message-ID: <e72de603-2ad9-5a3b-109e-8ee14bf3293c@raspberrypi.org>
Date:   Fri, 6 Dec 2019 10:16:07 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <711470d3-e683-69d4-8f4e-791a76faab29@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_02:2019-12-05,2019-12-06 signatures=0
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Nicolas,

On 06/12/2019 00:08, Florian Fainelli wrote:
> On 12/4/19 4:56 AM, Nicolas Saenz Julienne wrote:
>> Raspberry Pi's firmware has a feature to select how much memory to
>> reserve for its GPU called 'gpu_mem'. The possible values go from 16MB
>> to 944MB, with a default of 64MB. This memory resides in the topmost
>> part of the lower 1GB memory area and grows bigger expanding towards the
>> begging of memory.
>>
>> It turns out that with low 'gpu_mem' values (16MB and 32MB) the size of
>> the memory available to the system in the lower 1GB area can outgrow the
>> interconnect's dma-range as its size was selected based on the maximum
>> system memory available given the default gpu_mem configuration. This
>> makes that memory slice unavailable for DMA. And may cause nasty kernel
>> warnings if CMA happens to include it.
>>
>> Change soc's dma-ranges to really reflect it's HW limitation, which is
>> being able to only DMA to the lower 1GB area.
>>
>> Fixes: 7dbe8c62ceeb ("ARM: dts: Add minimal Raspberry Pi 4 support")
>> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>> ---
>>
>> NOTE: I'd appreciate if someone from the RPi foundation commented on
>> this as it's something that I'll propose to be backported to their tree.

The 0x3c000000 size was a mistake that arose from c0000000 + 3c000000 = 
fc000000, but that is mixing apples and oranges (actually DMA addresses
and host physical addresses). Please correct it as you are proposing.

> 
> I don't think our additional DTS changes will be merged until -rc1 is
> cut, so we have some time to figure this one out. Thanks
> 
>>
>>   arch/arm/boot/dts/bcm2711.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
>> index 5b61cd915f2b..d6a0e350b7b4 100644
>> --- a/arch/arm/boot/dts/bcm2711.dtsi
>> +++ b/arch/arm/boot/dts/bcm2711.dtsi
>> @@ -43,7 +43,7 @@ soc {
>>   			 <0x7c000000  0x0 0xfc000000  0x02000000>,
>>   			 <0x40000000  0x0 0xff800000  0x00800000>;
>>   		/* Emulate a contiguous 30-bit address range for DMA */
>> -		dma-ranges = <0xc0000000  0x0 0x00000000  0x3c000000>;
>> +		dma-ranges = <0xc0000000  0x0 0x00000000  0x40000000>;
>>   
>>   		/*
>>   		 * This node is the provider for the enable-method for
>>
> 
> 
