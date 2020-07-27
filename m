Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2FAEC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 21:19:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9383D20786
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 21:19:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbgG0VTc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 17:19:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34414 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726110AbgG0VTb (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 27 Jul 2020 17:19:31 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06RL3Sbr124277;
        Mon, 27 Jul 2020 17:19:25 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
        by mx0a-001b2d01.pphosted.com with ESMTP id 32j0a1v66r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jul 2020 17:19:25 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
        by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06RL9g7U000564;
        Mon, 27 Jul 2020 21:19:24 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
        by ppma04wdc.us.ibm.com with ESMTP id 32gcpr4bs1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jul 2020 21:19:24 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
        by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 06RLJNQ454460856
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Jul 2020 21:19:23 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 59E48BE04F;
        Mon, 27 Jul 2020 21:19:23 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 23207BE051;
        Mon, 27 Jul 2020 21:19:23 +0000 (GMT)
Received: from [9.163.49.148] (unknown [9.163.49.148])
        by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
        Mon, 27 Jul 2020 21:19:22 +0000 (GMT)
Subject: Re: [PATCH 1/2] rainier: Add leds that are off 9551 on Operator Panel
To:     vishwanatha subbanna <vishwa@linux.vnet.ibm.com>,
        openbmc@lists.ozlabs.org, joel@jms.id.au,
        devicetree@vger.kernel.org
References: <125895BF-8477-4107-9A80-47A5128D296C@linux.vnet.ibm.com>
From:   Eddie James <eajames@linux.ibm.com>
Message-ID: <5e1835d3-816d-6e00-585f-0c5aec53b913@linux.ibm.com>
Date:   Mon, 27 Jul 2020 16:19:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <125895BF-8477-4107-9A80-47A5128D296C@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-27_15:2020-07-27,2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270142
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On 7/27/20 7:40 AM, vishwanatha subbanna wrote:
> These are LEDs that are controlled by 9551


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
> ---
> arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 82 ++++++++++++++++++++++++++++
> 1 file changed, 82 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 0b5c6cc..ecbce50 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -69,6 +69,38 @@
> 		};
> 	};
>
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		/* System ID LED that is at front on Op Panel */
> +		front-sys-id0 {
> +			retain-state-shutdown;
> +			default-state = "keep";
> +			gpios = <&pca1 0 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		/* System Attention Indicator ID LED that is at front on Op Panel */
> +		front-check-log0 {
> +			retain-state-shutdown;
> +			default-state = "keep";
> +			gpios = <&pca1 1 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		/* Enclosure Fault LED that is at front on Op Panel */
> +		front-enc-fault1 {
> +			retain-state-shutdown;
> +			default-state = "keep";
> +			gpios = <&pca1 2 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		/* System PowerOn LED that is at front on Op Panel */
> +		front-sys-pwron0 {
> +			retain-state-shutdown;
> +			default-state = "keep";
> +			gpios = <&pca1 3 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> };
>
> &gpio0 {
> @@ -514,6 +546,56 @@
> 		};
> 	};
>
> +	pca1: pca9551@60 {
> +		compatible = "nxp,pca9551";
> +		reg = <0x60>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		gpio@0 {
> +			reg = <0>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@1 {
> +			reg = <1>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@2 {
> +			reg = <2>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@3 {
> +			reg = <3>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@4 {
> +			reg = <4>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@5 {
> +			reg = <5>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@6 {
> +			reg = <6>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@7 {
> +			reg = <7>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +	};
> +
> 	dps: dps310@76 {
> 		compatible = "infineon,dps310";
> 		reg = <0x76>;
