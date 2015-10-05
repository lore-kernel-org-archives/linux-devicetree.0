From: Marc =?UTF-8?B?TWFyw60=?= <markmb@redhat.com>
Subject: Re: [PATCH v4] QEMU fw_cfg DMA interface documentation
Date: Mon, 5 Oct 2015 12:06:10 +0200
Message-ID: <20151005120610.4a94ce83@markmb_rh>
References: <1443701677-13629-1-git-send-email-markmb@redhat.com>
	<1443701732-13696-1-git-send-email-markmb@redhat.com>
	<CAJSP0QVyTAK0zbpUGd_4-4tf=ao_T-j0YcsDuxu0SuR3VFq+2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJSP0QVyTAK0zbpUGd_4-4tf=ao_T-j0YcsDuxu0SuR3VFq+2g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Drew <drjones@redhat.com>, Kevin O'Connor <kevin@koconnor.net>, Gerd Hoffmann <kraxel@redhat.com>, Laszlo <lersek@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <rob.herring@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Graf <agraf@suse.de>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 5 Oct 2015 09:20:55 +0100
Stefan Hajnoczi <stefanha@gmail.com> wrote:

> On Thu, Oct 1, 2015 at 1:15 PM, Marc Mar=C3=AD <markmb@redhat.com> wr=
ote:
> > +Additionaly, if the DMA interface is available then a read to the
> > DMA Address +will return 0x51454d5520434647 ("QEMU CFG" in
> > big-endian format).
>=20
> What does this mean?
>

https://www.mail-archive.com/qemu-devel@nongnu.org/msg325546.html

Proposed by Kevin O'Connor in v3.

(I could not find this thread in gnu.org or gmane archives. It's
strange).

Thanks
Marc
