Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5A4C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 07:34:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEA682177B
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 07:34:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727062AbgG1Heo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 03:34:44 -0400
Received: from mailout08.rmx.de ([94.199.90.85]:37971 "EHLO mailout08.rmx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727034AbgG1Heo (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 28 Jul 2020 03:34:44 -0400
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mailout08.rmx.de (Postfix) with ESMTPS id 4BG7jX4GPwzMpPp
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 09:34:40 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by kdin01.retarus.com (Postfix) with ESMTPS id 4BG7jT6ptFz2xjY
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 09:34:37 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.54.112) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Tue, 28 Jul
 2020 09:34:36 +0200
From:   Christian Eggers <ceggers@arri.de>
To:     Rob Herring <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: at25: fix syntax error in example code
Date:   Tue, 28 Jul 2020 09:34:36 +0200
Message-ID: <797979108.27KzEp727H@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <CAL_Jsq+jJFNQmxnXeA1HmBhM4aUH-qspdTCSRVvEfh0OVDF+DQ@mail.gmail.com>
References: <20200727100505.23908-1-ceggers@arri.de> <CAL_Jsq+jJFNQmxnXeA1HmBhM4aUH-qspdTCSRVvEfh0OVDF+DQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [192.168.54.112]
X-RMX-ID: 20200728-093437-4BG7jT6ptFz2xjY-0@kdin01
X-RMX-SOURCE: 217.111.95.66
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Monday, 27 July 2020, 19:56:59 CEST, Rob Herring wrote:
> On Mon, Jul 27, 2020 at 4:05 AM Christian Eggers <ceggers@arri.de> wrote:
> > Add missing semicolon.
> > 
> > Signed-off-by: Christian Eggers <ceggers@arri.de>
> > ---
> > 
> >  Documentation/devicetree/bindings/eeprom/at25.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> At this point, I'd prefer to see this converted to schema instead of
> trivial fixes. Then the tooling will catch these syntax errors.
> 
While trying to convert the at25 binding to yaml, I ran into the following problem:

> Required properties:
> - compatible : Should be "<vendor>,<type>", and generic value "atmel,at25".
> 
>   Example "<vendor>,<type>" values:
>     "anvo,anv32e61w"
>     "microchip,25lc040"
>     "st,m95m02"
>     "st,m95256"

The current binding uses arbitrary values for the compatible string,
only "atmel,at25" is really known by the driver. All other hardware related
settings are provided as separate properties.

When I specify

  compatible:
    enum:
      - atmel,at25

I get an error in dt_binding_check:

Documentation/devicetree/bindings/eeprom/at25.example.dt.yaml: eeprom@0: compatible: Additional items are not allowed ('atmel,at25' was unexpected)
Documentation/devicetree/bindings/eeprom/at25.example.dt.yaml: eeprom@0: compatible:0: 'st,m95256' is not one of ['atmel,at25']
Documentation/devicetree/bindings/eeprom/at25.example.dt.yaml: eeprom@0: compatible: ['st,m95256', 'atmel,at25'] is too long

How to handle this correctly?

regards
Christian


