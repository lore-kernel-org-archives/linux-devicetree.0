Return-Path: <SRS0=1b9y=CE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC142C433E1
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Aug 2020 00:40:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1E8420737
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Aug 2020 00:40:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="F2FHh4Zi";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="zu6N0Nk/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgHZAkj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Aug 2020 20:40:39 -0400
Received: from pb-smtp21.pobox.com ([173.228.157.53]:54535 "EHLO
        pb-smtp21.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbgHZAkh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Aug 2020 20:40:37 -0400
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 83A82E60B4;
        Tue, 25 Aug 2020 20:40:34 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=R38hy58NZguIzIB9enm7bZvIUNQ=; b=F2FHh4
        Zix2x8/ePEPoiQ4+VAfaBmBf7Dt0gCB7u7LX4hDqrgSDXeKWPcDBDGLZQ9BI5fg8
        oGyvmV2iacqbOCIO2/dZX9X37NovyS1VZYGFJevrn1N9PRKA6ys9Qw7ZjS2S2+h6
        JwDnC9EJB49UUHlxlzGgDYZD/tkaH+O0bdpVE=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 73CA6E60B3;
        Tue, 25 Aug 2020 20:40:34 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=TjNHRHC5qBTiwlE/Aup4dYhZf5RtZhcLykydKNMKpsQ=; b=zu6N0Nk/ZK5kpOdkNXcautMvx2kRiXGoYjlOuiUndwL5SJBR+rX6/mLCh8nZ8OkEikaEfPmubmLyI7ZVXSueo/v/pns8+Jt2tWO2W27c/QWRpPS0P8Bb1OWrpv1kbs97Jmj438LelsCsqfqBwI6fDYS9TIzfuOz4ndRxJv1F9is=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 9D191E60AF;
        Tue, 25 Aug 2020 20:40:31 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id C91A12DA0521;
        Tue, 25 Aug 2020 20:40:29 -0400 (EDT)
Date:   Tue, 25 Aug 2020 20:40:29 -0400 (EDT)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Rob Herring <robh@kernel.org>
cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
        Laura Nixon <laura.nixon@team.mipi.org>,
        Robert Gough <robert.gough@intel.com>,
        Matthew Schnoor <matthew.schnoor@intel.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: MIPI I3C Host Controller
 Interface
In-Reply-To: <CAL_JsqKJByNNwgP34_=G3bdVaZiM1OCUY94N1pTRzgNvqHjcWw@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.78.906.2008252015280.1479@knanqh.ubzr>
References: <20200819031723.1398378-1-nico@fluxnic.net> <20200819031723.1398378-2-nico@fluxnic.net> <20200825212932.GA1360264@bogus> <nycvar.YSQ.7.78.906.2008251732430.1479@knanqh.ubzr> <CAL_JsqKJByNNwgP34_=G3bdVaZiM1OCUY94N1pTRzgNvqHjcWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: BEF9EDF6-E734-11EA-9B56-843F439F7C89-78420484!pb-smtp21.pobox.com
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 25 Aug 2020, Rob Herring wrote:

> On Tue, Aug 25, 2020 at 4:02 PM Nicolas Pitre <nico@fluxnic.net> wrote:
> 
> > Currently there are very few implementations. One of them lives in an
> > FPGA and the example below is actually the DT entry I use for it. I'm
> > guessing specific vendor implementations will have their own tweaks
> > eventually, such as clock sources and whatnot.
> 
> Yes, exactly. And bugs too.

Obviously.  ;-)

> > But that is outside of
> > the spec (actually the spec defines a register area for eventual vendor
> > specific usage). But I have no visibility into that and of course the
> > code has no provision for that yet either.
> >
> > So I imagine there will be something like this in dts files eventually:
> >
> >         compatibvle = "intel,foobar_soc_i3c_hci", "mipi-i3c-hci";
> >
> > Is that what you mean?
> 
> Yes. Even your FPGA is tied to some implementation...

It is, but so far it's self-discoverable.

> > > Also, which version of the spec does this compatible correspond to?
> >
> > All of them.
> >
> > > Or are there not HCI differences in the spec versions you mention in
> > > the cover letter?
> >
> > The hardware is self advertising per the spec. So there is no need to
> > carry such distinction in the DT compatible. Even vendor extensions are
> > tagged with MIPI vendor IDs in the hardware directly.
> 
> Oh good, folks are learning. :)
> 
> Is the vendor ID (and revision) discoverable even if no vendor
> extensions?

Yes. It's even in the very first 32-bit word from the register space. 
Here's the relevant code:

#define HCI_VERSION                     0x00    /* HCI Version (in BCD) */

[...]

        /* Validate HCI hardware version */
        regval = reg_read(HCI_VERSION);
        hci->version_major = (regval >> 8) & 0xf;
        hci->version_minor = (regval >> 4) & 0xf;
        hci->revision = regval & 0xf;
        NOTE("HCI v%u.%u r%02u",
             hci->version_major, hci->version_minor, hci->revision);
        /* known versions */
        switch (regval & ~0xf) {
        case 0x100:     /* version 1.0 */
        case 0x110:     /* version 1.1 */
        case 0x200:     /* version 2.0 */
                break;
        default:
                ERR("unsupported HCI version");
                return -EPROTONOSUPPORT;
        }

Then there is a register that provides the relative offset to another 
register area where "extended attributes" are to be found. Those 
attributes are also spec defined. One of the standard attributes 
contains the MIPI vendor ID, the vendor version ID and vendor product 
ID. And then there is a range of attributes which are vendor defined. 
That's where specific stuff like fancy clock controls would be located 
and vendor specific tweaks to be applied. But so far 
everything can be predicated on hardware-provided data.

> If so, then I'm more comfortable with "mipi-i3c-hci" on it's own. The 
> exception will be if there's setup needed to discover the h/w which 
> seems likely. In that case, we should probably do compatible strings 
> based on VID/PID like PCI, USB, etc. No need to define that now I 
> guess, but please add some sort of summary of the above about the 
> discoverability of the HCI implementer and features.

OK.


Nicolas
