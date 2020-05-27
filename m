Return-Path: <SRS0=aO3b=7J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B26C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 16:14:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D3EC20787
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 16:14:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725294AbgE0QOU convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 May 2020 12:14:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726093AbgE0QOT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 May 2020 12:14:19 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96322C03E97D
        for <devicetree@vger.kernel.org>; Wed, 27 May 2020 09:14:19 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jdyh5-0005L5-T0; Wed, 27 May 2020 18:14:15 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jdyh5-0004hJ-JC; Wed, 27 May 2020 18:14:15 +0200
Message-ID: <95bb2ed6eeadd6b7c60a9f5985abd21dcd3f7617.camel@pengutronix.de>
Subject: Re: [PATCH V3] dt-bindings: reset: Convert i.MX reset to json-schema
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Anson Huang <Anson.Huang@nxp.com>, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Date:   Wed, 27 May 2020 18:14:15 +0200
In-Reply-To: <1589859747-12926-1-git-send-email-Anson.Huang@nxp.com>
References: <1589859747-12926-1-git-send-email-Anson.Huang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Anson,

On Tue, 2020-05-19 at 11:42 +0800, Anson Huang wrote:
> Convert the i.MX reset binding to DT schema format using json-schema.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>

Thank you, applied to reset/next.

regards
Philipp
