Return-Path: <SRS0=zDJw=QF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:59343 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727488AbfA2VTi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 29 Jan 2019 16:19:38 -0500
Date: Tue, 29 Jan 2019 22:19:35 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: JSON schema and conditions
Message-ID: <20190129211935.ekxudfpkm44tntgk@flea>
References: <20190116145909.7x6n47a35xsjknj2@flea>
 <CAL_JsqKOng2g7+3FVx5cU99C-KJpvbJyfRxJCdm1aoCBsK1Rfg@mail.gmail.com>
 <20190117143510.3vmmxh2vc6mlp5i4@flea>
 <CAL_JsqJ43C8Y+QLZkeCg6bWzppLKzpyNxQa9BxfjyKyfBb90Sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <CAL_JsqJ43C8Y+QLZkeCg6bWzppLKzpyNxQa9BxfjyKyfBb90Sw@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

On Fri, Jan 18, 2019 at 11:57:12AM -0600, Rob Herring wrote:
> > > Including/inheriting another schema can be done with "allOf: [ {$ref:
> > > path/to/base/schema} ]". I'm currently using this for providers such
> > > as clock or reset providers and for buses. This works well for
> > > inheriting schemas which are collections of properties. See the GIC
> > > conversions to json-schema I posted for an example. The main issue
> > > with this approach that I've found is you have to list all the
> > > inherited properties to make them required or if you have
> > > 'addtionalProperties: false' (which is desirable IMO).
> > >
> > > If there's a lot of conditionals, there may not be much left common to
> > > inherit and we may just want to split each compatible into a separate
> > > doc. I'm also fine with leaving those constraints as comments or
> > > description for now. That's no worse than what we have today.
> > >
> > > Note that so far, all the $ref values pointing to other files get
> > > resolved to files in the yaml-bindings repo schemas. I don't think a
> > > ref from the kernel tree to the kernel tree works currently. I need to
> > > sort that out.
> >
> > Yeah, I've tried that already, and it indeed looks like it always try
> > to look them up on your github repo (or the local cache), but will not
> > try to locate it in the kernel tree.
> 
> Actually, this should already kind of work, but only if all schema
> files are used. IOW, it doesn't work if you limit the schema files
> setting DT_SCHEMA_FILES. A reference to '/schemas/foo/bar.yaml' will
> match 'Documentation/devicetree/bindings/foo/bar.yaml'.
> 
> I looked at trying to fix this, but at the point I need to load the
> reference I don't have the kernel source path, only the build path.
> The easiest fix would be to ignore (or only warn on) unresolved
> schemas, so we don't crash at least. Then you'd have to set
> DT_SCHEMA_FILES to the inherited schema if you wanted to validate with
> that.

So I gave it a try with the following patch:
http://code.bulix.org/k8yxtm-566934?raw

The output is:

$DIR/arch/arm/boot/dts/sun4i-a10-cubieboard.dt.yaml: Additional properties are not allowed ('target-supply', 'clocks' were unexpected)
$DIR/arch/arm/boot/dts/sun4i-a10-cubieboard.dt.yaml: compatible: ['allwinner,sun4i-a10-ahci'] is not valid under any of the given schemas

So it looks like it doesn't pick everything up, but yet if the number
of clocks is wrong, it's reported, which looks kind of weird since
compatible apparently doesn't match. Do you see any flaw with this?

Thanks!
Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
