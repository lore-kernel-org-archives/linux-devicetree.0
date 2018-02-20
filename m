Return-Path: <SRS0=RDbo=FO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:33541 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751119AbeBTKG3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 20 Feb 2018 05:06:29 -0500
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Feb 2018 11:06:28 +0100
Message-ID: <CAMuHMdU9Oh7VzVnmQ2E=4LtQbW2ZJSC4KnwCav_uA6jnXQo4hg@mail.gmail.com>
Subject: pinctrl: samsung: Out-of-bounds access through DT aliases
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi,

The Samsung pinctrl driver uses the "pinctrlN" alias from DT without performing
any validation on the returned index, which may lead to out-of-bounds accesses
in the SoC-specific samsung_pin_ctrl[] arrays:

drivers/pinctrl/samsung/pinctrl-samsung.c:samsung_pinctrl_get_soc_data():

        id = of_alias_get_id(node, "pinctrl");
        if (id < 0) {
                dev_err(&pdev->dev, "failed to get alias id\n");
                return ERR_PTR(-ENOENT);
        }
        ctrl = of_device_get_match_data(&pdev->dev);
        // FIXME out-of-bounds access, limit not known
        ctrl += id;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
