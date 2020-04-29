Return-Path: <SRS0=VloT=6N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E1AC83003
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 09:28:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EFCF20661
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 09:28:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejwhGHj3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgD2J2b (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Apr 2020 05:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726423AbgD2J2b (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 29 Apr 2020 05:28:31 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B353C03C1AD
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2020 02:28:31 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id g12so1231440wmh.3
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2020 02:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UeUVwObSkM6EFVAzScmIyMGT/gPf7YTekn6m0H+ie8w=;
        b=ejwhGHj3Y5NZCDzmcm3w8UM0m5vKpiydbk8ev228iv3dQxNch/UX6yK/Faq6WKXXhE
         ZfDqOa2pLA+KioOpoYsQh3NtsKUsYkMnsqN4phoKcrQabCC0GNAQJdq1s5UvDxcFjEKm
         Bvjqf03wydSLN21yQE9QQDBGgfug50XFzNgN6SVa5uqG5KS6Zi01nfXht1Xahj7hthIQ
         hp9F1qnFFQj4ixE7MoA/pNVnQJiez9l6ISoE8FXbzPDioNIJLn/R/Hsutn15pWbRw3Zs
         JDr2I9casLccS7vLFpshf+um/Dd1UEGO9tFXZQOkbhPEThexvbNmnTcZAptURxMPhSku
         ZeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UeUVwObSkM6EFVAzScmIyMGT/gPf7YTekn6m0H+ie8w=;
        b=mUv9ud4QLHGid8dUJlYKYCrJlXKwXAlUTEP6xBL/tzyZzuMYoD+u2500W1AVtdUf23
         FL1GNdYP7dpC0Xw3oBGGn22NTQ3Tf5TwbyiPEyOS8LiV1NZ9cVVtPCW3Bsh4SyZukVVd
         YQfAfZIcVfTutI1POcGstInocHwt16KHcqRjWFZ6J1LSEB48yxkZz7n1jEUBFUfokh3g
         qABvEg4XZ4OLLefzpw7Mh6/6bGmOSK3u6k4lLaJxTYlr40g3eKd3VIwqrmor1JWLPKgv
         M2M321E5csQsNiP2ahK7CJOSUv+yAVGzbA/CMm8ugtVWEUxoqT7aXETuZDCKXY81RAJu
         k78w==
X-Gm-Message-State: AGi0PubOFw+XaSWkR03kIPHnUQuZA2SOsM4MqZtPQJTWkTKef4s0aaiR
        c2PCJSbOEveMLKpmXVfyq38=
X-Google-Smtp-Source: APiQypKUQaJgSoMixHmfMayvIF7NPOrs0jASPDWStT/ot5oGircRfIYNDPagR39Q27smhLgHapbrAw==
X-Received: by 2002:a05:600c:2214:: with SMTP id z20mr2363156wml.189.1588152510143;
        Wed, 29 Apr 2020 02:28:30 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id g74sm7058726wme.44.2020.04.29.02.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 02:28:29 -0700 (PDT)
Subject: Re: [PATCH v5 1/7] dt-bindings: mtd: Describe Rockchip RK3xxx NAND
 flash controller
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Yifeng Zhao <yifeng.zhao@rock-chips.com>, richard@nod.at,
        vigneshr@ti.com, robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, heiko@sntech.de,
        linux-rockchip@lists.infradead.org
References: <20200426100250.14678-1-yifeng.zhao@rock-chips.com>
 <20200426100250.14678-2-yifeng.zhao@rock-chips.com>
 <4a83e5d2-90cc-1db7-cdfd-47b7ceb4fcef@gmail.com>
 <20200429111314.5f15d72b@xps13>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <21ecb12e-43d9-581a-7d85-79b62be358e8@gmail.com>
Date:   Wed, 29 Apr 2020 11:28:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429111314.5f15d72b@xps13>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Miquel,

On 4/29/20 11:13 AM, Miquel Raynal wrote:
> Hi Johan,
> 
> Johan Jonker <jbx6244@gmail.com> wrote on Wed, 29 Apr 2020 10:53:30
> +0200:
> 
>> Hi Yifeng,
>>
>>> On Sun, Apr 26, 2020 at 06:02:44PM +0800, Yifeng Zhao wrote:  
>>>> Documentation support for Rockchip RK3xxx NAND flash controllers
>>>>
>>>> Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
>>>> ---
>>>>
>>>> Changes in v5:
>>>> - Fix some wrong define
>>>> - Add boot-medium define
>>>> - Remove some compatible define
>>>>
>>>> Changes in v4:
>>>> - The compatible define with rkxx_nfc
>>>> - Add assigned-clocks
>>>> - Fix some wrong define
>>>>
>>>> Changes in v3:
>>>> - Change the title for the dt-bindings
>>>>
>>>> Changes in v2: None
>>>>
>>>>  .../mtd/rockchip,nand-controller.yaml         | 124 ++++++++++++++++++
>>>>  1 file changed, 124 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml  
>>
>> The name of this file is based on Miquel's opinion, but the
>> compatibility strings, (for which robh has given a 'reviewed by' tag) in
>> version 4 don't fit with this format.
> 
> What do you mean? Is the file name restricted somehow? I just don't
> want a compatible with just "nand" in it because this word is too vague
> as it defines: a bus, a spec, a chip, people are also confusing it with
> the controller and sometimes with the ECC engine too. "nfc" is okay
> though.
> 
> Thanks,
> Miquèl
> 

With the review of my binding string rockchip,rk3066-hdmi robh advised
to use the binding compatible string and add '.txt' to it for the file name.

Is it OK for you to have a file name:
  rockchip,nand-controller.yaml

and a little bit different compatibility string:
  rockchip,rk3066-nfc

Kind regards,

Johan
