From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/8] tpm: block messages while suspended
Date: Fri, 14 Jun 2019 11:12:36 -0700
Message-ID: <5d03e394.1c69fb81.f028c.bffb@mx.google.com>
References: <20190613180931.65445-1-swboyd@chromium.org> <20190613180931.65445-2-swboyd@chromium.org> <20190613232613.GH22901@ziepe.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613232613.GH22901@ziepe.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Andrey Pronin <apronin@chromium.org>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-integrity@vger.kernel.org, devicetree@vger.kernel.org, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>
List-Id: devicetree@vger.kernel.org

Quoting Jason Gunthorpe (2019-06-13 16:26:13)
> On Thu, Jun 13, 2019 at 11:09:24AM -0700, Stephen Boyd wrote:
> > From: Andrey Pronin <apronin@chromium.org>
> >=20
> > Other drivers or userspace may initiate sending a message to the tpm
> > while the device itself and the controller of the bus it is on are
> > suspended. That may break the bus driver logic.
> > Block sending messages while the device is suspended.
> >=20
> > Signed-off-by: Andrey Pronin <apronin@chromium.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> >=20
> > I don't think this was ever posted before.
>=20
> Use a real lock.
>=20

To make sure the bit is tested under a lock so that suspend/resume can't
update the bit in parallel?
