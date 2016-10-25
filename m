From: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH/RFT v2 03/17] ARM: davinci: da8xx: Add USB PHY platform declaration
Date: Tue, 25 Oct 2016 11:37:40 +0200
Message-ID: <CAKXjFTPyxYLbPaOr8LPU8zRAqVYbVUSRyB0cj9vrA79cqEHocA@mail.gmail.com>
References: <20161024164634.4330-1-ahaslam@baylibre.com> <20161024164634.4330-4-ahaslam@baylibre.com>
 <4129f1be-42f6-f182-c8a2-84befe01d298@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4129f1be-42f6-f182-c8a2-84befe01d298-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sergei Shtylyov <sshtylyov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 25, 2016 at 11:18 AM, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org> wrote:
> On Monday 24 October 2016 10:16 PM, ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org wrote:
>> +static struct platform_device da8xx_usb_phy = {
>> +     .name           = "da8xx-usb-phy",
>> +     .id             = 0,
>
> There is a single phy control in the system for both 1.1 and 2.0 PHYs.
> so this can be a singular device (id -1).
>

Ok.

> Thanks,
> Sekhar
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
