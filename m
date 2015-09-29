From: Stefan Monnier <monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org>
Subject: How to parse delete-property annotations
Date: Tue, 29 Sep 2015 08:54:13 -0400
Message-ID: <jwvzj05s842.fsf-monnier+INBOX@gnu.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

[ In the context of Emacs's dts-mode (http://elpa.gnu.org/packages/dts-mode). ]

I recently came across the following piece of DTS code:

   &usbphy {
        /* Unset otg detect pins as we force dr_mode */
        /delete-property/ usb0_id_det-gpio;
        /delete-property/ usb0_vbus_det-gpio;
   };

and was wondering how dts-mode should understand this.  `dts-mode'
doesn't try to understand the actual *meaning* of such code, but it does
try to understand the syntax (i.e. how the abstract-syntax-tree would
look like).

Is "/delete-property/" is special syntax in itself, or is it a special
case of a more general syntax (like "/.../ blabla;")?  Where exactly is
it allowed to appear?
Could someone point me to some documentation explaining/describing this syntax?


        Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
