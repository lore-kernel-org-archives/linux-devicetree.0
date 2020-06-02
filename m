Return-Path: <SRS0=mVKz=7P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8627C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 08:14:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AB47207D5
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 08:14:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="doCaxwsb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgFBIOB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 2 Jun 2020 04:14:01 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:51350 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbgFBIOB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 2 Jun 2020 04:14:01 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0528DWxd017543;
        Tue, 2 Jun 2020 03:13:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1591085612;
        bh=W/u4Gfn8Bq+eBQ50ZyVyRSF3E4LsSNzZM/DU8aita/I=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=doCaxwsbt8NFkstWB1KPdIFMfNjNNLipev6pIncVThGfebFxJlpuA8OL30Yng3UFj
         6Xe2UD2dJJh6/C1MfVGr3uoMTVjo1fodAEdjUUk3YKDlZW/eOLr4jL1NI1mIx6CbK0
         kR7YE9RNq8m1Q48wvNO5pRUPz0/9jAUcSJxqHqjc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0528DWEE024193
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 2 Jun 2020 03:13:32 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 2 Jun
 2020 03:13:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 2 Jun 2020 03:13:32 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0528DTnO024976;
        Tue, 2 Jun 2020 03:13:29 -0500
Subject: Re: [PATCH resend 0/2] dts: keystone-k2g-evm: Display support
To:     <santosh.shilimkar@oracle.com>, Jyri Sarha <jsarha@ti.com>,
        <dri-devel@lists.freedesktop.org>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
CC:     <mark.rutland@arm.com>, <praneeth@ti.com>, <robh+dt@kernel.org>,
        <peter.ujfalusi@ti.com>, <tomi.valkeinen@ti.com>,
        <laurent.pinchart@ideasonboard.com>
References: <cover.1581671951.git.jsarha@ti.com>
 <6749076a-cbc1-d8e2-bc35-2e2a9ad80a6d@oracle.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <973b69f2-bbe1-3c1b-615f-751bb8d5d83e@ti.com>
Date:   Tue, 2 Jun 2020 11:13:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <6749076a-cbc1-d8e2-bc35-2e2a9ad80a6d@oracle.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Santosh,

On 14/02/2020 19:40, santosh.shilimkar@oracle.com wrote:
> On 2/14/20 1:22 AM, Jyri Sarha wrote:
>> Resend because the earlier recipient list was wrong.
>>
>> Now that drm/tidss is queued for mainline, lets add display support for
>> k2g-evm. There is no hurry since tidss is out only in v5.7, but it
>> should not harm to have the dts changes in place before that.
>>
>> Jyri Sarha (2):
>>    ARM: dts: keystone-k2g: Add DSS node
>>    ARM: dts: keystone-k2g-evm: add HDMI video support
>>
>>   arch/arm/boot/dts/keystone-k2g-evm.dts | 101 +++++++++++++++++++++++++
>>   arch/arm/boot/dts/keystone-k2g.dtsi    |  22 ++++++
>>   2 files changed, 123 insertions(+)
>>
> Ok. Will add this to the next queue.

What happened with this one? It used to be in linux-next, but now I don't see it anymore.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
