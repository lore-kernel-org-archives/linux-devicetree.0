Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF486C433E3
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 12:03:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B96D320B1F
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 12:03:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbgHRMDI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Aug 2020 08:03:08 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:58825 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbgHRMDH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Aug 2020 08:03:07 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 593176000B;
        Tue, 18 Aug 2020 12:03:01 +0000 (UTC)
Date:   Tue, 18 Aug 2020 14:06:44 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: media: ov772x: Make bus-type mandatory
Message-ID: <20200818120644.uim7facln2rxf65y@uno.localdomain>
References: <20200817155910.255883-1-jacopo+renesas@jmondi.org>
 <20200817155910.255883-3-jacopo+renesas@jmondi.org>
 <2a942333-695c-bd99-af63-7ac55682700b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2a942333-695c-bd99-af63-7ac55682700b@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sergei

On Mon, Aug 17, 2020 at 11:14:04PM +0300, Sergei Shtylyov wrote:
> On 8/17/20 6:59 PM, Jacopo Mondi wrote:
>
> > In order to establish required properties based on the selected
> > bus type, make the 'bus-type' property mandatory.
> >
> > Binary compatibility with existing DTB is kept as the driver does not
> > enforce the property to be present, and shall fall-back to default
> > parallel bus configuration, which was the only supported bus type, if
> > the property is not specified.
>
>    Signed-off-by?
>

Who didn't run checkpatch on this binding path: o/

Will re-send, sorry for the fuss

> [...]
>
> MBR, Sergei
