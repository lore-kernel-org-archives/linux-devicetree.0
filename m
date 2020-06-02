Return-Path: <SRS0=mVKz=7P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6229FC433E1
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 15:18:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 430F120757
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 15:18:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IHA54byG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbgFBPSy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 2 Jun 2020 11:18:54 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:33598 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbgFBPSy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 2 Jun 2020 11:18:54 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052FIBl9080160;
        Tue, 2 Jun 2020 15:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=goh2CjFO2OFs3pZp2oX5aZuGyT+iy3/nHuM1bPl/gaE=;
 b=IHA54byGViv1xA85nmDf/7GQNGXznlHYhlC87CtDLuvViPKOBbwgjJYKoSgJ9XJVCPtE
 jDAJZfHSy34Du3AMicRnbAamyMW5YEbIY8Qce+N+bk9gGmLxN6lt24O1Z//81ERs7c1z
 HgoStbQcltiAor/5/h7iwLlAbSkH2xAJsbNRsRXecOH1Ez9h15iR2fw624er3SUQ02bN
 uu8mMw8+8770HuFHouvBJvQBH04TOEVLyaDLpQ3r5MiiBgm7AeBxN0m3rXVeEUdCswbu
 xmpLmelXOFTDMo0X8oM5SbXKgQJxAevaLJ2CUk/EFBe0e8W3LNpxpBUoEaVhOp1OMCcr 7Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 31dkruhngm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 02 Jun 2020 15:18:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052FDvEE006186;
        Tue, 2 Jun 2020 15:18:30 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 31c25p7g3e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 02 Jun 2020 15:18:30 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 052FISDW018762;
        Tue, 2 Jun 2020 15:18:28 GMT
Received: from [10.74.110.208] (/10.74.110.208)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 02 Jun 2020 08:18:28 -0700
Subject: Re: [PATCH resend 0/2] dts: keystone-k2g-evm: Display support
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>,
        dri-devel@lists.freedesktop.org, ssantosh@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc:     mark.rutland@arm.com, praneeth@ti.com, robh+dt@kernel.org,
        peter.ujfalusi@ti.com, laurent.pinchart@ideasonboard.com
References: <cover.1581671951.git.jsarha@ti.com>
 <6749076a-cbc1-d8e2-bc35-2e2a9ad80a6d@oracle.com>
 <973b69f2-bbe1-3c1b-615f-751bb8d5d83e@ti.com>
From:   santosh.shilimkar@oracle.com
Organization: Oracle Corporation
Message-ID: <5e4c0754-f347-25d7-e5b6-11bc490dfcc0@oracle.com>
Date:   Tue, 2 Jun 2020 08:18:26 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <973b69f2-bbe1-3c1b-615f-751bb8d5d83e@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9640 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006020110
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9640 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 adultscore=0 mlxlogscore=999 cotscore=-2147483648 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006020110
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 6/2/20 1:13 AM, Tomi Valkeinen wrote:
> Hi Santosh,
> 
> On 14/02/2020 19:40, santosh.shilimkar@oracle.com wrote:
>> On 2/14/20 1:22 AM, Jyri Sarha wrote:
>>> Resend because the earlier recipient list was wrong.
>>>
>>> Now that drm/tidss is queued for mainline, lets add display support for
>>> k2g-evm. There is no hurry since tidss is out only in v5.7, but it
>>> should not harm to have the dts changes in place before that.
>>>
>>> Jyri Sarha (2):
>>>    ARM: dts: keystone-k2g: Add DSS node
>>>    ARM: dts: keystone-k2g-evm: add HDMI video support
>>>
>>>   arch/arm/boot/dts/keystone-k2g-evm.dts | 101 +++++++++++++++++++++++++
>>>   arch/arm/boot/dts/keystone-k2g.dtsi    |  22 ++++++
>>>   2 files changed, 123 insertions(+)
>>>
>> Ok. Will add this to the next queue.
> 
> What happened with this one? It used to be in linux-next, but now I 
> don't see it anymore.
> 
Pull request [1] was sent during last merge window. Thought it was
picked up but doesn't seems to be. Have sent question to arm-soc
maintainers.

Regards,
Santosh

[1] https://www.spinics.net/lists/arm-kernel/msg791224.html
