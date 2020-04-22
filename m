Return-Path: <SRS0=0pfk=6G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E200EC54FCB
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 15:10:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACAD820738
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 15:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587568218;
	bh=QKcSB5LvC4tUOqXN/QdvmSQqdPWnhe8+w87tDDLSGis=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=Fe5YHzzllbs31Mw01I3xTbVQGzDaX70u82kVECjAyRESTsdp6KyJ9+8HTOabNpk2E
	 tfGZNZVXNe8BbRqFl4fBhAnQKf3+CN4JgHV0ALvhRVWy+BawmQHQ+V4P+aoj26S0Jc
	 uOmEBseeVnLg9XJigqq8m9cw9a68lCgehWV2gEa0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgDVPKS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Apr 2020 11:10:18 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:63233 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbgDVPKR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Apr 2020 11:10:17 -0400
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 03MF9ZiB011838
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2020 00:09:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 03MF9ZiB011838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587568176;
        bh=RCn7w3WgC5BMCa/+cr1sEac2jwfwrjh2RW9Mm+Q693Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mA6fXO78ilSmK97Vz+SxBCz+LlTi7qyS0iGBittuHhqnZYylhNKhbA5EqUsxs/UJT
         Vj3nZVX7n+wUT6gwK7NAJjEx0ynYp/aFtWNNF4qqx9CkXatjM/ldzVYVYIGmj72e3v
         XwvQcFZB7yFZg3WEPOkVesDAS4P4MepzJ13GQbYtjVxeJR+iuhqv6SkrLE0eF/BwJ/
         r+Ge/00iBCkCVcrbbYQNF/UcHqIUKEkNyIbevgEtPyRpQtVK9mOf5rl0ACgsXpZoe1
         vKwERWTv8tJrJ/QQvwMPVP7o82JE87RI1DFDDczSL4W8OJKr3iKnUPgPtmAw8260m+
         EVVT0cOyjZkJw==
X-Nifty-SrcIP: [209.85.222.172]
Received: by mail-qk1-f172.google.com with SMTP id l78so2685455qke.7
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2020 08:09:36 -0700 (PDT)
X-Gm-Message-State: AGi0PuayqcLWJNkPkDPyYuUd9CNcl0UNz6ttOugxnh0T1an9GhfHrtuB
        NGtC2OakszTUoLQtlhL8dsBCeu+wvgOLmRXzWR4=
X-Google-Smtp-Source: APiQypKNE3J/ixPyBgoZQOom5KHmUxkSBQ2XEBwHpoVjaxblJiU39sy7AZcuyhpAMZpdTnF1iWiw69Rc48UVtPfQ8qo=
X-Received: by 2002:a37:9105:: with SMTP id t5mr27150650qkd.202.1587568174946;
 Wed, 22 Apr 2020 08:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200422114429.0b1a6f1a3366bae5964f3e10@linaro.org> <20200422115035.2f8d48843793d0d6f6724522@linaro.org>
In-Reply-To: <20200422115035.2f8d48843793d0d6f6724522@linaro.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 23 Apr 2020 00:08:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQL1ZkHKwODW2VYnpRw+y5Eg4abg+xCDa=PfQktHLnW_w@mail.gmail.com>
Message-ID: <CAK7LNAQL1ZkHKwODW2VYnpRw+y5Eg4abg+xCDa=PfQktHLnW_w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: uniphier: Add support for Akebi96
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

Hiramatsu-san

On Wed, Apr 22, 2020 at 11:50 AM Masami Hiramatsu
<masami.hiramatsu@linaro.org> wrote:

> +
> +&eth {
> +       status = "okay";
> +       phy-mode = "rgmii";
> +       pinctrl-0 = <&pinctrl_ether_rgmii>;

These two lines are actually redundant because RGMII
is the default in uniphier-ld20.dtsi
(and uniphier-ld20-ref.dts skips them.)

Did you intentionally make it verbose?




> +       phy-handle = <&ethphy>;
> +};
> +
> +&mdio {
> +       ethphy: ethphy@0 {
> +               reg = <0>;
> +       };
> +};
> +
> +&usb {
> +       status = "okay";
> +};
> +
> +&pcie {
> +       status = "okay";
> +};
> +
> +&i2c0 {
> +       /* LS connector I2C0 */
> +       status = "okay";
> +};
> +
> +&i2c1 {
> +       /* LS connector I2C1 */
> +       status = "okay";
> +};
> +
> +&spi3 {
> +       status = "okay";
> +       #address-cells = <1>;
> +       #size-cells = <0>;

Adding #address-cells and #size-sizes to a board DTS
is strange.

I will apply this:
https://lore.kernel.org/patchwork/patch/1229497/
then delete the lines above.




--
Best Regards


Masahiro Yamada
