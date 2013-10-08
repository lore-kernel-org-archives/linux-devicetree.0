From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v2 0/2] ARM: Dove: Add audio to the DT
Date: Tue, 8 Oct 2013 13:54:23 -0400
Message-ID: <20131008175423.GT5402@titan.lakedaemon.net>
References: <20131008194055.00fc93c2@armhf>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131008194055.00fc93c2@armhf>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Jean-Francois,

On Tue, Oct 08, 2013 at 07:40:55PM +0200, Jean-Francois Moine wrote:
> This patch series adds audio DT to the Dove boards and activates the
> Cubox audio device.
> 
> Full audio in the Cubox will work when the DT extension of the generic
> simple audio card will be complete.
> 
> v2:
> - dove.dtsi: change the audio controller compatible string to
> 	"marvell,dove-audio" (Thomas Petazzoni)
> - dove-cubox: add the external clock (Sebastian Hesselbarth)

Thanks for turning this around so quickly.  Sebastian, if I could get
your Acked-by on this series, I'll pull it in.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
