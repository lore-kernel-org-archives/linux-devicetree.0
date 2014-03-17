From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: dts: exynos: added mailbox node
Date: Mon, 17 Mar 2014 13:15:35 +0100
Message-ID: <5346848.pBsh8NcQja@wuerfel>
References: <1395057839-23871-1-git-send-email-ks.giri@samsung.com> <1395057839-23871-3-git-send-email-ks.giri@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395057839-23871-3-git-send-email-ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Girish K S <ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, s-anna-l0cyMroinI0@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ilho215.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 17 March 2014 17:33:59 Girish K S wrote:
> +Samsung Mailbox Driver
> +
> +Required properties:
> +- compatible:          Should be one of the following,
> +                           "samsung,gh7-mailbox" for
> +                               Samsung GH7 SoC series
> +                           "samsung,exynos-mailbox" for
> +                               exynosx SoC series
> +- reg:                 Contains the mailbox register address range (base address
> +                       and length)
> +- interrupts:          Contains the interrupt information for the mailbox
> +                       device.
> +- samsung,mbox-names:  Array of the names of the mailboxes
> 

I think we should not allow new mailbox drivers that don't conform to
the framework that is currently under discussion. In particular, this
means don't do a "samsung,mbox-names" property. The current consensus
seems to be to have a #mbox-cells" property that allows to pass extra
parameters from the client driver, and uses an "mboxes" property
to reference the mailbox provided.

It would be good if you follow up for the subsystem discussion and
ensure it gets merged in time, and supports all the use cases you are
interested in. The interface is not entirely nailed down yet, so
it's a good time to contribute. However, I can already promise that
it won't use matching by strings.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
