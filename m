From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v3 2/2] ARM: Dove: Add the audio device to the Cubox DT
Date: Wed, 9 Oct 2013 09:21:49 -0400
Message-ID: <20131009132149.GA5402@titan.lakedaemon.net>
References: <20131008194232.7d74b9e6@armhf>
 <525448DE.5030004@gmail.com>
 <20131008181647.GW5402@titan.lakedaemon.net>
 <20131008205617.079142b6@armhf>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131008205617.079142b6@armhf>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 08, 2013 at 08:56:17PM +0200, Jean-Francois Moine wrote:
> This patch activates the audio device of the Cubox.
> 
> The audio flow (pin mpp_audio1) is output on both I2S and S/PDIF.
> 
> The third si5351 clock (#2, pin mpp13) is used as the external clock.
> 
> Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
> ---
> Jason,
> 
> this patch replaces the previous patch v2 2/2
> 
> v3:
> - move the pins declaration to dove.dtsi (Sebastian Hesselbarth)
> ---
>  arch/arm/boot/dts/dove.dtsi      | 10 ++++++++++
>  arch/arm/boot/dts/dove-cubox.dts |  8 ++++++++
>  2 files changed, 18 insertions(+)

Applied to mvebu/dt with Sebastian's Ack

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
