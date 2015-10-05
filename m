From: Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] QEMU fw_cfg DMA interface documentation
Date: Mon, 5 Oct 2015 11:11:15 +0100
Message-ID: <CAJSP0QXCM0SV5C6WxDhvrb-qgUUda2nJAQJN_makTke8o6HEAQ@mail.gmail.com>
References: <1443701677-13629-1-git-send-email-markmb@redhat.com>
	<1443701732-13696-1-git-send-email-markmb@redhat.com>
	<CAJSP0QVyTAK0zbpUGd_4-4tf=ao_T-j0YcsDuxu0SuR3VFq+2g@mail.gmail.com>
	<20151005120610.4a94ce83@markmb_rh>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151005120610.4a94ce83@markmb_rh>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Marc_Mar=C3=AD?= <markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Drew <drjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Kevin O'Connor <kevin-BG7uPxbsK//k1uMJSBkQmQ@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Laszlo <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 5, 2015 at 11:06 AM, Marc Mar=C3=AD <markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wro=
te:
> On Mon, 5 Oct 2015 09:20:55 +0100
> Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> On Thu, Oct 1, 2015 at 1:15 PM, Marc Mar=C3=AD <markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> w=
rote:
>> > +Additionaly, if the DMA interface is available then a read to the
>> > DMA Address +will return 0x51454d5520434647 ("QEMU CFG" in
>> > big-endian format).
>>
>> What does this mean?
>>
>
> https://www.mail-archive.com/qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org/msg325546.html
>
> Proposed by Kevin O'Connor in v3.
>
> (I could not find this thread in gnu.org or gmane archives. It's
> strange).

The following is clearer to me:

If the DMA interface is available, then reading the DMA Address
Register returns 0x51454d5520434647 ("QEMU CFG" in big-endian format).

Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
