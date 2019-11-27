Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD41C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 01:27:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5961120722
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 01:27:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbfK0B15 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 Nov 2019 20:27:57 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3890 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727193AbfK0B15 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Nov 2019 20:27:57 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xAR1RMdR142693
        for <devicetree@vger.kernel.org>; Tue, 26 Nov 2019 20:27:56 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2whcy73yrx-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <devicetree@vger.kernel.org>; Tue, 26 Nov 2019 20:27:56 -0500
Received: from localhost
        by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <devicetree@vger.kernel.org> from <ajd@linux.ibm.com>;
        Wed, 27 Nov 2019 01:27:54 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 27 Nov 2019 01:27:51 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id xAR1Rppd51118268
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 27 Nov 2019 01:27:51 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id F28F1A405F;
        Wed, 27 Nov 2019 01:27:50 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A0642A4054;
        Wed, 27 Nov 2019 01:27:50 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed, 27 Nov 2019 01:27:50 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E8C89A019A;
        Wed, 27 Nov 2019 12:27:47 +1100 (AEDT)
Subject: Re: [PATCH 00/14] powerpc/vas: Page fault handling for user space NX
 requests
To:     Haren Myneni <haren@linux.vnet.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        mpe@ellerman.id.au, npiggin@gmail.com, mikey@neuling.org,
        herbert@gondor.apana.org.au
Cc:     sukadev@linux.vnet.ibm.com
References: <1574816450.13250.2.camel@hbabu-laptop>
From:   Andrew Donnellan <ajd@linux.ibm.com>
Date:   Wed, 27 Nov 2019 12:27:48 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1574816450.13250.2.camel@hbabu-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19112701-0012-0000-0000-0000036CB875
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112701-0013-0000-0000-000021A85F8C
Message-Id: <9bcb59f3-17cf-1726-4e6c-3cabd6e4af4d@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_08:2019-11-26,2019-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 spamscore=0 mlxlogscore=776 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=2 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911270010
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Haren,

On 27/11/19 12:00 pm, Haren Myneni wrote:
> Haren Myneni (14):
>    powerpc/vas: Describe vas-port and interrupts properties
>    Revert "powerpc/powernv: remove the unused vas_win_paste_addr and
>      vas_win_id functions"
>    powerpc/vas: Define nx_fault_stamp in coprocessor_request_block
>    powerpc/vas: Setup IRQ mapping and register port for each window
>    powerpc/vas: Setup fault window per VAS instance
>    powerpc/VAS: Setup fault handler per VAS instance
>    powerpc/vas: Read and process fault CRBs
>    powerpc/vas: Take reference to PID and mm for user space windows
>    powerpc/vas: Update CSB and notify process for fault CRBs
>    powerpc/vas: Print CRB and FIFO values
>    powerpc/vas: Do not use default credits for receive window
>    powerpc/VAS: Return credits after handling fault
>    powerpc/vas: Display process stuck message
>    powerpc/vas: Free send window in VAS instance after credits returned

In future, please send the patches in reply to the cover letter (and for 
series that don't have a cover letter, send patch 2 onwards as a reply 
to patch 1).

You may want to consider using git send-email which automates all this 
for you.

Thanks,
-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

