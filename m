Return-Path: <SRS0=tkJE=4P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B479C11D3D
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 17:53:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D3F52469F
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 17:53:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729695AbgB0Rxr convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Feb 2020 12:53:47 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:33917 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729624AbgB0Rxq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Feb 2020 12:53:46 -0500
Received: from [192.168.1.183] ([37.4.249.142]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MWixU-1is6cT1CHo-00X7o3; Thu, 27 Feb 2020 18:53:37 +0100
Subject: Re: [PATCH] define rpi0w sdhci pinctrl state
To:     Nick Hudson <nick.hudson@gmx.co.uk>,
        linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <c34db439-3539-88c0-99f1-308d75afd1aa@gmx.co.uk>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
From:   Stefan Wahren <stefan.wahren@i2se.com>
Openpgp: preference=signencrypt
Autocrypt: addr=stefan.wahren@i2se.com; keydata=
 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 AQ==
Message-ID: <23a936db-fc89-6259-3991-5791fa88beb7@i2se.com>
Date:   Thu, 27 Feb 2020 18:53:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c34db439-3539-88c0-99f1-308d75afd1aa@gmx.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-Provags-ID: V03:K1:7MaWU7lT5SHZv4XZBw8n5tGB108d1GP9s0OlAIgCwdQNVlWUqpp
 4HYyrH9YguLmeXFnd5J6crv3bFOSdMbzEXw3r4DZrNoUOo8R4JlQ/xyHisC9XGpl2hQH+Oq
 gYfv+30qfC9bXf7Gfv4ArmoWa6nqO0QseaX0qtBHTGTNQn2x7uk6ZfUNTcD9NWUvHEA3hNw
 iaW2EUyfov5EipQUVYhog==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0hQ3T2OXq4c=:0GXybENl8hp/z+5jwQRXoG
 S9nmJEIST9VBPeUZqsEUYZkh26bHmUjuQDrLWDWURMFn7HZ9QeAy9sxtB//oSD3BH/Zo/OSQ8
 YwMLQOXTmeHqD1bYymZ1Ww0T2/N703nX0aUuMaK66hNNv4M085gF5cqk7EQWL4B6k63Ic+j+e
 1GBEhIoyGIG0kuyinVp0oqnNclH0q94zldgH8sRvUrlptfjpuIEnLenUUdqsLC51kZgN0ut4r
 +NP04LE8EiXJHdsyzJO3qsBMha0ysJB3FOi1Dtig4HnlbgRGvIfQpOhxM+NRowvqnhPJGw6uJ
 1OGsRB5mbEEugnZBWC5J0SLwdrPS56JRodt8Qx1Sjb1RPNF0JbcEnVerJn4IbkfWjpzhMVX4p
 9wj8728aFrjVvzMyyYL0G+woxRMFy2cwhpQ5QVcnONoFe9Mx+ddY+shU4jUqgci8tVOGj9C//
 ZI9Mfo86stssYpR5Alvb4lLP9mBcf2Arld5XEKG+OVaFJgo1z6dlR1sPF7XsKBAWK+QHEVNpq
 UmC7I9Umqu7CQdlPV0aJxy/Cwx3kRKWKoPXPnbq8YmRbU1f1g7gVtRLaU09RW/bDe+LePYs1a
 P+gmgbc9u7k4L7NnmzM7EXeTaVVcK/30+2DekzPstW4pGIzBY6u7130XeY6I/zJNsnQ1iU2P1
 9QskGcxzWywrRjO5n6Qc4lfi4Cm/ZjRlvUgYyW8SDUNWpPBmQyNB8G9cAOv1TldoMl48pj0q1
 56o84ecQbYIGW5DdEwcT+z37q6fzINQgFK0plb+2buZ2db/wftqSk8TwzwWcmXVc8OfVgRouV
 TOT058k2LUmqe1kLESjbD6lRJS39J+PEDAgE7TEu5XR8svmikPo9p+pWAO/4mk/ErSIxodc
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Nick,

Am 27.02.20 um 00:33 schrieb Nick Hudson:
> I'm still not sure where I should be sending this, but here goes.

the addresses are right. Please rebase your change against recent Linux
git tree and generate a git patch, otherwise we cannot apply your it.

I suggest the following subject:

ARM: bcm2835-rpi-zero-w: Add missing pinctrl name

Thanks
Stefan

>
> Define thesdhci pinctrl state as "default" so it gets applied correctly
> and to match all other RPis
>
> Signed-off-by: Nick Hudson <skrll@netbsd.org>
> ---
> Index: bcm2835-rpi-zero-w.dts
> ===================================================================
> RCS file:
> /cvsroot/src/sys/external/gpl2/dts/dist/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts,v
>
> retrieving revision 1.1.1.4
> diff -u -p -r1.1.1.4 bcm2835-rpi-zero-w.dts
> --- bcm2835-rpi-zero-w.dts    3 Jan 2020 14:33:09 -0000    1.1.1.4
> +++ bcm2835-rpi-zero-w.dts    19 Feb 2020 07:53:54 -0000
> @@ -112,6 +112,7 @@
>  &sdhci {
>      #address-cells = <1>;
>      #size-cells = <0>;
> +    pinctrl-names = "default";
>      pinctrl-0 = <&emmc_gpio34 &gpclk2_gpio43>;
>      bus-width = <4>;
>      mmc-pwrseq = <&wifi_pwrseq>;
>
> _______________________________________________
> linux-rpi-kernel mailing list
> linux-rpi-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel

