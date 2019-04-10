Return-Path: <SRS0=PIpc=SM=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40676 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbfDJJkB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 10 Apr 2019 05:40:01 -0400
Date: Wed, 10 Apr 2019 11:39:57 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 06/11] ARM: dts: r8a77470: Add Audio support
Message-ID: <20190410093957.6xpdpsxboaic7wlt@verge.net.au>
References: <1554799912-24764-1-git-send-email-cv-dong@jinso.co.jp>
 <1554799912-24764-7-git-send-email-cv-dong@jinso.co.jp>
 <87o95e7lmp.wl-kuninori.morimoto.gx@renesas.com>
 <73ad4c10-ed8e-7fdc-1c68-837786cfaf6d@jinso.co.jp>
 <87imvm7jup.wl-kuninori.morimoto.gx@renesas.com>
 <d5a96c31-aec4-9752-26fd-e3d878e028a2@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5a96c31-aec4-9752-26fd-e3d878e028a2@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: Cao Van Dong <cv-dong@jinso.co.jp>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, devicetree@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

On Wed, Apr 10, 2019 at 10:33:57AM +0900, Cao Van Dong wrote:
> Dear Morimoto-san,
> 
> On 2019/04/10 10:16, Kuninori Morimoto wrote:
> > Hi Cao-san
> > 
> > > > BTW, this patch-set is including SoC only.
> > > > Do you have plan to post board support patch after this ?
> > > > In other words, did you test these ?
> > > Thanks for your feedback and help!
> > > I will create a separate patch (add
> > > rcar_sound-r8a77470toDocumentation/../sound/renesas,rsnd.txt)
> > > and update this patch in version 2.
> > Again, are these tested code ?
> > If not, please indicate such information at git-log.
> > Otherwise, people will think that these are well tested upsteam code.
> Sorry for missing the question!
> I will add information to the patch in version 2.

In general I would prefer that patches that can be tested,
f.e. using accompanying board dts, are tested before including them
upstream.
