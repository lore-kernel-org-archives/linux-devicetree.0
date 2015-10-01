From: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Qemu-devel] QEMU fw_cfg DMA interface
Date: Thu, 1 Oct 2015 18:17:02 +0200
Message-ID: <560D5C7E.8080900@redhat.com>
References: <1443701677-13629-1-git-send-email-markmb@redhat.com>
 <560D5945.5050700@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <560D5945.5050700-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?Marc_Mar=c3=ad?= <markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, seabios-VcxPKcuBGKdAfugRpC6u6w@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Drew <drjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, Kevin O'Connor <kevin-BG7uPxbsK//k1uMJSBkQmQ@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/01/15 18:03, Eric Blake wrote:
> [meta-comment]
>=20
> On 10/01/2015 06:14 AM, Marc Mar=C3=AD wrote:
>> Implementation of the FW CFG DMA interface.
>=20
> The subject line is missing "v4" and "0/7". Also, the cover letter is
> missing a diffstat.  That makes it harder to see from the cover lette=
r
> what the rest of the series is about.  'git format-patch/send-email
> --cover-letter' does what you want; you can even 'git config
> format.coverletter=3Dauto' to always include a decent cover letter on=
 any
> multi-patch series.
>=20

This posting follows a little bit different pattern, one that I myself
follow when posting patches for two (or more) components that must work
in sync.

Usually, a top-level blurb is manually cross-posted to all relevant
mailing lists. Then, each separate patch series is posted only to the
relevant mailing list, with its own cover letter (as usual with git),
*in response* to the manually posted blurb.

This has the following benefits:

- in mailing list archives that organize messages into threads *across*
  mailing lists (like Gmane does, for example), the top-level manual
  blurb is a good "root" for referencing the entire posting.

- The same is true for personal mailboxes, if a recipient is explicitly
  CC'd on all of the messages.

Because the top level blurb is parent to several patch series, and thos=
e
child series can all have different version numbers (due to different
numbers of respinds), it is not always straightforward to assign a
version number to the top blurb.

Thanks
Laszlo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
