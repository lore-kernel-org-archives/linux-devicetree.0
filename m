Return-Path: <SRS0=wnEW=6Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD20BC47255
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 14:59:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D9CA206DD
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 14:59:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729439AbgEKO7R (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 May 2020 10:59:17 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52402 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727019AbgEKO7Q (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 May 2020 10:59:16 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 67E002A1873
Date:   Mon, 11 May 2020 16:59:11 +0200
From:   Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     robh+dt@kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>, robh+dt@kernel.org,
        kernel@collabora.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, jason@lakedaemon.net,
        laurent.pinchart@ideasonboard.com
Subject: Re: [RFC PATCH] dt-bindings: display: ti,tfp410.txt: convert to yaml
Message-ID: <20200511145911.2yv3aepofxqwdsju@rcn-XPS-13-9360>
Mail-Followup-To: robh+dt@kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>, kernel@collabora.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, jason@lakedaemon.net,
        laurent.pinchart@ideasonboard.com
References: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
 <3e377c73-25a3-a7b3-0604-41c54d70039e@ti.com>
 <20200506155320.GC15206@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200506155320.GC15206@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20171215
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

What's your opinion on this?

Some context: It's about bindings that define signed integer properties
with range checks that go below and above zero. The schema checker fails
because, apparently, it interprets every cell value as an uint32, which
makes the range check fail for negative numbers.

On mié 06-05-2020 18:53:20, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Tue, Apr 28, 2020 at 12:49:28PM +0300, Tomi Valkeinen wrote:
> > On 28/04/2020 12:20, Ricardo Cañuelo wrote:
> > 
> > > 2) The definition of ti,deskew in the original binding seems to be
> > > tailored to the current driver and the way it's defined may not be very
> > > DT-friendly.
> > > 
> > >    This parameter maps to a 3-bit field in a hardware register that takes
> > >    a value from 0 to 7, so the [-4, 3] range described for this would map
> > >    to [000, 111]: -4 -> 000, -3 -> 001, -2 -> 010, ... 3 -> 111.
> > > 
> > >    Then, the driver parses the parameter (unsigned) and casts it to a
> > >    signed integer to get a number in the [-4, 3] range.
> > 
> > Interestingly the current example has ti,deskew = <4>...
> > 
> > >    A vendor-specific property must have a type definition in json-schema,
> > >    so if I translate the original bindings semantics directly, I should
> > >    define ti,deskew as an int32, but this makes dt_binding_check fail if
> > >    the property has a negative value in the example because of the
> > >    internal representation of cells as unsigned integers:
> > > 
> > >       ti,deskew:0:0: 4294967293 is greater than the maximum of 2147483647
> > 
> > I don't quite understand this. We cannot have negative numbers in dts files? Or we can, but 
> > dt_binding_check doesn't handle them correctly? Or that int32 is not supported in yaml bindings?
> > 
> > >    So I can think of two solutions to this:
> > > 
> > >    a) Keep the ti,deskew property as an uint32 and document the valid
> > >    range ([-4, 3]) in the property description (this is what this patch
> > >    does currently).
> > > 
> > >    b) Redefine this property to be closer to the datasheet description
> > >    (ie. unsigned integers from 0 to 7) and adapt the driver accordingly.
> > >    This would also let us define its range properly using minimum and
> > >    maximum properties for it.
> > > 
> > >    I think (b) is the right thing to do but I want to know your
> > >    opinion. Besides, I don't have this hardware at hand and if I updated
> > >    the driver I wouldn't be able to test it.
> > 
> > I don't think anyone has used deskew property, so I guess changing it is not out of the question.
> > 
> > Laurent, did you have a board that needs deskew when you added it to tfp410?
> 
> I didn't if I remember correctly, I just mapped it to the hardware
> features. The hardware register indeed takes a value between 0 and 7,
> and that is mapped to [-4,3] x t(STEP). I don't mind either option.
> 
> -- 
> Regards,
> 
> Laurent Pinchart

I haven't found any examples of yaml bindings defining signed integer
properties such as this, what's the norm in this case? Do you agree with
any of the proposed solutions? Do you have a better suggestion?

Thanks,
Ricardo
