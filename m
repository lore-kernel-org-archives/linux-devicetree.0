From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/2][v2] powerpc/fsl-booke: Add initial T1040/T1042 RDB
 board support
Date: Thu, 31 Jul 2014 13:14:00 -0500
Message-ID: <1406830440.29414.331.camel@snotra.buserror.net>
References: <1406801749-3561-1-git-send-email-Priyanka.Jain@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406801749-3561-1-git-send-email-Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlYI+954vlgkHg@public.gmane.org, Poonam Aggrwal <poonam.aggrwal-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Prabhakar Kushwaha <prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2014-07-31 at 15:45 +0530, Priyanka Jain wrote:
> T1040/T1042RDB is Freescale Reference Design Board.
> The board can support both T1040/T1042 QorIQ Power Architecture=E2=84=
=A2 processor.

Please resubmit to the proper list address (lists.ozlabs.org, not
lists.ozlab.org).

You should have gotten a bounce message, yet that didn't prompt you to
resubmit?

> ---
>  Changes for v2: Incorporated Scott comments on using common name
>  for compatible string for cpld as register set is same

Is it just the same register set, or the same exact logic and board
connections?

If the former, you should use the actual board name -- but do it in the
board-specific dts file, not the dtsi that is shared by all three
boards.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
