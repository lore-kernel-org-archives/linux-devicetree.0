From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/3] mfd: allow mfd_cell association with device tree node
Date: Tue, 27 Sep 2011 19:14:20 +0100
Message-ID: <20110927181420.GQ4289@opensource.wolfsonmicro.com>
References: <20110921120148.4A81E9D401D@zog.reactivated.net>
 <20110921124936.GA25620@sirena.org.uk>
 <CAMLZHHQZnajC4e12MjaK3W8WcAB2ZB+6L=5kS5BBFZF=+YWicQ@mail.gmail.com>
 <20110921131637.GF4374@opensource.wolfsonmicro.com>
 <CAMLZHHTJaOddSj00g0-WpFQu6pUTqizKjKaQF9hLrhceEMhY1Q@mail.gmail.com>
 <20110927150555.GF20588@ponder.secretlab.ca>
 <CAMLZHHQU-eMAtvBQJj6+WrMjkWWA+ET=z5NdQCEgXxh=m10d3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMLZHHQU-eMAtvBQJj6+WrMjkWWA+ET=z5NdQCEgXxh=m10d3Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Drake <dsd@laptop.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, sameo@linux.intel.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, dilinger@queued.net
List-Id: devicetree@vger.kernel.org

On Tue, Sep 27, 2011 at 05:44:04PM +0100, Daniel Drake wrote:

> However, it does take Mark's suggestion into account that the mfd
> should have some clear representation in the device tree. For us it
> already did have (naturally), but this wasn't reflected in my earlier
> patch. It is now - the location of the vx855-gpio node is based on
> finding the mfd node and going from there.

Why not just kmemdup() the template you're using rather than modifying
it in place?
