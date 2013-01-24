From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] USB: misc: usb3503: add dt support
Date: Thu, 24 Jan 2013 14:03:03 -0800
Message-ID: <20130124220303.GA30869@kroah.com>
References: <1358963242-2596-1-git-send-email-tobetter@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1358963242-2596-1-git-send-email-tobetter@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Dongjin Kim <tobetter@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Fengguang Wu <fengguang.wu@intel.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 24, 2013 at 02:47:10AM +0900, Dongjin Kim wrote:
> Added device tree support for usb3503 driver and add new document wit=
h device tree binding information.
>=20
> Signed-off-by: Dongjin Kim <tobetter@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/usb3503.txt |   20 +++++++++++=
++
>  drivers/usb/misc/usb3503.c                        |   31 +++++++++++=
++++++----
>  2 files changed, 46 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/usb3503.txt

I've applied this, but now we have the compiler warning:
drivers/usb/misc/usb3503.c: In function =E2=80=98usb3503_probe=E2=80=99=
:
drivers/usb/misc/usb3503.c:215:13: warning: =E2=80=98mode=E2=80=99 may =
be used uninitialized in this function [-Wuninitialized]

Please send a follow-on patch to fix this up.

greg k-h
