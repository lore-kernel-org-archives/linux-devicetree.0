Return-Path: <SRS0=PToE=Z3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBC9C43603
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 00:55:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BBBCE24671
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 00:55:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFoaD7QD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbfLEAzH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 19:55:07 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40217 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728098AbfLEAzG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Dec 2019 19:55:06 -0500
Received: by mail-pf1-f193.google.com with SMTP id q8so714412pfh.7;
        Wed, 04 Dec 2019 16:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=d6Csj6U0+grfMQyPcI2MRtp14xJZsLe4pPPVYQKDBHg=;
        b=dFoaD7QDyB4Y4mpD9b/Pe5Yqd6ljHqp6PN3tYKbt/uoug38dguaomQVZPY4XIaYM6Z
         3xgsWGPgaT1AwfK44TtYAs2Axi+kUl+ggeTwOhHoDZKREcO3r4IuLKdPX0UOHJxKTafZ
         ryCF73mOMJAnm/Z9fZs7jai9GOriS6O5mYkoBWQGty9mTN0dibhc5YTXG1mh9RaUDXh3
         WBpGLNlsq9Rb5QO81WRccE6/f0wQ9V3ABR6yqRJzHMkqATj+HonXrrtxtggG4eSOLtke
         eCXXh3WKIDQ/B2dMtBHtgd1lNlhG/AxhMM7UElNjaIAKlblA5KOyF7qfw8WgDGLwZmLv
         +08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d6Csj6U0+grfMQyPcI2MRtp14xJZsLe4pPPVYQKDBHg=;
        b=YZBzJ9LSQ3J+LgyxMP2rBbdIevCxB2VjB/dQBcXV5PvuV+d0CNk169Zh6JoBKbtj/P
         HhyqbzP4ziNBsrcYyB0VpsEMpZP/f5rJaTDc3WtEp76WBdRfuYFedzLtSC49W5EEexbf
         ms/S27X7BS+khTxzhw05ZKDI8ZaWE6gXwXRRhFOBxALrCk0VB0/HYWIvT3XOPsBQ5mqg
         93ev803iiJAIbuQ+yHLKvIiDQ1drXw8p491hZXwzKf89hI5Kmlj/TFPeHbPqfJZZ+QL6
         g9Q3W/bC3Pqvg0pDLdiazZCh8xDnP198RJ98ZvwgsTnZAgg2ZovM/Raoj1iXUfUU8toB
         KxpA==
X-Gm-Message-State: APjAAAU0j205ZKa7qrvazqOtPCVnEEoix7LJC9KRGSDvrYT3MicAjvEL
        9byHX1UxKNBG8s7lbMNyV1U=
X-Google-Smtp-Source: APXvYqw/c86Dl1C8JR0jDUOr+yGX05pbNgzBjrJPb44O3JzjdT+ifVAsuXX3hvfMm3MH64Cy2wuf0w==
X-Received: by 2002:a63:cb:: with SMTP id 194mr6614885pga.163.1575507306088;
        Wed, 04 Dec 2019 16:55:06 -0800 (PST)
Received: from ?IPv6:240d:1a:90a:7900:c9ba:60a6:b93d:a99a? ([240d:1a:90a:7900:c9ba:60a6:b93d:a99a])
        by smtp.gmail.com with ESMTPSA id o19sm235031pjr.2.2019.12.04.16.55.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Dec 2019 16:55:05 -0800 (PST)
Subject: Re: Fedora on Raspberry Pi
To:     Erastus Toe <chukpozohnt@gmail.com>
References: <940E1B0B-422A-40F0-A779-893133C6405F@gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree-spec@vger.kernel.org,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Message-ID: <a823a227-5c94-47a8-16c7-e363bc40e6ed@gmail.com>
Date:   Wed, 4 Dec 2019 18:55:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <940E1B0B-422A-40F0-A779-893133C6405F@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

+ linux device tree mail list

If you reply to this email, please remove devicetree-spec from the To: list.

On 11/3/19 6:59 AM, Erastus Toe wrote:
> Hello all, 
> 
> I’m in the process of setting up Fedora on RPi. More especially, I’m
> trying to get Sense Hat to work. But on the Fedora wiki, it is said
> that there’s a problem with device tree overlay. I’m very new to
> device tree and I’m still doing my research. It is also said that
> this group is working on this problem.
> 
> Is it possible for any to shin some light on this for me please? I’m
> a little lost here.
> Thank you,
> C. Erastus Toe 
> 

The devicetree-spec mail list is for discussion of the specification.
I added the linux kernel devicetree mail list to the distribution list.
That is the list you should use for Linux related devicetree questions.

The short answer to your RPi question is that you should use uboot
to apply any devicetree overlay that you want to use.  The Linux
kernel implementation of loading overlays after the kernel has
booted is an incomplete work in progress.

-Frank
