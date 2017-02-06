From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: imx: Pass 'chosen' and 'memory' nodes
Date: Mon, 6 Feb 2017 09:05:26 -0200
Message-ID: <CAOMZO5BZ2=pvtscV4J52Tj8Gc3A-O5B4azzzQAr48mKJ_L8-tQ@mail.gmail.com>
References: <6d3e9733-bebc-4347-95db-2a1c9018948d@i2se.com> <13787b59-6bfc-d020-9853-ae37074009dc@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <13787b59-6bfc-d020-9853-ae37074009dc-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stefan,

On Mon, Feb 6, 2017 at 8:49 AM, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> wrote:

>> Btw are Arnd and Olof informed about this urgent patch?
>
> @Shawn
>
> Okay, 4.10-rc7 is out but this fix isn't applied :-(
>
> Is there a chance for 4.10 or do we have to wait for 4.10.1?
>
> Maybe the subject of the patch is to harmless.

The patch is in the arm-soc 'fixes' branch:
https://git.kernel.org/cgit/linux/kernel/git/arm/arm-soc.git/commit/?h=fixes&id=a971c5545c3d45a1e33fda6e57913bb75aaa20c9

Olof/Arnd,

Will this branch be sent to Linus so that it lands at 4.10 final?

Thanks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
