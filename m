Return-Path: <SRS0=Fzrg=42=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961C6C10F27
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 18:23:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7092520828
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 18:23:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oLl6S0gM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbgCISXI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Mar 2020 14:23:08 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34903 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbgCISXH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Mar 2020 14:23:07 -0400
Received: by mail-pf1-f194.google.com with SMTP id u68so4484713pfb.2
        for <devicetree@vger.kernel.org>; Mon, 09 Mar 2020 11:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=82dH+sJ15Ldshryiq0HsH5AclffhvcMdjvdymma/EAM=;
        b=oLl6S0gM4gLxCh+cd88ogRCnh4JBCz5iq0tCYjiarP4lY6rV8yz1pfTfPhF0WfK/qJ
         gFz0VA+eLUw2SNrcIed9mr2QCj06ekq9xCZPVRUYrxt3lh+6R1CSLWJJ59YRdwiaapIN
         PWwtibFjepZgVXEjR138LljiCrB1T18zef8XA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=82dH+sJ15Ldshryiq0HsH5AclffhvcMdjvdymma/EAM=;
        b=nZF+dru7qU4aOd7ipWhlxCJ2zUzkJZd+luRQNvqwxQj8W6r61SvKcaWfyLyA569ZLU
         vAPgHzrWVeOhcbPHv+D0pjPzvvIXsJhqOR9puwf5USgzxLk0XS+Ls9yNZ7F8+dYZdQ1t
         dEXGZQfuZMFdm5QmL47PyyZEbD1gT53LFf3KpkJekSv8D5XJ1RLhlstbj+I1rPYoD47g
         Zmvwb8e4JNtzsQg9ClI0HAuak91IYMJapJ/0xIPwROYlwTqoFUiQws8/esdA956UTWAa
         9P2P5fmLZfTHOVjUIGJRCZ9v9HXhUxhCtaf2JTNnyQDAm66VuMC+jphL+doXrWw7KWtw
         F9kg==
X-Gm-Message-State: ANhLgQ2UIWRxzFmVPBD238lUu8GDVkG0Coj1sGlJihYJpa3eIUUvjas8
        Hsq0XOrRewfkSEIw7kvN6f/aLA==
X-Google-Smtp-Source: ADFU+vt76X0Uszasj2fbq6k4WAAfFHzB09o/cHllk3EBigMBTQ2q7C01Ws3zAVvmNKzgaOqyMhCq/g==
X-Received: by 2002:a63:7f1d:: with SMTP id a29mr17893011pgd.123.1583778186633;
        Mon, 09 Mar 2020 11:23:06 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id q30sm244145pjh.5.2020.03.09.11.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 11:23:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1583752457-21159-2-git-send-email-mkshah@codeaurora.org>
References: <1583752457-21159-1-git-send-email-mkshah@codeaurora.org> <1583752457-21159-2-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: Introduce SoC sleep stats bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        devicetree@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Date:   Mon, 09 Mar 2020 11:23:05 -0700
Message-ID: <158377818530.66766.4481786840843320343@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Maulik Shah (2020-03-09 04:14:14)
> From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
>=20
> Add device binding documentation for Qualcomm Technologies, Inc. (QTI)
> SoC sleep stats driver. The driver is used for displaying SoC sleep
> statistic maintained by Always On Processor or Resource Power Manager.
>=20
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../bindings/soc/qcom/soc-sleep-stats.yaml         | 46 ++++++++++++++++=
++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/soc-sleep-=
stats.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.y=
aml b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
> new file mode 100644
> index 00000000..7c29c61
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/soc-sleep-stats.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. (QTI) SoC sleep stats bindings
> +
> +maintainers:
> +  - Maulik Shah <mkshah@codeaurora.org>
> +  - Lina Iyer <ilina@codeaurora.org>
> +
> +description:
> +  Always On Processor/Resource Power Manager maintains statistics of the=
 SoC
> +  sleep modes involving powering down of the rails and oscillator clock.
> +
> +  Statistics includes SoC sleep mode type, number of times low power mod=
e were
> +  entered, time of last entry, time of last exit and accumulated sleep d=
uration.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,rpmh-sleep-stats
> +      - qcom,rpm-sleep-stats
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  # Example of rpmh sleep stats
> +  - |
> +    rpmh_sleep_stats@c3f0000 {
> +      compatible =3D "qcom,rpmh-sleep-stats";
> +      reg =3D <0 0xc3f0000 0 0x400>;
> +    };
> +  # Example of rpm sleep stats
> +  - |
> +    rpm_sleep_stats@4690000 {

Node names don't have underscores. It really feels like we should be able
to get away with not having this device node at all. Why can't we have
the rpm message ram be a node that covers the entire range and then have
that either create a platform device for debugfs stats or just have it
register the stat information from whatever driver attaches to that
node?

Carving this up into multiple nodes and making compatible strings
doesn't seem very useful here because we're essentially making device
nodes in DT for logical software components that exist in the rpm
message ram.
