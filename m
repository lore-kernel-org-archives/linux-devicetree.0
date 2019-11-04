Return-Path: <SRS0=deyM=Y4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1617BCA9EA0
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 10:39:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D101521D7F
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 10:39:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbfKDKj6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 Nov 2019 05:39:58 -0500
Received: from www381.your-server.de ([78.46.137.84]:46236 "EHLO
        www381.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbfKDKj6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 Nov 2019 05:39:58 -0500
X-Greylist: delayed 913 seconds by postgrey-1.27 at vger.kernel.org; Mon, 04 Nov 2019 05:39:57 EST
Received: from sslproxy01.your-server.de ([88.198.220.130])
        by www381.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89_1)
        (envelope-from <lars@metafoo.de>)
        id 1iRZXK-0008L4-R2; Mon, 04 Nov 2019 11:24:38 +0100
Received: from [93.104.100.36] (helo=[192.168.178.20])
        by sslproxy01.your-server.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89)
        (envelope-from <lars@metafoo.de>)
        id 1iRZXK-00059k-6a; Mon, 04 Nov 2019 11:24:38 +0100
Subject: Re: [alsa-devel] [PATCH] dt-bindings: sound: adau7118: Fix example
 warning
To:     Maxime Ripard <maxime@cerno.tech>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>, broonie@kernel.org,
        lgirdwood@gmail.com
Cc:     devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>
References: <20191031134713.241157-1-maxime@cerno.tech>
From:   Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <14c37030-2da6-5fb1-8eea-02c3bb94257a@metafoo.de>
Date:   Mon, 4 Nov 2019 11:24:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191031134713.241157-1-maxime@cerno.tech>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.101.4/25622/Sun Nov  3 10:13:19 2019)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 10/31/19 2:47 PM, Maxime Ripard wrote:
> The ADAU7118 has an example where the codec has an i2c address of 14, and
> the unit address set to 14 as well>
> However, while the address is expressed in decimal, the unit-address is
> supposed to be in hexadecimal, which ends up with two different addresses
> that trigger a DTC warning. Fix this by setting the unit address to (0x)e.
> 

The mistake is in the I2C address, should be 0x14.

> Cc: Nuno Sá <nuno.sa@analog.com>
> Fixes: 969d49b2cdc8 ("dt-bindings: asoc: Add ADAU7118 documentation")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/sound/adi,adau7118.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/adi,adau7118.yaml b/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
> index c3f10afbdd6f..65f6844a0c6d 100644
> --- a/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
> +++ b/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
> @@ -65,7 +65,7 @@ examples:
>          /* example with i2c support */
>          #address-cells = <1>;
>          #size-cells = <0>;
> -        adau7118_codec: audio-codec@14 {
> +        adau7118_codec: audio-codec@e {
>                  compatible = "adi,adau7118";
>                  reg = <14>;
>                  #sound-dai-cells = <0>;
> 

