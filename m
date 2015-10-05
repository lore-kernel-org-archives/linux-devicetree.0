From: Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] QEMU fw_cfg DMA interface documentation
Date: Mon, 5 Oct 2015 09:20:55 +0100
Message-ID: <CAJSP0QVyTAK0zbpUGd_4-4tf=ao_T-j0YcsDuxu0SuR3VFq+2g@mail.gmail.com>
References: <1443701677-13629-1-git-send-email-markmb@redhat.com>
	<1443701732-13696-1-git-send-email-markmb@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443701732-13696-1-git-send-email-markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Marc_Mar=C3=AD?= <markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Drew <drjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Kevin O'Connor <kevin-BG7uPxbsK//k1uMJSBkQmQ@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Laszlo <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 1, 2015 at 1:15 PM, Marc Mar=C3=AD <markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrot=
e:
> +Additionaly, if the DMA interface is available then a read to the DM=
A Address
> +will return 0x51454d5520434647 ("QEMU CFG" in big-endian format).

What does this mean?

Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
