Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4ED5C28CBC
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 15:53:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0D8621744
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 15:53:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cuN863ca"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729364AbgEFPx2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 11:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728991AbgEFPx1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 11:53:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DAA8C061A0F
        for <devicetree@vger.kernel.org>; Wed,  6 May 2020 08:53:27 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A240542;
        Wed,  6 May 2020 17:53:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588780405;
        bh=FZL3UzlgiZlC3gydGO3GxyRmPe5XV61eLRKHOqGkBEk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cuN863caji1YMQLJSqCYgsli5Vq39qbegv7yEMniTBM8nE//uPtb86i5v8NyQST8k
         5QefX1UL/NFihwI26EOXlnHAqpx37Fy7i3z1TGvui3aAo8UZ7tlB6ZdgOH0B/d0zO3
         RQejHxuVqbF8Eur5wglykify6gUQQlUlY9JWQkbE=
Date:   Wed, 6 May 2020 18:53:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
        robh+dt@kernel.org, kernel@collabora.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, jason@lakedaemon.net
Subject: Re: [RFC PATCH] dt-bindings: display: ti,tfp410.txt: convert to yaml
Message-ID: <20200506155320.GC15206@pendragon.ideasonboard.com>
References: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
 <3e377c73-25a3-a7b3-0604-41c54d70039e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e377c73-25a3-a7b3-0604-41c54d70039e@ti.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Tomi,

On Tue, Apr 28, 2020 at 12:49:28PM +0300, Tomi Valkeinen wrote:
> On 28/04/2020 12:20, Ricardo Cañuelo wrote:
> 
> > 2) The definition of ti,deskew in the original binding seems to be
> > tailored to the current driver and the way it's defined may not be very
> > DT-friendly.
> > 
> >    This parameter maps to a 3-bit field in a hardware register that takes
> >    a value from 0 to 7, so the [-4, 3] range described for this would map
> >    to [000, 111]: -4 -> 000, -3 -> 001, -2 -> 010, ... 3 -> 111.
> > 
> >    Then, the driver parses the parameter (unsigned) and casts it to a
> >    signed integer to get a number in the [-4, 3] range.
> 
> Interestingly the current example has ti,deskew = <4>...
> 
> >    A vendor-specific property must have a type definition in json-schema,
> >    so if I translate the original bindings semantics directly, I should
> >    define ti,deskew as an int32, but this makes dt_binding_check fail if
> >    the property has a negative value in the example because of the
> >    internal representation of cells as unsigned integers:
> > 
> >       ti,deskew:0:0: 4294967293 is greater than the maximum of 2147483647
> 
> I don't quite understand this. We cannot have negative numbers in dts files? Or we can, but 
> dt_binding_check doesn't handle them correctly? Or that int32 is not supported in yaml bindings?
> 
> >    So I can think of two solutions to this:
> > 
> >    a) Keep the ti,deskew property as an uint32 and document the valid
> >    range ([-4, 3]) in the property description (this is what this patch
> >    does currently).
> > 
> >    b) Redefine this property to be closer to the datasheet description
> >    (ie. unsigned integers from 0 to 7) and adapt the driver accordingly.
> >    This would also let us define its range properly using minimum and
> >    maximum properties for it.
> > 
> >    I think (b) is the right thing to do but I want to know your
> >    opinion. Besides, I don't have this hardware at hand and if I updated
> >    the driver I wouldn't be able to test it.
> 
> I don't think anyone has used deskew property, so I guess changing it is not out of the question.
> 
> Laurent, did you have a board that needs deskew when you added it to tfp410?

I didn't if I remember correctly, I just mapped it to the hardware
features. The hardware register indeed takes a value between 0 and 7,
and that is mapped to [-4,3] x t(STEP). I don't mind either option.

-- 
Regards,

Laurent Pinchart
