From: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] brcmfmac: Add brcm,nvram_file_name dt property
Date: Wed, 29 Jun 2016 16:42:32 +0200
Message-ID: <CAOiHx=n6itfmvwYQh+jUSDNguQFkos=MzjkDWP=GsupdgvF6KQ@mail.gmail.com>
References: <1467209074-15634-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467209074-15634-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "John W . Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 29 June 2016 at 16:04, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Add a brcm,nvram_file_name dt property to allow overruling the default
> nvram filename for sdio devices. The idea is that we can specify a
> board specific nvram file, e.g. brcmfmac43362-ap6210.txt for boards
> with an ap6210 wifi sdio module and ship this in linux-firmware, so
> that wifi will work out of the box, without requiring users to find
> and then manually install the right nvram file for their board.

Directly defining a filename doesn't seem like a good OS-agnostic
approach. Maybe an alternative would be to add a model-property to the
nodes (this is allowed) and make brcmfmac to request
"FWFILENAME-<model>" as firmware if set? That would leave it to the OS
on how the filename is set.


Regards
Jonas
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
