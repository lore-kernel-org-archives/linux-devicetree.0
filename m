From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC/PATCH] net: ethernet: nixge: Use of_get_mac_address()
Date: Tue, 1 May 2018 10:05:12 -0500
Message-ID: <20180501150512.GA21443@rob-hp-laptop>
References: <20180426215742.18966-1-mdf@kernel.org>
 <20180426220401.bad53hxnkxwvgjot@derp-derp.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180426220401.bad53hxnkxwvgjot@derp-derp.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <mdf@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, davem@davemloft.net, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

On Thu, Apr 26, 2018 at 03:04:01PM -0700, Moritz Fischer wrote:
> On Thu, Apr 26, 2018 at 02:57:42PM -0700, Moritz Fischer wrote:
> > Make nixge driver work with 'mac-address' property instead of
> > 'address' property. There are currently no in-tree users and
> > the only users of this driver are devices that use overlays
> > we control to instantiate the device together with the corresponding
> > FPGA images.
> > 
> > Signed-off-by: Moritz Fischer <mdf@kernel.org>
> > ---
> > 
> > Hi David, Rob,
> > 
> > with Mike's change that enable the generic 'mac-address'
> > binding that I barely missed with the submission of this
> > driver I was wondering if we can still change the binding.
> > 
> > I'm aware that this generally is a nonono case, since the binding
> > is considered API, but since there are no users outside of our
> > devicetree overlays that we ship with our devices I thought I'd ask.

Fine by me. It really comes down to whether there are any users that 
would be impacted.

Rob
