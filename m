Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8B5C3A5A0
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 11:16:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA9A320735
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 11:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587381366;
	bh=XdUabA5HFN6z4apcvmfZuctTincVnd0fjuIg+6JFK34=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=p0FFDMuybPo4+aOMsOx8zdCLLBQboRofXAx8/PiMR4jKcoLg85cMK8VuJv2H/HW6D
	 /aHWYDJO7r3Gt5GRCMxJWSXl7q8JoPf0TvdnesBhNwjUz3jcbUn2siKHR1dLQ6/fY0
	 9Xf6fpB0y+FLEyZvedq0GiCUMQqsGb7m2LFoqkAE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgDTLQG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Apr 2020 07:16:06 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:36905 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbgDTLQF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Apr 2020 07:16:05 -0400
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 03KBFo1e004883
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 20:15:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 03KBFo1e004883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587381351;
        bh=N6l3+df54Z7OPs8bFrk6kGISVsr2ALvPYKeiEaN5x4A=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zRewF2Qwx1qSYCq/7weEGGSFxV4KVmU5LmtMeMJghp0P16k3Eg0xPU/wqFFDc1V5t
         tKlk4dtnSYfkS/BrtKYtGtz0U/M/dtrtCHLxVkDJs06inEYHOf1JOSVUUsoe2TL2HT
         ybaZobTWShXpEQ1ISYZXqEuVO1cxKrE5RAqfxrWmvMbYYGaRS9+dxCiN9It7J5/o7o
         nGzJTxzWyIKzp+4ZcHQJ+MF78q+QjjSXofy8yA0tPY5lCopEfsAIlGoWZsjS96YVW0
         /xEI7JSfv42NLaQ9HQSeaUrAsG/5M1ZgzCas+EPiXl+NFEBU8mGF1vG2BTszo+qkkc
         7Gs+0qqsJTOLg==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id r7so5700755vso.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 04:15:50 -0700 (PDT)
X-Gm-Message-State: AGi0PuaODQ3cOCLWlRWFIA+OZ2jdJ19eHqIZac3NtIgYOKNB/fgVhtDq
        bks2VUbbhSJKBC6cJVRIx4V/MdvwNsHUpwg12qI=
X-Google-Smtp-Source: APiQypKwhM2QJcFYRL36WyEAeGCTWkeUMtYH2nxWOLM3hMfSzawHXXii5nhIbdVM7VgOf7AVVjKrSNAWx9Kt0hMDXxI=
X-Received: by 2002:a67:6542:: with SMTP id z63mr11103919vsb.179.1587381349800;
 Mon, 20 Apr 2020 04:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <158737719165.27947.6617937231903079086.stgit@localhost> <20200420190749.b508c7e6d60a8203360178ec@linaro.org>
In-Reply-To: <20200420190749.b508c7e6d60a8203360178ec@linaro.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 20 Apr 2020 20:15:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQtTPLdKN8cz842gvoS36GVQvk2ztahGp8XWoW3C8BzQg@mail.gmail.com>
Message-ID: <CAK7LNAQtTPLdKN8cz842gvoS36GVQvk2ztahGp8XWoW3C8BzQg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: uniphier: Add support for Akebi96
To:     Masami Hiramatsu <masami.hiramatsu@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Apr 20, 2020 at 7:08 PM Masami Hiramatsu
<masami.hiramatsu@linaro.org> wrote:
>
> Add the device tree for Akebi96. Akebi96 is a 96boards certified
> development board based on UniPhir LD20.
> ( https://www.96boards.org/product/akebi96/ )
>
> This board has;
> - MAX3421 USB-SPI chip on SPI port3 (for USB gadget port)
> - Simple frame buffer with 1080p fixed resolution.
> - I2S port which is connected to aout1b instead of aout1.
> - 3 serial ports, only serial3 has CTS/RTS.
> - No NAND, only eMMC on the board.
> - OP-TEE support.


I did not know "OP-TEE support" was board spec.

Anyway, I decided to not worry about that.


You are adding lots of redundant code.

Delete as follows.


diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts
b/arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts
index 84ff98d96751..aaf86162da84 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts
@@ -113,7 +113,6 @@ &serial2 {
 &serial3 {
        /* LS connector UART0 */
        status = "okay";
-       pinctrl-0 = <&pinctrl_uart3_ctsrts>;
 };

 &spdif_hiecout1 {
@@ -155,11 +154,6 @@ &i2c1 {
        status = "okay";
 };

-&audio {
-       pinctrl-0 = <&pinctrl_aout1b>,
-                   <&pinctrl_aoutiec1>;
-};
-
 &spi3 {
        status = "okay";
        #address-cells = <1>;
@@ -187,14 +181,10 @@ xirq10 {
        };
 };

-&pinctrl {
-       pinctrl_aout1b: aout1b {
-               groups = "aout1", "aout1b";
-               function = "aout1";
-       };
+&pinctrl_aout1 {
+       groups = "aout1", "aout1b";
+};

-       pinctrl_uart3_ctsrts: uart3-ctsrts {
-               groups = "uart3", "uart3_ctsrts";
-               function = "uart3";
-       };
+&pinctrl_uart3 {
+       groups = "uart3", "uart3_ctsrts";
 };
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index f93519793bfb..afa90b762ea9 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -337,7 +337,7 @@ gpio: gpio@55000000 {
                                                     <21 217 3>;
                };

-               audio: audio@56000000 {
+               audio@56000000 {
                        compatible = "socionext,uniphier-ld20-aio";
                        reg = <0x56000000 0x80000>;
                        interrupts = <0 144 4>;





Lastly, is the pin-setting "aout1", "aout1b" correct ?



-- 
Best Regards
Masahiro Yamada
