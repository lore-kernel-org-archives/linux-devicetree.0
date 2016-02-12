From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 0/4] mailbox: mailbox-test: support single channel with
 separate Tx and Rx buffer
Date: Fri, 12 Feb 2016 09:17:18 +0000
Message-ID: <20160212091718.GT20693@x1>
References: <1455210808-29395-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455210808-29395-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 11 Feb 2016, Sudeep Holla wrote:

> Hi Lee, Jassi,
>=20
> Assuming mailbox-test was designed to be generic, I am trying to exte=
nd
> it to support single channel with separate Tx and Rx buffer. With the=
se
> changes I am able to test arm_mhu driver. However I couldn't understa=
nd
> the intention of converting buffer to ASCII hex dump in read method.
> I have a local change to remove that so that it can deal with any dat=
a
> in any format(e.g. some protocol format)=20

Not sure quite what you mean.  Hexdump can handle any data?  If the
hex value read isn't an ASCII value, a '.' is printed on the right
hand side.  What data are you expecting that you can't analyse with
hexdump?

> and userspace can deal with the
> actual interpretation of the data. Let me know your thoughts on that.
>=20
> Regards,
> Sudeep
>=20
> Sudeep Holla (4):
>   mailbox: mailbox-test: rename driver as generic test driver
>   mailbox: mailbox-test: fix the compatible string
>   mailbox: mailbox-test: use print_hex_dump_bytes to allow dynamic
>     printk
>   mailbox: mailbox-test: add support for separate tx/rx buffer with
>     single channel
>=20
>  .../devicetree/bindings/mailbox/sti-mailbox.txt    |  2 +-
>  drivers/mailbox/mailbox-test.c                     | 50 ++++++++++++=
----------
>  2 files changed, 29 insertions(+), 23 deletions(-)
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
