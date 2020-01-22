Return-Path: <SRS0=6ipe=3L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27D0C2D0CE
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 02:27:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BF0802465A
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 02:27:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgAVC10 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jan 2020 21:27:26 -0500
Received: from mga05.intel.com ([192.55.52.43]:61969 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726885AbgAVC10 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Jan 2020 21:27:26 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Jan 2020 18:27:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,347,1574150400"; 
   d="scan'208";a="425700388"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga005.fm.intel.com with ESMTP; 21 Jan 2020 18:27:25 -0800
Received: from [10.226.38.27] (unknown [10.226.38.27])
        by linux.intel.com (Postfix) with ESMTP id 050F958033E;
        Tue, 21 Jan 2020 18:27:24 -0800 (PST)
Subject: Re: Fwd: Re: [PATCH v1] dt-bindings: phy: Fix for
 intel,lgm-emmc-phy.yaml build error
To:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <20200121221449.GA25322@bogus>
 <122bf98e-fdf9-0298-9094-066b056c2db6@linux.intel.com>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <8342aa82-9547-8e28-5531-dff455fd4de1@linux.intel.com>
Date:   Wed, 22 Jan 2020 10:27:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <122bf98e-fdf9-0298-9094-066b056c2db6@linux.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,
> On Tue, Jan 14, 2020 at 06:47:10PM +0800, Ramuthevar,Vadivel MuruganX 
> wrote:
>> From: Ramuthevar Vadivel Murugan 
>> <vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> This patch fixes the devicetree binding yaml build errors
>> in linux-next kernel Error: Documentation/devicetree/bindings/
>> phy/intel,lgm-emmc-phy.example.dts:21.19-20
>> syntax error FATAL ERROR: Unable to parse input tree
>>
>> Signed-off-by: Ramuthevar Vadivel Murugan 
>> <vadivel.muruganx.ramuthevar@linux.intel.com>
>> Reported-by: Rob Herring <robh@kernel.org>
>> ---
>> .../devicetree/bindings/phy/intel,lgm-emmc-phy.yaml | 15 ++++++++++-----
>> 1 file changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml 
>> b/Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml
>> index ff7959c21af0..d9bd2e47dfe7 100644
>> --- a/Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml
>> @@ -16,10 +16,7 @@ description: |+
>> The eMMC PHY node should be the child of a syscon node with the
>> required property:
>> - - compatible: Should be one of the following:
>> - "intel,lgm-syscon", "syscon"
>> - - reg:
>> - maxItems: 1
>> + should be compatible strings are - "intel,lgm-syscon", "syscon"
>
> What's this change for?
>
just re-sentenced like the other patches instead of -compatible in the 
description
>> properties:
>> compatible:
>> @@ -34,6 +31,12 @@ properties:
>> clocks:
>> maxItems: 1
>> + "#address-cells":
>> + const: 1
>> +
>> + "#size-cells":
>> + const: 1
>> +
>
> This schema is properties in the emmc-phy node, so these don't belong 
> here. But the example change is correct.
>
noted will fix it.
>> required:
>> - "#phy-cells"
>> - compatible
>> @@ -45,8 +48,10 @@ examples:
>> sysconf: chiptop@e0200000 {
>> compatible = "intel,lgm-syscon", "syscon";
>> reg = <0xe0200000 0x100>;
>> + #address-cells = <1>;
>> + #size-cells = <1>;
>> - emmc-phy: emmc-phy@a8 {
>> + emmc_phy: emmc_phy@a8 {
>
> Don't use '_' in node names. The error was in the label.
>
> emmc_phy: emmc-phy@a8 {
>
Noted ,will fix it.

Thanks a lot!

Regards
Vadivel
>> compatible = "intel,lgm-emmc-phy";
>> reg = <0x00a8 0x10>;
>> clocks = <&emmc>;
>> -- 2.11.0
>>
