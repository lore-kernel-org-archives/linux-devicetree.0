From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL] Mediatek: 32-bit DT update for v4.15
Date: Mon, 30 Oct 2017 13:42:58 +0100
Message-ID: <CAK8P3a3NWwoe0mX45WrFONyiHt9eWTTMziEc+rjqSfr5QZv8xQ@mail.gmail.com>
References: <c7145c00-b2b9-780c-0bfd-15f7d8a08dd6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c7145c00-b2b9-780c-0bfd-15f7d8a08dd6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Weiqing Kong <weiqing.kong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 23, 2017 at 12:06 AM, Matthias Brugger
<matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> ----------------------------------------------------------------
> - mt76233 add PCIe node

Could you clarify what the subnodes in the PCI node are for? It seems odd
to have "interrupt-map" properties in both the pcie controller and its child
nodes, and I want to ensure this is following the standard PCIe binding before
I pull it.

       Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
