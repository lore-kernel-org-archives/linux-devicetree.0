Return-Path: <SRS0=Ay4y=B6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB2BC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 08:39:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA2CF207FB
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 08:39:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbgHTIjt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Aug 2020 04:39:49 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55678 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgHTIjs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Aug 2020 04:39:48 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E672A29A33B;
        Thu, 20 Aug 2020 09:39:46 +0100 (BST)
Date:   Thu, 20 Aug 2020 10:39:44 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Nicolas Pitre <nico@fluxnic.net>, linux-i3c@lists.infradead.org,
        devicetree@vger.kernel.org,
        Laura Nixon <laura.nixon@team.mipi.org>,
        Robert Gough <robert.gough@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthew Schnoor <matthew.schnoor@intel.com>,
        Nicolas Pitre <npitre@baylibre.com>
Subject: Re: [PATCH 2/2] i3c/master: add the mipi-i3c-hci driver
Message-ID: <20200820103944.08a55ba4@collabora.com>
In-Reply-To: <20200820100829.0e44200a@xps13>
References: <20200814034854.460830-1-nico@fluxnic.net>
        <20200814034854.460830-3-nico@fluxnic.net>
        <20200820100829.0e44200a@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 20 Aug 2020 10:08:29 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> > +		/*
> > +		 * TODO: Extend the subsystem layer to allow for registering
> > +		 * new device and provide BCR/DCR/PID at the same time.  
> 
> Not sure this is needed if you don't use it directly as the core will
> anyway (in its current form) send the relevant CCC to read these
> registers.

We considered optimizing that in the past but that means making the DAA
and SETDASA registration different. I'm not sure it's worth it to be
honest, PID/DCR/BCR only happens when initializing devices and I
suspect the overhead of querying those DATA twice in case of DAA is
negligible anyway.
