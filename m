From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: lager: Add CEC clock for HDMI transmitter
Date: Thu, 11 Jan 2018 16:51:00 +0100
Message-ID: <20180111155100.7auiku2v2npfdbwp@verge.net.au>
References: <20180109164904.24523-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180109164904.24523-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 09, 2018 at 05:49:04PM +0100, Niklas Söderlund wrote:
> The adv7511 on the Lager board has a 12 MHz fixed clock
> for the CEC block. Specify this in the dts to enable CEC support.
> 
> Based on a similar patch for Koelsch by Hans Verkuil.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, applied.
