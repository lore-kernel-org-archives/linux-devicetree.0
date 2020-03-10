Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E968FC10DCE
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 06:46:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC14324655
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 06:46:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="jHv4G5C9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgCJGqz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 02:46:55 -0400
Received: from mout.gmx.net ([212.227.15.15]:46409 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725919AbgCJGqz (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 10 Mar 2020 02:46:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1583822805;
        bh=jBgFrKOJpoVE20yuxXHNQVFLlQ2yV+hT2lQhU43mPrQ=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=jHv4G5C9ZUiYATOfGJsebLwlYtF2nbfUj32EfbGL0+yQopP7cV07fj1CirV/MCsGP
         a3Ism4J7e26zktnmuGZ1EOfW9TxgMuXZvHw8q7ChqqWjne+lrdWjcua4rM+ZivJ4yN
         Oi2mx9YNUV8AEJ0aYUt51Ygt41h4VdGV2eaEHkeo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.68] ([86.134.17.80]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MgeoI-1jqNab2gnc-00h8bz; Tue, 10
 Mar 2020 07:46:45 +0100
Subject: Re: ARM: bcm2835-rpi-zero-w: Add missing pinctrl name
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Nick Hudson <skrll@netbsd.org>
References: <20200309164842.8184-1-nick.hudson@gmx.co.uk>
 <8609efe72001a183452c4bd4f1f1a827eb789406.camel@suse.de>
 <47bc256f-d8f2-6f42-1421-12e19c09d0ce@gmail.com>
From:   Nick Hudson <nick.hudson@gmx.co.uk>
Message-ID: <b9b15470-deb0-6434-8e42-6482ea4bec9d@gmx.co.uk>
Date:   Tue, 10 Mar 2020 06:46:41 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <47bc256f-d8f2-6f42-1421-12e19c09d0ce@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qOm7olJMt2zokTuR2QN6wmbffUfyi1X1nnMHDMPFf1OXbZo9S4t
 LKiCIYtTmAakTikiFbA2rMRebjcAyhELVcOEzbTQHXJXtphW3PWSUfmoZ8q/03S3KxJeyW8
 5xVOKFpxyX2iEmyvtoDGRy4qTf9SIi9sbEN3Cj5DO64wSQmUGJ4cS6HRKddYYUhjvJ4155l
 /mpgt1ycsEz3z7nX3J2lw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cXcF1Zoqi8A=:ZgZHQmiLdemIUMo9ZguLAn
 QODd4lUR4T1Pmp1Zk7wigZu2zWtuQhqiuOinR09ukdDMEpW9VeqVqmgOm5RassE2ZMUy8daHg
 3sAkybTR2ih+ceZ83n3YFFbhoNwKhh1FwsvQXnizTnOhn0u299+hulBGaaT7QCLnyUSqcJFVM
 B4kWZlxzhIomRokoOivGdTsWqsW91Rzm+RSeDZiGIPJ30qpkzaK1bisrsJANJZNLv84vlhcCq
 rQRbnTDl7nAy7gQ1qaIDpIB0wgLTuuyM56i0hMKAVH06fbNOEdXnqXHnT69uY9PHh4iXMV2g7
 zms3VZXXFb5T+h66eRDm4dJ4Mrw9ozug08ZmmgbmMO5eyooBL/SsT4Kqyn2HnD0BA476s2sMi
 eQvk/A9l0pT/ajqFpraS/PHAMmTb/CsyKnVzjyxbOX2dUcujQRFeav4GUa442oKPHo8+84dQi
 oe1knrSidFqIdlMyKrhShLl4ip/BL5BDXWmS4Tkwya+PqlnpNFJjyM0f76wBt9Hk3Dkjx29qq
 UC3StMK8uHj8j9Wi7uDhUTq0JBmkewgVQm2018raEnwQ1Qv981nG6unYcroo2H9CVlzVolTx9
 gx/VdVfMvOonf4hS9eexBwfObl3SSSdmMvXSte/2UH4R/XX3/i7raQIe997N/XmGsy//o3Nhn
 QGxRi401s7g8y/kbLzxoo3JHKsyA6/pClxgJSw/4WtnJ6lWVrqvDmRDsCwHuD/qx+AFYLWKIt
 l78i+tXg38MLhPWbeMMmKcaoao1oWkJOHx86+FrmuobPSzb/F3SaRnwji/PRh2jnetTFj3NIz
 Ya1PMjk9xG6HLb/EB8xZXtUG6KZ/5bsM6/YQRpf4pEMus6/2jdejOTu7vDxhIbfra3rNU9wKl
 Ee9BVAYyCwrmMl7INSNxNQrPY+sC9a5MyagBnUbCqWpLYV+7FVQy7qS927XSbyM8+fpLKFR4P
 IvC5BgA8y0JglJNjxhvy981r89XTlCqI8ze5aww8Eiqxe+CKYKDaCMK7OlpPpGbitNQnfVjxC
 xqDKP+KbO+rFHc1tu1G4Db29W4pGWr2GTZVsujb7CeE3nH6MT6wkPPtpL1AhVT4kMaYizWdda
 OHeZsqg0DrpWdzK5F1WsiT7kOjSTt+xY/IguXVSeb/+IzLk5X7y0CGPmTGXc33O+9mmOmxIj0
 WFUemcVUz5qy2KuzBOVjN+1u1EzcTCSHCLLyWpdUl0ra34ImUtMesZ07zTw9zHBLwPlJx3dXe
 J2W160c6P1h0q641w
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 09/03/2020 20:51, Florian Fainelli wrote:
> On 3/9/20 1:15 PM, Nicolas Saenz Julienne wrote:
>> Hi Nick,
>>
>> On Mon, 2020-03-09 at 16:48 +0000, nick.hudson@gmx.co.uk wrote:
>>> From: Nick Hudson <nick.hudson@gmx.co.uk>
>>>
>>> Define the sdhci pinctrl state as "default" so it gets applied
>>> correctly and to match all other RPis.
>>>
>>> Signed-off-by: Nick Hudson <skrll@netbsd.org>
>>> ---
>>
>> you should add the [PATCH] prefix in your subject when submitting patch=
es. Also
>> make sure you CC everyone listed by ./sripts/get_maintainer.pl, so they=
 can
>> properly review the patch.
>
> It would also be nice to get a Fixes: tag such that this could be
> backported to stable kernels. Thank you.

If you haven't already guessed... I have no idea what I'm doing here so so=
me
guidance would be nice.

I guess it's been wrong from day one and so I should have something like

Fixes: 2c7c040c73e9 ("ARM: dts: bcm2835: Add Raspberry Pi Zero W")

?

Thanks,
Nick
