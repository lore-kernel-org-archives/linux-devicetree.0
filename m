Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39179C2BB55
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 14:15:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18843208FE
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 14:15:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TCBII8Gd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636540AbgDOOPk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 10:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2634150AbgDOOPh (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Apr 2020 10:15:37 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1009C061A0E
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 07:15:36 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id q19so3814499ljp.9
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 07:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iD9DiJbsjFvR0l8VWA77X1IH3xwznCsLM8hKGPl+PRU=;
        b=TCBII8GdGPliEdTt5zYPCbSfN/GirM3CNA1L+hF8wVCUcb+iXhsn7f4YnEpddGWFHV
         lndjOYl1+Ns7/wuISMz2Dd0D+/VawofNWW5V73ksyTbJB5ra4IO6JKqx91XgSn1JhF40
         nZuZv+M+5bEI1JnwoyBiAEOkCtd4T1RpAF7rCY5QFU0LCjN0ubdhmg+9YC3+sTOeGY7K
         ZHKAFY9iv12Ap88OB7TIzT3ncKuekNYZTwCBD7GgsLT79eRn//B2ibp8bMrWjLZp8QEs
         1BvhUkRp9v2avwM7XwqJKPmnl/Zj3hF+0DaW4/KdN90Q+6RKfJWxkK/aCb1XpBHgtM+S
         Lifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iD9DiJbsjFvR0l8VWA77X1IH3xwznCsLM8hKGPl+PRU=;
        b=nz6Ujrv+9hJKT+4DWgRVMDpt1xVOWWwNi7DfeuPcO5GkjyQqW+rfuhwWDkjmqBKEhf
         NKj1MxAqieUoeJxkUUCUYgFCqLysXRb9oUVzaQzc5FofMIE9e9IYEIPAp29fMf2go11A
         cIqcJRBZ4SJiEfng1B/IM2d8Q05DSqEllMXg131y5rBAFCKxSj+8sTeBPySu8M5SLagC
         LDy3u1SpMh1Mhv4lMD1/ZuVgJqkpxPSGwrCxQxMxHcmxqGGYAqZqOQg78sgDVG8UtMvM
         qBEIlkSWPMU2Clur5V6NTdaM/Qi8JC67xO2Nf+Ksylir0JrNL4i7vIrFa4JuhPhSr4MM
         wDnw==
X-Gm-Message-State: AGi0PuYOHuLzu+kEF2rbeSMcgBpTGnymqduAF2RH280HTIeam/6fEqD1
        G2e0IFB1xh1h8NR501XfqZ8PXAnikt9CPJTFm00mfA==
X-Google-Smtp-Source: APiQypIcyGvGInNcx/iI+quCACUkFCbt3D6BOE2RxrRaAY7YSDkYMPEja+ESZ2QVxtJaLPp2pbfh6o6G0FQktdlPVf0=
X-Received: by 2002:a05:651c:20a:: with SMTP id y10mr3324332ljn.69.1586960134977;
 Wed, 15 Apr 2020 07:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <1583673879-20714-3-git-send-email-peng.fan@nxp.com>
 <5e96e916.1c69fb81.14365.050b@mx.google.com> <20200415131612.GC31928@bogus>
In-Reply-To: <20200415131612.GC31928@bogus>
From:   Etienne Carriere <etienne.carriere@linaro.org>
Date:   Wed, 15 Apr 2020 16:15:23 +0200
Message-ID: <CAN5uoS9CSspCeMWX8JWVDdLtjX81F-15GL0QqrqzNgnnRiMpxQ@mail.gmail.com>
Subject: Re: [PATCH V5 2/2] firmware: arm_scmi: add smc/hvc transport
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org,
        f.fainelli@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-imx@nxp.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello Sudeep,

On Wed, 15 Apr 2020 at 15:16, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Wed, Apr 15, 2020 at 12:58:58PM +0200, Etienne Carriere wrote:
> > Hello Peng,
> >
> > I  have 2 comments on this change. The main is about using
> > arm_smccc_1_1_invoke(). Below some details and I added comments
> > inside you patch. The second of on SMC return value, see my
> > comment in your patch below.
> >
> > About arm_smccc_1_1_invoke(), this functon currently relies on PSCI
> > driver to define a conduit method but SCMI agent driver does not
> > mandate CONFIG_PSCI to be enable.
> >
>
> Yes this was discussed and it is done so deliberately. I have added the
> build dependency when I merged the patch. There's no dependency on
> CONFIG_PSCI.

Ok, I understand your point.
Yet it seems to me there is still a dependency on CONFIG_ARM_PSCI_FW
and also a dependency on a PSCI node in the DT.

However, I must admit I don't know yet a platform that enables
CONFIG_ARM_SCMI_PROTOCOL but not CONFIG_ARM_PSCI_FW, hence
so far, so good.


About dependencies, it think the dependency on MAILBOX in
firmware/Kconfig should be updated:

 config ARM_SCMI_PROTOCOL
         bool "ARM System Control and Management Interface (SCMI)
Message Protocol"
         depends on ARM || ARM64 || COMPILE_TEST
-        depends on MAILBOX
+        depends on MAILBOX | HAVE_ARM_SMCCC
         help

>
> > Could you add an optional "method" property for "arm,scmi-smc" for platforms
> > willing to not rely on PSCI Linux driver? If no property "method" is
> > defined in the FDT, invocation relies on arm_smccc_1_1_invoke().
> >
>
> Nope, we don't want mixture here. Why is the system not using PSCI/SMCCC ?

Ok, as I staed above, I don't know any platform that enables
CONFIG_ARM_SCMI_PROTOCOL but not CONFIG_ARM_PSCI_FW.

>
> > "method" naming mimics what is done in the OP-TEE driver (drivers/tee/optee/).
> > Here is a proposal for the documenting property "method" in
> > Documentation/arm,scmi.txt:
> >
> > - method : "smc" or "hvc"
> >             Optional property defining the conduit method for to be used
> >           for invoking the SCMI server in secure world.
> >           "smc" states instruction SMC #0 is used whereas "hvc" states
> >           instruction HVC #0 is used.
> >
> >
>
> It was rejected, you can try your luck with OPTEE :)
> We will just use the system conduit here with SCMI for SMC/HVC transport.
> Details in previous version of the patch.
>
> [...]
>
> > > +struct scmi_smc {
> > > +   struct scmi_chan_info *cinfo;
> > > +   struct scmi_shared_mem __iomem *shmem;
> > > +   u32 func_id;
> > > +};
> >
> > Add here a field for the secure world invocation function handler:
> >
> >       scmi_arm_smccc_invoke_fn *invoke_fn;
> >
>
> As stated not needed if we use  arm_smccc_1_1_invoke()
>
> [...]
>

Regards,
Etienne
