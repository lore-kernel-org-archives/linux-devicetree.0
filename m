From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] at91: 3.4-rc1 fixes
Date: Thu, 5 Apr 2012 10:44:13 -0700
Message-ID: <CAOesGMiEBBiZ1Q3RjT=KxCR+kJWhoVPGdMRFPN=nObjZuvzgWg@mail.gmail.com>
References: <4F7C7EDF.4000702@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4F7C7EDF.4000702@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel list <linux-kernel@vger.kernel.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Ludovic Desroches <ludovic.desroches@atmel.com>, linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 4, 2012 at 10:03 AM, Nicolas Ferre <nicolas.ferre@atmel.com=
> wrote:
> Arnd, Olof,
>
> I would like you to integrate this fist batch of AT91 related fixes. =
They
> are covering DT and USB related issues that we have seen on top of 3.=
4-rc1.
>
> I have also included modifications of the OHCI USB driver because the=
y
> are also touching the core AT91 devices/board files and Device Tree f=
iles.
> The modification of "vbus_pin_active_low" in particular cannot be sep=
arated
> from the modification of .dts[i] and devices/board files.
>
> Alan Stern for USB OHCI/EHCI and Grant Likely for DT gave me their "A=
cked-by"
> on concerned patches (thanks a lot guys!).
>
> The following changes since commit dd775ae2549217d3ae09363e3edb305d0f=
a19928:
>
> =A0Linux 3.4-rc1 (2012-03-31 16:24:09 -0700)
>
> are available in the git repository at:
>
> =A0git://github.com/at91linux/linux-at91.git at91-fixes

Thanks, pulled.


-Olof
