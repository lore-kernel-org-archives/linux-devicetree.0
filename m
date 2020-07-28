Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1,WEIRD_QUOTING
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A47C433E3
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 20:46:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4B0F2070B
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 20:46:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728828AbgG1UqE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 16:46:04 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7328 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728788AbgG1UqE (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 28 Jul 2020 16:46:04 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06SKVd3G118082;
        Tue, 28 Jul 2020 16:46:02 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
        by mx0b-001b2d01.pphosted.com with ESMTP id 32jpw3g8gx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 28 Jul 2020 16:46:01 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
        by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06SKYORJ016090;
        Tue, 28 Jul 2020 20:46:00 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
        by ppma04dal.us.ibm.com with ESMTP id 32gcq1bgg7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 28 Jul 2020 20:46:00 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
        by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 06SKjxho50921870
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 28 Jul 2020 20:45:59 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BBD08AE05F;
        Tue, 28 Jul 2020 20:45:59 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4BB47AE05C;
        Tue, 28 Jul 2020 20:45:59 +0000 (GMT)
Received: from [9.211.141.254] (unknown [9.211.141.254])
        by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue, 28 Jul 2020 20:45:59 +0000 (GMT)
Subject: Re: [PATCH 2/2] rainier: Add LEDs that are controlled by ASPEED
To:     Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>, joel@jms.id.au
Cc:     devicetree@vger.kernel.org
References: <1595944783-18172-1-git-send-email-vishwa@linux.vnet.ibm.com>
From:   Eddie James <eajames@linux.ibm.com>
Message-ID: <0a500dd1-2b21-5074-f887-48f2433af860@linux.ibm.com>
Date:   Tue, 28 Jul 2020 15:45:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595944783-18172-1-git-send-email-vishwa@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-28_16:2020-07-28,2020-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007280142
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On 7/28/20 8:59 AM, Vishwanatha Subbanna wrote:
> These are the LEDs that have direct GPIO connection from ASPEED


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
> ---
>   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 24 ++++++++++++++++++++++--
>   1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index ecbce50..dc68c49 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -72,6 +72,26 @@
>   	leds {
>   		compatible = "gpio-leds";
>   
> +		/* BMC Card fault LED at the back */
> +		bmc-ingraham0 {
> +			gpios = <&gpio0 ASPEED_GPIO(H, 1) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		/* Enclosure ID LED at the back */
> +		rear-enc-id0 {
> +			gpios = <&gpio0 ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		/* Enclosure fault LED at the back */
> +		rear-enc-fault0 {
> +			gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		/* PCIE slot power LED */
> +		pcieslot-power {
> +			gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_LOW>;
> +		};
> +
>   		/* System ID LED that is at front on Op Panel */
>   		front-sys-id0 {
>   			retain-state-shutdown;
> @@ -112,7 +132,7 @@
>   	/*E0-E7*/	"","","","","","","","",
>   	/*F0-F7*/	"","","","","","","","",
>   	/*G0-G7*/	"","","","","","","","",
> -	/*H0-H7*/	"","","","","","","","",
> +	/*H0-H7*/	"","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",
>   	/*I0-I7*/	"","","","","","","","",
>   	/*J0-J7*/	"","","","","","","","",
>   	/*K0-K7*/	"","","","","","","","",
> @@ -120,7 +140,7 @@
>   	/*M0-M7*/	"","","","","","","","",
>   	/*N0-N7*/	"","","","","","","","",
>   	/*O0-O7*/	"","","","","","","","",
> -	/*P0-P7*/	"","","","","","","","",
> +	/*P0-P7*/	"","","","","pcieslot-power","","","",
>   	/*Q0-Q7*/	"cfam-reset","","","","","","","",
>   	/*R0-R7*/	"","","","","","","","",
>   	/*S0-S7*/	"presence-ps0","presence-ps1","presence-ps2","presence-ps3",
