From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: How to parse delete-property annotations
Date: Mon, 05 Oct 2015 16:52:42 -0700
Message-ID: <56130D4A.40602@gmail.com>
References: <jwvzj05s842.fsf-monnier+INBOX@gnu.org>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <jwvzj05s842.fsf-monnier+INBOX-mXXj517/zsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Monnier <monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 9/29/2015 5:54 AM, Stefan Monnier wrote:
> [ In the context of Emacs's dts-mode (http://elpa.gnu.org/packages/dts-mode). ]
> 
> I recently came across the following piece of DTS code:
> 
>    &usbphy {
>         /* Unset otg detect pins as we force dr_mode */
>         /delete-property/ usb0_id_det-gpio;
>         /delete-property/ usb0_vbus_det-gpio;
>    };
> 
> and was wondering how dts-mode should understand this.  `dts-mode'
> doesn't try to understand the actual *meaning* of such code, but it does
> try to understand the syntax (i.e. how the abstract-syntax-tree would
> look like).
> 
> Is "/delete-property/" is special syntax in itself, or is it a special
> case of a more general syntax (like "/.../ blabla;")?  Where exactly is
> it allowed to appear?
> Could someone point me to some documentation explaining/describing this syntax?
> 
> 
>         Stefan

The best documentation that I know of for this is the lexer
source at:

   https://git.kernel.org/cgit/utils/dtc/dtc.git/tree/dtc-lexer.l

The lexer detects tokens for "/delete-property/" and "/delete-node/"
at lines 128 - 140.

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
