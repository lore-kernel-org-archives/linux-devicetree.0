Return-Path: <SRS0=NYOC=62=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BDD5C47255
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 02:09:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4EE32071A
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 02:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589249384;
	bh=0MRX231pJXN62Nn/nv9a7n9XhUP8EeaHeOBX/OsWQ6c=;
	h=Date:From:To:Subject:References:In-Reply-To:List-ID:From;
	b=v767jStU+8cpMDA2BKge/w4w3xDIsKvv7CNmpMjD/jNjPY3k/h1SQp5r4TPO7UopH
	 0fuj9ghJDd4+rmLVeXDueyGdJFKn65e4o/IecljU9/uXUCHk56dLDNF2A2TKV8y6HZ
	 hNV4v83Nvmf3M/eQda88+iq8uEXs+Hbnv5rAXrZg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbgELCJo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 May 2020 22:09:44 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:46977 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727886AbgELCJo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 May 2020 22:09:44 -0400
Received: by mail-ot1-f65.google.com with SMTP id z25so9270673otq.13
        for <devicetree@vger.kernel.org>; Mon, 11 May 2020 19:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=hx2GPWhJqt9kxObM/JXtvxzVEbR5wT0H4fhgwGryEc8=;
        b=HyjqD9QbWqjQXRILb26O11S/DUplBl+FqSojJScKSJvOiFLDNSELp8D+GwamDBCKe2
         tsfHHQob3Cj6IoDOal8nt7dOLwhp3tWMNlQd4sRC5u6oh39Ncxjq5X/LWBGWeBC67siJ
         iM8+zSd8zZpjNxJwFQCsIEzJF+WrM23xsBpc3RCpJnHZuzX0RGqloGleM99Y5BDmWqDS
         wNMXZ0w9ameaKmr7ILVmlEjji+ODoTaeDnnxnmR1ai7wbT7mvNc3jLQTKqrp4SlkRtCZ
         aQJTcvBr97B2QANtpWVMmsZBBATbN8knzf3Nk8BfD1n9HIuSAgBPnOtT4s7Dl9NuFPqA
         YQwg==
X-Gm-Message-State: AGi0PuZWsu2/KTdSKgLeUGLJYE3t3c1/B0uTSRQoeMSMLJamsONABEvZ
        RL96FPykgbvs6ogjB+QNAw==
X-Google-Smtp-Source: APiQypKIirFNWU90d1Ffrh4CEIScFhMrBN5Ab2uVt6ZLzmIl26jkrZYjHyZQwqCfgrroO/ir5KlD9g==
X-Received: by 2002:a9d:5f04:: with SMTP id f4mr16523087oti.154.1589249383244;
        Mon, 11 May 2020 19:09:43 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t22sm5101089oij.2.2020.05.11.19.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 19:09:42 -0700 (PDT)
Received: (nullmailer pid 12354 invoked by uid 1000);
        Tue, 12 May 2020 02:09:41 -0000
Date:   Mon, 11 May 2020 21:09:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>, kernel@collabora.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, jason@lakedaemon.net,
        laurent.pinchart@ideasonboard.com
Subject: Re: [RFC PATCH] dt-bindings: display: ti,tfp410.txt: convert to yaml
Message-ID: <20200512020941.GA2002@bogus>
References: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
 <3e377c73-25a3-a7b3-0604-41c54d70039e@ti.com>
 <20200506155320.GC15206@pendragon.ideasonboard.com>
 <20200511145911.2yv3aepofxqwdsju@rcn-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200511145911.2yv3aepofxqwdsju@rcn-XPS-13-9360>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, May 11, 2020 at 04:59:11PM +0200, Ricardo Cañuelo wrote:
> Hi Rob,
> 
> What's your opinion on this?
> 
> Some context: It's about bindings that define signed integer properties
> with range checks that go below and above zero. The schema checker fails
> because, apparently, it interprets every cell value as an uint32, which
> makes the range check fail for negative numbers.

The real fix is dtc needs to carry the sign thru to the yaml output 
format. In the mean time, perhaps the schema should have an unsigned 
range for signed types.

Rob

> 
> On mié 06-05-2020 18:53:20, Laurent Pinchart wrote:
> > Hi Tomi,
> > 
> > On Tue, Apr 28, 2020 at 12:49:28PM +0300, Tomi Valkeinen wrote:
> > > On 28/04/2020 12:20, Ricardo Cañuelo wrote:
> > > 
> > > > 2) The definition of ti,deskew in the original binding seems to be
> > > > tailored to the current driver and the way it's defined may not be very
> > > > DT-friendly.
> > > > 
> > > >    This parameter maps to a 3-bit field in a hardware register that takes
> > > >    a value from 0 to 7, so the [-4, 3] range described for this would map
> > > >    to [000, 111]: -4 -> 000, -3 -> 001, -2 -> 010, ... 3 -> 111.
> > > > 
> > > >    Then, the driver parses the parameter (unsigned) and casts it to a
> > > >    signed integer to get a number in the [-4, 3] range.
> > > 
> > > Interestingly the current example has ti,deskew = <4>...
> > > 
> > > >    A vendor-specific property must have a type definition in json-schema,
> > > >    so if I translate the original bindings semantics directly, I should
> > > >    define ti,deskew as an int32, but this makes dt_binding_check fail if
> > > >    the property has a negative value in the example because of the
> > > >    internal representation of cells as unsigned integers:
> > > > 
> > > >       ti,deskew:0:0: 4294967293 is greater than the maximum of 2147483647
> > > 
> > > I don't quite understand this. We cannot have negative numbers in dts files? Or we can, but 
> > > dt_binding_check doesn't handle them correctly? Or that int32 is not supported in yaml bindings?
> > > 
> > > >    So I can think of two solutions to this:
> > > > 
> > > >    a) Keep the ti,deskew property as an uint32 and document the valid
> > > >    range ([-4, 3]) in the property description (this is what this patch
> > > >    does currently).
> > > > 
> > > >    b) Redefine this property to be closer to the datasheet description
> > > >    (ie. unsigned integers from 0 to 7) and adapt the driver accordingly.
> > > >    This would also let us define its range properly using minimum and
> > > >    maximum properties for it.
> > > > 
> > > >    I think (b) is the right thing to do but I want to know your
> > > >    opinion. Besides, I don't have this hardware at hand and if I updated
> > > >    the driver I wouldn't be able to test it.
> > > 
> > > I don't think anyone has used deskew property, so I guess changing it is not out of the question.
> > > 
> > > Laurent, did you have a board that needs deskew when you added it to tfp410?
> > 
> > I didn't if I remember correctly, I just mapped it to the hardware
> > features. The hardware register indeed takes a value between 0 and 7,
> > and that is mapped to [-4,3] x t(STEP). I don't mind either option.
> > 
> > -- 
> > Regards,
> > 
> > Laurent Pinchart
> 
> I haven't found any examples of yaml bindings defining signed integer
> properties such as this, what's the norm in this case? Do you agree with
> any of the proposed solutions? Do you have a better suggestion?
> 
> Thanks,
> Ricardo
