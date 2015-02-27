From: Luca Coelho <luca-XPOmlcxoEMv1KXRcyAk9cg@public.gmane.org>
Subject: Re: [PATCH v2] wlcore: add basic device-tree support
Date: Fri, 27 Feb 2015 09:31:30 +0200
Message-ID: <1425022290.11202.1.camel@coelho.fi>
References: <1423998550-8829-1-git-send-email-eliad@wizery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423998550-8829-1-git-send-email-eliad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eliad Peller <eliad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ido Yariv <ido-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, 2015-02-15 at 13:09 +0200, Eliad Peller wrote:
> When running with device-tree, we no longer have a board file
> that can set up the platform data for wlcore.
> Allow this data to be passed from DT.
> 
> For now, parse only the irq used. Other (optional) properties
> can be added later on.
> 
> Signed-off-by: Ido Yariv <ido-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Eliad Peller <eliad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
> ---

I don't really care much, but why not just finalize the work I did a
couple of years ago?

http://mid.gmane.org/1375189476-21557-1-git-send-email-coelho-l0cyMroinI0@public.gmane.org
http://mid.gmane.org/1375215668-29171-1-git-send-email-coelho-l0cyMroinI0@public.gmane.org

IIRC there were just some minor comments there, but I never really got
to it because I left TI.

--
Luca.

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
