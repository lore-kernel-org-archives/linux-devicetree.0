Return-Path: <SRS0=r3bb=2H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504FBC3F68F
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 00:11:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 265EC2176D
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 00:11:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=netronome-com.20150623.gappssmtp.com header.i=@netronome-com.20150623.gappssmtp.com header.b="LlZOOR9c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbfLQAL0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 19:11:26 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34982 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727198AbfLQALZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 19:11:25 -0500
Received: by mail-lj1-f195.google.com with SMTP id j6so8837670lja.2
        for <devicetree@vger.kernel.org>; Mon, 16 Dec 2019 16:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=mgdbNsb2U5szXT98Luh3Bo8MJcnyi91BccDx4009UHE=;
        b=LlZOOR9cNxBNM4lljL4PWV6m5lhlUA0UqAWkEVPbwfbEurMkEFzYiOEaHfO91gU2uI
         xjMktLJxGyZ4PgLHjTRIs4URVbpg8C8ESOjdF7giaahBuCRVv3HHk/O9535icb2WfNS1
         yCGYfmHyCrDjp0q29VuuicGEtKv5yiGXHJOIizZUdjP2HX+V16JiPug8AOgXQTf6iPvc
         CmFlTKqqwiL7fsQGFz5zUB7sjhFX+Ssi9INqeKv1/ueEJAgg53AHWSlHZG1QnSZzN23V
         CVVUlGhcikgB6I9qGI6Ofr4F3nFd5fikCeXS/oqGSpTe0GG2MEYK7DgOhD6CMVSe53lb
         vKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=mgdbNsb2U5szXT98Luh3Bo8MJcnyi91BccDx4009UHE=;
        b=RBhIhD5OyG3PfLgwz4pSILUJBbeJ0hMTZxtF8Ri/FxgslCbg4LRxK68Q1Fso04mI2f
         zOe1sLHjgwHnKz9TGEHyjJJUaml1WjZXgJzogKY5Bml6NQlRUTtSsK9LQjbwZkZ0pkY6
         2456A+CnadE4nLdP1jX/l/s4kpSM7hfTXvfnYDL2vM++a6VEPaz1UCIzvII4H/Ju9CY1
         6XkYW8pXOXPP4ARSRRZ4Ip6GC6tnH6f90QbOTZLpyooLO0cLhgqHq7lEerXKK+EWMPBy
         GGhAnY5SRq4AZm2DD7loXMBsxW/qoeLSVk9GP8tmtYLMS6nhM18ecbaEVVUJS+wCGhQf
         1n9A==
X-Gm-Message-State: APjAAAUzfLb9+hEkS+IA7mE37OuLMKfW9illGhzg1mBPxugkwfYC1Zqu
        SyWzrKeTZJNkM37Z8HWOr28e2w==
X-Google-Smtp-Source: APXvYqz3Im0Fgkkiyr2JZbkmyo8my7bPlxXPgPfqc89lQKgQjaIKkN27ALt6zcR5Szea7m3ErnAVNg==
X-Received: by 2002:a2e:b60d:: with SMTP id r13mr1257632ljn.40.1576541483323;
        Mon, 16 Dec 2019 16:11:23 -0800 (PST)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id u25sm9853720lfk.46.2019.12.16.16.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 16:11:22 -0800 (PST)
Date:   Mon, 16 Dec 2019 16:11:14 -0800
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Richard Cochran <richardcochran@gmail.com>
Cc:     netdev@vger.kernel.org, David Miller <davem@davemloft.net>,
        devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jacob Keller <jacob.e.keller@intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Willem de Bruijn <willemb@google.com>,
        Wingman Kwok <w-kwok2@ti.com>
Subject: Re: [PATCH V6 net-next 11/11] ptp: Add a driver for InES time
 stamping IP core.
Message-ID: <20191216161114.3604d45d@cakuba.netronome.com>
In-Reply-To: <33afc113fa0b301d289522971c83dbbf0d36c8ba.1576511937.git.richardcochran@gmail.com>
References: <cover.1576511937.git.richardcochran@gmail.com>
        <33afc113fa0b301d289522971c83dbbf0d36c8ba.1576511937.git.richardcochran@gmail.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 16 Dec 2019 08:13:26 -0800, Richard Cochran wrote:
> +	clkid = (u64 *)(data + offset + OFF_PTP_CLOCK_ID);
> +	portn = (u16 *)(data + offset + OFF_PTP_PORT_NUM);
> +	seqid = (u16 *)(data + offset + OFF_PTP_SEQUENCE_ID);

These should perhaps be __be types?

Looks like there is a few other sparse warnings in ptp_ines.c, would
you mind addressing those?

> +	if (tag_to_msgtype(ts->tag & 0x7) != (*msgtype & 0xf)) {
> +		pr_debug("msgtype mismatch ts %hhu != skb %hhu\n",
> +			 tag_to_msgtype(ts->tag & 0x7), *msgtype & 0xf);
> +		return false;
> +	}
> +	if (cpu_to_be64(ts->clkid) != *clkid) {
> +		pr_debug("clkid mismatch ts %llx != skb %llx\n",
> +			 cpu_to_be64(ts->clkid), *clkid);
> +		return false;
> +	}
> +	if (ts->portnum != ntohs(*portn)) {
> +		pr_debug("portn mismatch ts %hu != skb %hu\n",
> +			 ts->portnum, ntohs(*portn));
> +		return false;
> +	}
> +	if (ts->seqid != ntohs(*seqid)) {
> +		pr_debug("seqid mismatch ts %hu != skb %hu\n",
> +			 ts->seqid, ntohs(*seqid));
> +		return false;
> +	}

