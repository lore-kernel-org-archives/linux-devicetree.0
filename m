Return-Path: <SRS0=7KoJ=ZG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7846EC33C9A
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 21:31:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 517A120715
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 21:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573767091;
	bh=NGizlfJfdTxFMxbWMTcp+h3q5Xju6vU6fFmFtc8w7Nw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Thv8meBOVXlOiLzSILXjAeRFyQW10WKPRNBbt61gMODXcwma5DGV7PDuX58TwXP4t
	 lZxrDGYiYDX/XifhzC4yy0SoivDmg7bFJpI+mQ4+4D0m/NZw1DVFPXuR1roFasgkTc
	 G8JjDo+8qohBGOF8Q/KzLZoIw4VPKlZ6GOLFbg8M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfKNVba (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 Nov 2019 16:31:30 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43213 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726592AbfKNVba (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 Nov 2019 16:31:30 -0500
Received: by mail-ot1-f66.google.com with SMTP id l14so6194455oti.10;
        Thu, 14 Nov 2019 13:31:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fvBVfjkvK2RmBi9ZA/TUyVnjuAlnepWuk1h3Jf2rhwE=;
        b=F+rrJ6ZoKdOy0oxltdEwLNRu4MW56xZzRbPNhCMtIm3/Cm86KFZZOriyvLbSsA3QA2
         GIuVtZPAKz3R5+rQU8RFLayaZwKUYOxqLeG/Mm0Y3OYQMDfkk1wKH0nPpzydiT8KQQy/
         X4Ll11k754sRvFyRMGHtmbKA9seLn4smrhDokWrzuQq1XSYnVE+eNsZ4Ql/AbAKJg/5V
         QFNNAHziuzc6hXVwHo8ahoL/FbOZLhvCMLx2QvDyYy/aYbaHE69FAxYZ259Rylxx+2ny
         ts91U4uNXToHsvBMH8tBRZPxT35tUSyGYVeUKeAMh/3MAeRfgOBpgoY75NRbMN7ufdRU
         TRdQ==
X-Gm-Message-State: APjAAAV2OVeYwCaFCWOJuvLHRC4Ko9MLQ0ZTcdE9dIiAwdHR7R8d2SNP
        EWH6/QSSOcz/fNVSuNjVkg==
X-Google-Smtp-Source: APXvYqwu290hYy9rFsFOqPBqmsyiWdBwS6oSIiug5kJiF8KZhe815el4DSrnnu39MKFhcmHG93ur4w==
X-Received: by 2002:a9d:20e9:: with SMTP id x96mr9251000ota.160.1573767089147;
        Thu, 14 Nov 2019 13:31:29 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n204sm2212730oig.15.2019.11.14.13.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 13:31:28 -0800 (PST)
Date:   Thu, 14 Nov 2019 15:31:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas Soderlund <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] media: bindings: video-interfaces: Update the example
Message-ID: <20191114213127.GA18995@bogus>
References: <20191111140055.88054-1-jacopo+renesas@jmondi.org>
 <20191111170230.GQ18424@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191111170230.GQ18424@paasikivi.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Nov 11, 2019 at 07:02:30PM +0200, Sakari Ailus wrote:
> Hi Jacopo,
> 
> On Mon, Nov 11, 2019 at 03:00:55PM +0100, Jacopo Mondi wrote:
> > The example provided by the video-interface.txt file uses compatible
> > values for drivers which are have been removed a long time ago. To avoid
> > generating confusion, replace the existing example with a new one using
> > upstream maintained and more modern devices.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> > 
> > Re-proposing the example update, taking into account Niklas' comments about
> > removing most of the commits there.
> > 
> > Laurent suggested to move the example to json-schema, but being this file mostly
> > used as reference for the common video properties description, I'm not sure
> > bindings in yaml format make sense here.
> 
> I think the proposal makes sense as such, but this patch is just updating
> the example. The two seem unrelated.

Agreed.

Moving to schema does make sense. Probably want to split device and 
endpoint properties to 2 files.

Then you have something like this in the users:

endpoint:
  allOf:
    - $ref: video-interfaces-endpoints.yaml#

  properties:
    bus-width:
      # Only define what's specific to this device
      enum: [ 8, 16 ]
      default: 8

You could define more of the graph structure, but I figure we'll have a 
graph schema at some point. It hasn't been high on my priority list 
because the dtc checks for graphs are pretty good.

Rob
