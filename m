From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 12/12] staging: typec: tcpci: move tcpci driver out of
 staging
Date: Tue, 26 Sep 2017 08:57:49 +0200
Message-ID: <20170926065749.GE6250@kroah.com>
References: <1506386727-16370-1-git-send-email-jun.li@nxp.com>
 <1506386727-16370-13-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1506386727-16370-13-git-send-email-jun.li-3arQi8VN3Tc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
Cc: linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org, peter.chen-3arQi8VN3Tc@public.gmane.org, aisheng.dong-3arQi8VN3Tc@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 26, 2017 at 08:45:27AM +0800, Li Jun wrote:
> Move TCPCI(Typec port controller interface) driver out of staging.
> 
> Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
> ---
>  drivers/staging/Kconfig        |   2 -
>  drivers/staging/Makefile       |   1 -
>  drivers/staging/typec/Kconfig  |  14 -
>  drivers/staging/typec/Makefile |   1 -
>  drivers/staging/typec/TODO     |   5 -
>  drivers/staging/typec/tcpci.c  | 637 -----------------------------------------
>  drivers/staging/typec/tcpci.h  | 133 ---------
>  drivers/usb/typec/Kconfig      |   7 +
>  drivers/usb/typec/Makefile     |   1 +
>  drivers/usb/typec/tcpci.c      | 637 +++++++++++++++++++++++++++++++++++++++++
>  drivers/usb/typec/tcpci.h      | 133 +++++++++
>  11 files changed, 778 insertions(+), 793 deletions(-)


Creating patches like this with "-M" to git format-patch is nice, that
way we see the rename as just a rename, and not a big delete/add patch.

Can you do that instead and resend this series?

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
