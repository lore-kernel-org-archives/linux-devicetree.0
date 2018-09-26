Return-Path: <SRS0=4Bew=MI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mx01.hxt-semitech.com ([223.203.96.7]:55778 "EHLO
        barracuda.hxt-semitech.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726321AbeIZIL7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 26 Sep 2018 04:11:59 -0400
From: "Wang, Dongsheng" <dongsheng.wang@hxt-semitech.com>
Subject: Re: [PATCH] dt-bindings: net/ibm: fix spelling issue
Date: Wed, 26 Sep 2018 02:01:13 +0000
Message-ID: <94f258b7fe784c1f972bd0defbd8fd8a@HXTBJIDCEMVIW02.hxtcorp.net>
References: <1536557703-19637-1-git-send-email-dongsheng.wang@hxt-semitech.com>
 <5baa1ae7.1c69fb81.5f2da.32e4@mx.google.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 2018/9/25 19:24, Rob Herring wrote:
> On Mon, Sep 10, 2018 at 01:35:03PM +0800, Wang Dongsheng wrote:
>> Fix a word spelling issue.
>>
>> Signed-off-by: Wang Dongsheng <dongsheng.wang@hxt-semitech.com>
>> ---
>>  Documentation/devicetree/bindings/net/ibm,emac.txt | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/ibm,emac.txt b/Documentation/devicetree/bindings/net/ibm,emac.txt
>> index c0c14aa3f97c..fd76d9bf4a3a 100644
>> --- a/Documentation/devicetree/bindings/net/ibm,emac.txt
>> +++ b/Documentation/devicetree/bindings/net/ibm,emac.txt
>> @@ -45,7 +45,7 @@
>>  			  Supported values are: "mii", "rmii", "smii", "rgmii",
>>  			  "tbi", "gmii", rtbi", "sgmii".
>>  			  For Axon on CAB, it is "rgmii"
>> -    - mdio-device       : 1 cell, required iff using shared MDIO registers
>> +    - mdio-device       : 1 cell, required if using shared MDIO registers
> I think 'iff' is short for 'if and only if'

Thanks! :-)

Cheers,
Dongsheng

>>  			  (440EP).  phandle of the EMAC to use to drive the
>>  			  MDIO lines for the PHY used by this EMAC.
>>      - zmii-device       : 1 cell, required iff connected to a ZMII.  phandle of
> But if not, there's one here too.
>
>
