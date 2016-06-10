From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 0/4] usb: musb: sunxi: Fixes + peripheral-only mode
Date: Fri, 10 Jun 2016 21:02:50 +0200
Message-ID: <1465585374-10213-1-git-send-email-hdegoede@redhat.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi All,

Here is v4 of my patch-set with a couple of fixed and peripheral-only
mode for the sunxi musb / otg-phy code.

The first patch changes a generic usb helper function, the next 2 patches
are phy patches and the last patch is a musb patch.

And all 4 patches depend on eachother. As such I believe it would be
best for these 4 patches to be merged directly in Greg's usb tree.

Kishon, Bin Liu, do you agree it would be best for Greg to merge these
4 directly ? This should not lead to any merge problems, the first patch
is a common usb code patch and such belongs in Greg's tree, the other 3
only touch sunxi files.

Kishon if you agree it is bes to have all 4 merged via Greg's usb tree,
can we have your Acked-by for the 2 phy patches ?

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
