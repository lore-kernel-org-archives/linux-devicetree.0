From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 0/6] *** Add support for wifi QMI client handshakes ***
Date: Mon, 8 Oct 2018 17:36:30 -0700
Message-ID: <20181009003628.GA253926@ban.mtv.corp.google.com>
References: <20180815092637.11455-1-govinds@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180815092637.11455-1-govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, niklas.cassel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

+ linux-msm

Hi Govind, Kalle,

On Wed, Aug 15, 2018 at 02:56:31PM +0530, Govind Singh wrote:
> Add QMI client handshakes for Q6 integrated WLAN connectivity subsystem.
> This module is responsible for communicating WLAN control messages to FW
> over QMI interface. This patch series enables the qmi handshakes required for
> WCN3990 chipset.
[...]

What's the status of this patchset? It has seen various stages of
review, and except for the fact that Govind seems to have dropped
various Reviewed-by/Acked-by tags (which Rob noticed), I don't see any
relevant feedback that should be blocking it.

I previously had concerns about the firmware boot sequence -- that it
required a Qualcomm-specific TFTP service over QRTR, which had no open
source implementations. There is now a published daemon that worked for
me [1], as well as firmware releases that loaded modem and Wifi firmware
together, such that this TFTP service is not needed at all. So my
concerns there are no longer blocking.

And I think Rob already reviewed the relevant DT bindings (but again,
Govind missed collecting that tag for this series).

So the only outstanding request I see is to collect the appropriate
tags. Should Govind resend the whole series just for that?

FWIW, I've been using this series for a while now, and I reviewed
earlier versions. I can provide this for the whole series:

Reviewed-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

If nothing else, I think it's important to get someone to merge the DT
bindings from this series, because Govind is now trying to extend the DT
binding and to enable the WCN3990 device node in the SDM845 device tree
nodes.

Regards,
Brian

[1] https://github.com/andersson/tqftpserv
[2] See this series:
    https://patchwork.kernel.org/cover/10621863/
    Govind didn't send it to the right mailing lists yet, but we're
    close...
