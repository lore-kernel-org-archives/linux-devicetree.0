Return-Path: <SRS0=mzwU=6O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E90EC8300A
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 11:13:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73B8A20757
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 11:13:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="a2jaUUuL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725280AbgD3LNs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Apr 2020 07:13:48 -0400
Received: from mail-eopbgr770047.outbound.protection.outlook.com ([40.107.77.47]:19474
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726859AbgD3LNq (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Apr 2020 07:13:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5TcMjEIlZRSZo+M++eF9dcFVbBKhNvAGy1FCxSLgdf0fcTsv7wRTgfNGffKpCVDTqzWrXxlNT/IjX32NNF8Tebg3h0fO6Fvo9bQs+FmPeTdb68HTLj0TVqKvV3lb/ZOUAw6ar6saptTcvsDTM3Hnv8Dde6+oazcs38ltyG9t7/ixX2XedIM6/WpbOwZG5CFi7BM62yC8ETCxkHeOACY+Tl7z6hbhGUGFS8q+3Ir1o9mq2C6zhk6SuC1uZ21LveTs0ed+FFAMA6dh7AiZhzu/cZaOAGjcoWkCZhwr+lTO2gatu2ouIgYb0Pj4tEgIfTNzjf2JNYCCIt8CqpQ87IyFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3lThHtKEgSUjpN4gHcWXkg7bteGQB8rshKGKSrUJiI=;
 b=DZrK3iZJRdO+czNxSO/K7A3lrM7uA6mRELUzkqQwGhVUy+TK8n4clWtlxIVVYzX/p2h+NK8QjIuWHh/Hj7TfP2EjYAsnx7+HB+FsWVRBXX5En/5k5MzmqWCCgpOvFO5j9aLitBXGFpz7QDTQskBv8ttu4r9bgZFDL8rluciXDq4X6ojA35qT4OBJFJzvi5eIxYS+ES7UQ14Pyuc24NVvwDmQ/G2uVz8cXK951CD/gLPfictWhE16vnnKL5GF0Qv7+ud8WaPcLkL978VwfmNLermxg84AxtsK4nohYKK9ZMu87fE4PNvigmnFIk14wfm9j3d39+CBmVFwH3zJwpHJ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3lThHtKEgSUjpN4gHcWXkg7bteGQB8rshKGKSrUJiI=;
 b=a2jaUUuLXlUtECKEbLq7wpqjBwYjIQeuYhRJFg/PXsAsSW2QdkHKT1QBxEOV/tGz21VNO11x5hfdBSxLlanj1/K4zsB3Tu1MDUsKX9hNOSh+V5xCckl5Mljcs5qRy0T0AlGu3LIVHy2v43NaD7eJLlKLLOzPIgZDSwhE4Zqzdt0=
Received: from SN4PR0501CA0045.namprd05.prod.outlook.com
 (2603:10b6:803:41::22) by BN7PR02MB4210.namprd02.prod.outlook.com
 (2603:10b6:406:fe::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 11:13:43 +0000
Received: from SN1NAM02FT036.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:41:cafe::8b) by SN4PR0501CA0045.outlook.office365.com
 (2603:10b6:803:41::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.14 via Frontend
 Transport; Thu, 30 Apr 2020 11:13:43 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT036.mail.protection.outlook.com (10.152.72.149) with Microsoft SMTP
 Server id 15.20.2937.19 via Frontend Transport; Thu, 30 Apr 2020 11:13:43
 +0000
Received: from [149.199.38.66] (port=48052 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jU78K-0002gF-RR; Thu, 30 Apr 2020 04:13:36 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jU78R-0004pu-1f; Thu, 30 Apr 2020 04:13:43 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 03UBDfIh019699;
        Thu, 30 Apr 2020 04:13:41 -0700
Received: from [172.30.17.109]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1jU78P-0004pE-08; Thu, 30 Apr 2020 04:13:41 -0700
Subject: Re: u-boot DT configuration node
To:     Rob Herring <robh@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
        Tom Rini <trini@konsulko.com>,
        Loic Poulain <loic.poulain@linaro.org>
References: <6cdf20c3-7b74-679c-0e6f-4d385d12f9fe@xilinx.com>
 <CAL_Jsq+ehJSK7sjqmKtWOVjr-QZ3LDB+ywCO85uF8WJ+cB=AAw@mail.gmail.com>
 <845e6a12-ca33-957f-debb-4a1fcec70742@xilinx.com>
 <CAL_JsqLMDqpkyg-Q7mUfw-XH67-v068Q6e9wTq2UOoN=0-_coQ@mail.gmail.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <fefb0e66-b82e-23ec-1e81-471d590df032@xilinx.com>
Date:   Thu, 30 Apr 2020 13:13:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLMDqpkyg-Q7mUfw-XH67-v068Q6e9wTq2UOoN=0-_coQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(46966005)(70586007)(70206006)(53546011)(54906003)(186003)(26005)(316002)(110136005)(44832011)(4326008)(31696002)(9786002)(36756003)(31686004)(2616005)(336012)(82310400002)(8676002)(966005)(8936002)(47076004)(426003)(82740400003)(6666004)(356005)(478600001)(81166007)(83080400001)(2906002)(3480700007)(5660300002);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5196be0-bead-41ea-8add-08d7ecf78b42
X-MS-TrafficTypeDiagnostic: BN7PR02MB4210:
X-Microsoft-Antispam-PRVS: <BN7PR02MB4210022DBC80BB65E7B40A48C6AA0@BN7PR02MB4210.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0389EDA07F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4nsS4muJMzzeRc9pzA13sWFuj2OVpFapkLkBaMjt9WGWViMVCQKxwP3Fb9dI27+8GSlxjVL+tFx3FrsSGI5nlUA36dOfEBeCK9KpqnzfaaC7dorC82RVOTaEdF/HwtjSlecumJRb6bsS35XvFEMF5S/HGS47oB+GhTDzt7fGdjBjDpx0oP+HuBL09XRtXE25IpZAO9fumtQ5DwvqbT7jLkyuOweQNjeOGzAoQy0GJLw6JW4P5RF+CvMonppdTWN+numed6YQUoOPngyMZEnYqxbtz3aGhkdJ8mHTvjo+8uXrJH9bBz4qd29gTZyku6hj1B4dv8Ne6xzX/xs5jSiHLz8MyYZTH6jFHR3WJ4hYKNg394+OsnL9Jg6/VUKmdknTO+TrWP0A81uEGHEHnVlYC3TfPBGXESGeETBRTXGBQ/ruhS+oHJErwBZrfmJgKioPcLoLsFcpLV3cUA0bJfnfLzswSkJw+FO0g84em3XYW4umkKNpd6SlAchRTmuN60ZD78EEkYFJE/1ysnmMj0kJWH+dxXFaU32VOkBocRdd8PC/l6k8coa1R764TOjZGuMwaAi1XONCOuLyTA7HxtniDA==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 11:13:43.3605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5196be0-bead-41ea-8add-08d7ecf78b42
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB4210
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 29. 04. 20 16:55, Rob Herring wrote:
> On Tue, Apr 28, 2020 at 8:51 AM Michal Simek <michal.simek@xilinx.com> wrote:
>>
>> On 28. 04. 20 15:23, Rob Herring wrote:
>>> On Wed, Apr 1, 2020 at 4:23 AM Michal Simek <michal.simek@xilinx.com> wrote:
>>>>
>>>> Hi Rob and others,
>>>>
>>>> for couple of years already u-boot is using config node in root DT for
>>>> u-boot configuration.
>>>>
>>>> Here is one example in u-boot source code.
>>>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/exynos5250-spring.dts#L47
>>>>
>>>> And here is dt binding description
>>>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/doc/device-tree-bindings/config.txt
>>>>
>>>> I was checking dt binding specification and there no such a thing
>>>> described there. It means I expect this is more adhoc u-boot solution.
>>>> We have reached the point where could be beneficial to put some u-boot
>>>> specific configurations to DT.
>>>>
>>>> Actually I have done similar thing some time ago too by using chosen
>>>> node and add xilinx specific property there to point to eeprom.
>>>> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/arch/arm/dts/zynqmp-zcu102-revA.dts#L39
>>>
>>> In this case, I think an alias should be used as it's more of just a
>>> shortcut to finding a specific node.
>>
>> What alias name do you suggest to use?
>> We have systems where one i2c eeprom described based board and another
>> i2c eeprom describe bootable module. And I need to have shotcuts to both
>> of them.
>>
>> dt specification doesn't list any keywords for aliases but there is
>> generic name recommendation.
> 
> I do want make aliases a registered list of names.
> 
>> Based on keywords it should look like this.
>> eeprom0 = ...;
>> eeprom1 = ...;
> 
> That was my initial thought, but maybe "nvmemX" to be a bit more generic.

I am fine with that. It means that multiple eeproms and order will be
direct by alias number.
In past I wanted to use list but aliases number is also fine.

> 
> 
>>>> I think it is a time to discuss it and do it properly.
>>>>
>>>> First of all my question is where we could list SW prefixes to make sure
>>>> that they are listed and everybody is aware about it. We have
>>>> vendor-prefixes and we should have a way to record also prefixes for sw
>>>> projects. U-Boot is using u-boot. Xen has file in the kernel with using
>>>> xen prefix. At least these two should be listed.
>>>
>>> Documentation/devicetree/bindings/vendor-prefixes.yaml.
>>
>> thx

Sent a patch for it. Please review.
https://lore.kernel.org/linux-devicetree/85b8dc9e6288270bbfdf55f1c156dba160293f01.1588239081.git.michal.simek@xilinx.com/


>>>> Next my question is what is the recommended way to pass sw specific
>>>> parameters via DT? I think using chosen node is more appropriate then
>>>> adhoc config node. Or is there a better way how this should be done?
>>>
>>> /chosen
>>>
>>> For vendor specific things though I would be cautious. If they are
>>> settings for a specific device, then they probably belong in the
>>> device's node. Second, are they really vendor specific? What we don't
>>> want is each vendor doing the same thing in slightly different ways.
>>
>> For u-boot specific setting like - offsets it should be generic for
>> everybody. I was already talking to Loic that for saving u-boot
>> variables to QSPI we should be using MTD partition map and put there
>> maybe a flag to say that this is the location for storing them.
> 
> I'd standardize on the partition name.

ok. Documentation/devicetree/bindings/mtd/partition.txt?

I have grep u-boot repo and I see these label names

"NAND.u-boot";
"NAND.u-boot-env";
"NAND.u-boot-env.backup1";
"NAND.u-boot-spl-os";
"QSPI.u-boot";
"QSPI.u-boot-env";
"QSPI.u-boot-env.backup1";
"qspi-u-boot-img";
"qspi-u-boot-spl";
"QSPI.u-boot-spl-os";
"u-boot
"u-boot";
"u-boot-2";
"u-boot-2.backup1";
"u-boot.backup1";
"u-boot-env";
"u-boot-env.backup1";
"u-boot-spl";

kernel is kind of similar
"alt-u-boot";
"alt-u-boot-env";
"NAND.u-boot";
"NAND.u-boot-env";
"NAND.u-boot-env.backup1";
"NAND.u-boot-spl-os";
"QSPI.u-boot";
"QSPI.u-boot-env";
"QSPI.u-boot-env.backup1";
"QSPI.u-boot-spl-os";
"u-boot
"u-boot";
"u-boot.backup1";
"u-boot-env";
"u-boot-env2";
"u-boot-env.backup1";
"u-boot-environment";
"u-boot-factory";
"u-boot-nand";
"u-boot-nor";
"u-boot-spi";
"u-boot-spl";

It means it is mix of names. I think SPI cases are the most complicated
one because you can have multiple spi devices in the system and you
can't use the same name for registration.

That's why I think that make sense to use an optional prefix as people
are using QSPI/NAND already. But not quite sure that using QSPI is
generic enough because you can have multiple QSPIs. Using alias name is
also not ideal because one simple change in aliases would require
changes in partition name/label.
Any better suggestion?

Next thing is that <memory_type><dot>u-boot.
Label or if missing node name doesn't list dot a valid character for
node name based on device-tree spec. It means I would consider using dot
here as invalid.
Some platforms are using dash instead which should be better.


It means something like this:

<identification>-u-boot : For storing U-Boot bootloader binary
<identification>-u-boot-X : For storing X copy of U-Boot bootloader binary
<identification>-u-boot-spl-os : For storing U-Boot SPL bootloader binary
<identification>-u-boot-spl-os-X : For storing X copy U-Boot SPL
bootloader binary

<identification>-u-boot-env : For storing U-Boot variables
<identification>-u-boot-env-X : For storing X copy U-Boot redundant
varaibles

<identification>- : is optional and should reflect (TODO - fill when
above discussed).

Thanks,
Michal
