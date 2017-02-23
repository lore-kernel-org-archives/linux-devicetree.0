From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: BCM953012HR: Initial Checkin
Date: Thu, 23 Feb 2017 14:58:18 +0100
Message-ID: <CACna6rwYhM9_5_V+sdczMWoMjcLg7wh_MEJZthCBsj6hH0dQrw@mail.gmail.com>
References: <1487798092-8631-1-git-send-email-steven.lin1@broadcom.com>
 <68373798-376d-43d9-85cb-c6af7c6fa302@gmail.com> <CA+Jmh7Ha0CTmTQnexz7oga2m54paKxbqZ+yF5orbEH72Ffi3Ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+Jmh7Ha0CTmTQnexz7oga2m54paKxbqZ+yF5orbEH72Ffi3Ag-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Lin <steven.lin1-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 23 February 2017 at 14:38, Steve Lin <steven.lin1-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> * Resending in plaintext - forgot to disable html in my mail client -
> apologies if you receive 2 copies *
>
> Rafal & Rob,
>
> I will spin a v2 with the cleanups Rob suggested and the uart/nand
> changes Rafal suggested.  Thanks!
>
> Rafal, to answer your question about having similar partitions on both
> flash devices, that is something that I believe we do on our reference
> platforms to demonstrate to customers using either flash for storing
> their kernel image, rootfs, etc.  See for example bcm958625k.dts where
> we also have similar partition names for nand and spi flash.

OK, thanks!

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
