From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [4/5] IBM Akebono: Add the Akebono platform
Date: Fri, 05 Sep 2014 00:29:36 +0200
Message-ID: <1409869776.5546.123.camel@x220>
References: <1394077948-8395-5-git-send-email-alistair@popple.id.au>
	 <1398936447.4121.12.camel@x220> <10214508.Vq3Ynjy2Co@mexican>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <10214508.Vq3Ynjy2Co@mexican>
Sender: linux-kernel-owner@vger.kernel.org
To: Alistair Popple <alistair@popple.id.au>
Cc: benh@kernel.crashing.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Alistair,

On Fri, 2014-05-02 at 10:35 +1000, Alistair Popple wrote:
> On Thu, 1 May 2014 11:27:27 Paul Bolle wrote:
> > On Thu, 2014-03-06 at 14:52 +1100, Alistair Popple wrote:
> > > This patch adds support for the IBM Akebono board.
> > > +	select IBM_EMAC_RGMII_WOL
> > 
> > The patch that added this symbol (and the related driver) was submitted
> > in https://lkml.org/lkml/2014/2/21/25 . It's not (yet) included in
> > linux-next. Is it queued somewhere else?
> 
> To be honest I'm not sure. I will follow this up on the netdev list.

I noticed that this symbol (and its driver) are still not in v3.17-rc3
nor in next-20140904. Any update on this?

Thanks,


Paul Bolle
