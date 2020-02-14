Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82B2C2BA83
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 17:41:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C3A77206B6
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 17:41:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="yewe0/WD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389411AbgBNRla (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 12:41:30 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:49318 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390130AbgBNRl3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Feb 2020 12:41:29 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01EHdOCr069590;
        Fri, 14 Feb 2020 17:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=KmIo45/8rqTg+TK1KulK6p+LZsxnvdRAU4LsG4AGcFA=;
 b=yewe0/WD7pxSXUGJYSzccmoQh5jmPWdrnBPN2j2OMmFa1XrlxWAKzUpMdDrgq8Es6qRS
 mIRAS3dyhyMiRtdb0Zl7lqaMNMgIvXcwNc4+/OH1Hl6Tt/vpCj3cx9XUZQ1PPhpb6LCW
 vWBC/SL3ljjb5zcjXEw7d7n0kqk1dRbeCx/Ky67WK3zPD8LK7agSdjsWLeeFn7NaTkyI
 rmTpv1xqDamLAF4+zoDr17fSTtEbRJRY904qqbURjWa/P+dp3JOeE0ZVhvnFHs0FaipU
 vgp5xwHmPMLNM82Yfhkj/dyWGQLBLaTeigtWj9ux1XOk2mxpssdAqs8mxhWlTC8G2GES Lg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2y2p3t2q6h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 Feb 2020 17:41:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01EHbIHs132568;
        Fri, 14 Feb 2020 17:41:02 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 2y4k9mwvdy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 Feb 2020 17:41:02 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01EHews6020773;
        Fri, 14 Feb 2020 17:40:58 GMT
Received: from [10.209.227.41] (/10.209.227.41)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 14 Feb 2020 09:40:58 -0800
Subject: Re: [PATCH resend 0/2] dts: keystone-k2g-evm: Display support
To:     Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org,
        ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com,
        peter.ujfalusi@ti.com, bparrot@ti.com, praneeth@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com
References: <cover.1581671951.git.jsarha@ti.com>
From:   santosh.shilimkar@oracle.com
Organization: Oracle Corporation
Message-ID: <6749076a-cbc1-d8e2-bc35-2e2a9ad80a6d@oracle.com>
Date:   Fri, 14 Feb 2020 09:40:55 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <cover.1581671951.git.jsarha@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9531 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002140133
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9531 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1011
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002140133
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2/14/20 1:22 AM, Jyri Sarha wrote:
> Resend because the earlier recipient list was wrong.
> 
> Now that drm/tidss is queued for mainline, lets add display support for
> k2g-evm. There is no hurry since tidss is out only in v5.7, but it
> should not harm to have the dts changes in place before that.
> 
> Jyri Sarha (2):
>    ARM: dts: keystone-k2g: Add DSS node
>    ARM: dts: keystone-k2g-evm: add HDMI video support
> 
>   arch/arm/boot/dts/keystone-k2g-evm.dts | 101 +++++++++++++++++++++++++
>   arch/arm/boot/dts/keystone-k2g.dtsi    |  22 ++++++
>   2 files changed, 123 insertions(+)
> 
Ok. Will add this to the next queue.

Regards,
Santosh
