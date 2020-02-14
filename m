Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB207C3B194
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 04:37:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C3C11222C4
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 04:37:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aPI/hu8P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbgBNEhx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Feb 2020 23:37:53 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45242 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728369AbgBNEhw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 13 Feb 2020 23:37:52 -0500
Received: by mail-pg1-f195.google.com with SMTP id b9so4159853pgk.12
        for <devicetree@vger.kernel.org>; Thu, 13 Feb 2020 20:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sXYbHXnStlSV/wVAiYY1J/qYN5iYE4IgpKDTx0cYFaM=;
        b=aPI/hu8PpnSBodD+EMjkil18ImS+H5/PTMWyXvS5hs3PspqZv8elCUUgVgbpTX2je8
         SkWu4p07B/WmSD7K9PqDaofmNmfUP5WQYd6OHidWKqEO6tO68eJRKzdylhmfQ12WxzQW
         h+zLyHFqalBG2nKztCUt9NqN2Zu3kDDh0N19xUNLnFtBlRy+3SQY+XpNmkWnss7jE1mO
         sFWogzr77S3U8m5+nJIdmHUjK1ISMubunLly4gV0dJtwW3eaum8KsBtvRkBN/b2ImcHT
         AoyERFqUjrS2zoMv04wjJKgwzUIVfXXCmtHEKzI0zg6mChHsBQ44qhrssoZLfRSwz+gT
         GT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sXYbHXnStlSV/wVAiYY1J/qYN5iYE4IgpKDTx0cYFaM=;
        b=NvM8PKHLeOQweoiDamyRT480GsD9d6eSPLSF0Lim0Rw3Me7wS3o/WnQsPswp87HEUF
         5X8/OlxBfj+TolgCow4Bh5Th9JPaBLByTg1LBOwxvFcvapErybcyBifeQ4SZ+w29RAEb
         6mRU/W2EMz+OphnEmUl+90ReF+ddm+IlpRlVyI/6a8sexfNGY4hlaoJHoytZMIEtlV0s
         oKDIDILiBRoJH9IVhHd6JufeE19Tkjxzc+vtMnaLqJZlBQ8f5eCivBuLpSUC6dcv0eb8
         baGLVOPr/PBvZePGrR+8Ai5cETbrsWS0ux4NOcBllZTOnixnkgJtbXWVwq9V4xNvig0Q
         9cEA==
X-Gm-Message-State: APjAAAXpJwmb2CHu82kQaNKW5Hdn9Fe9euf+WxBS72AiNhqUv9ctwFYu
        GRnpPGvCzMprfcihgMw4RQDMgw==
X-Google-Smtp-Source: APXvYqxJqX8eWkAgNl/ZvjgcpAeqquPr1kb3ebdEZR6pplbWqdl2Rjw6pRoDfD5m3CjptIhnRPwNlQ==
X-Received: by 2002:aa7:9891:: with SMTP id r17mr1471506pfl.205.1581655071740;
        Thu, 13 Feb 2020 20:37:51 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b6sm5010051pfg.17.2020.02.13.20.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 20:37:50 -0800 (PST)
Date:   Thu, 13 Feb 2020 20:37:48 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: Re: [PATCH v3 6/8] remoteproc: Introduce "panic" callback in ops
Message-ID: <20200214043748.GR3948@builder>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
 <20200211005059.1377279-7-bjorn.andersson@linaro.org>
 <158164806895.184098.244699295706516537@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158164806895.184098.244699295706516537@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu 13 Feb 18:41 PST 2020, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2020-02-10 16:50:57)
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 097f33e4f1f3..8b6932027d36 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -2216,10 +2218,53 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
> >  }
> >  EXPORT_SYMBOL(rproc_report_crash);
> >  
> > +static int rproc_panic_handler(struct notifier_block *nb, unsigned long event,
> > +                              void *ptr)
> > +{
> > +       unsigned int longest = 0;
> > +       struct rproc *rproc;
> > +       unsigned int d;
> > +       int locked;
> > +
> > +       locked = mutex_trylock(&rproc_list_mutex);
> > +       if (!locked) {
> > +               pr_err("Failed to acquire rproc list lock, won't call panic functions\n");
> > +               return NOTIFY_DONE;
> > +       }
> > +
> > +       list_for_each_entry(rproc, &rproc_list, node) {
> > +               if (!rproc->ops->panic || rproc->state != RPROC_RUNNING)
> > +                       continue;
> > +
> > +               d = rproc->ops->panic(rproc);
> > +               if (d > longest)
> > +                       longest = d;
> 
> Could be
> 
> 	d = max(longest, d);
> 

I like this better and now I have an excuse to change to it.

> > +       }
> > +
> > +       mutex_unlock(&rproc_list_mutex);
> > +
> > +       /* Delay panic for the longest requested duration */
> > +       mdelay(longest);
> 
> Is this to flush caches? Maybe indicate that in the comment.
> 

Here, in the core, it's for whatever the individual drivers might need
it for, but "flushing caches" is likely the main purpose.

That said, the Qualcomm implementation is, as you can see, to issue a
generic "stop request", so flushing caches will not be the only thing
that happens.

> > +
> > +       return NOTIFY_DONE;
> > +}
> > +
> > +static void __init rproc_init_panic(void)
> > +{
> > +       rproc_panic_nb.notifier_call = rproc_panic_handler;
> > +       atomic_notifier_chain_register(&panic_notifier_list, &rproc_panic_nb);
> 
> This is an atomic notifier, but the notifier function takes a mutex,
> which sleeps. It should use spinlocks, and never sleep, given that panic
> can be called from anywhere.
> 

Given that we're only trylocking I was expecting there not to be a
sleep. But if that's the case I'll have to revisit this.

If I rework rproc_get_by_phandle() slightly I should be able to rely on
rcu instead of the mutex for the two readers, which would also resolve
Arnaud's concern regarding the possibility of a panic while updating the
list will cause the panic handling to be skipped.

> > +}
> > +
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index 16ad66683ad0..14f05f26cbcd 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -369,6 +369,8 @@ enum rsc_handling_status {
> >   *                     expects to find it
> >   * @sanity_check:      sanity check the fw image
> >   * @get_boot_addr:     get boot address to entry point specified in firmware
> > + * @panic:     optional callback to react to system panic, core will delay
> > + *             panic at least the returned number of milliseconds
> >   */
> >  struct rproc_ops {
> >         int (*start)(struct rproc *rproc);
> > @@ -383,6 +385,7 @@ struct rproc_ops {
> >         int (*load)(struct rproc *rproc, const struct firmware *fw);
> >         int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
> >         u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> > +       unsigned int (*panic)(struct rproc *rproc);
> 
> Maybe should be unsigned long to match other "timeouts" in the kernel.

Sounds good.

Thanks,
Bjorn
