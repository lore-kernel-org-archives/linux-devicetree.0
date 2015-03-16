From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/3] mtd: nand: add Broadcom NAND controller support
Date: Mon, 16 Mar 2015 16:44:42 -0700
Message-ID: <20150316234442.GM32500@ld-irv-0074>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <CALj_zD5rW3Se27Rh0pL6QTMNGOrrmrvAVLvW3BCuF8RujYQE=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALj_zD5rW3Se27Rh0pL6QTMNGOrrmrvAVLvW3BCuF8RujYQE=g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anatol Pomazau <anatol@google.com>
Cc: linux-mtd@lists.infradead.org, Dmitry Torokhov <dtor@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

(Your HTML mail will likely get blocked by a lot of filters)

Hi Anatol,

On Mon, Mar 16, 2015 at 04:24:20PM -0700, Anatol Pomazau wrote:
> Hi Brian
>=20
> Thanks for the patch series. I am going to test it on a Broadcom dev =
board.
>=20
> Do you plan to add a patch for bcm-cygnus.dtsi similar to what is don=
e
> here=C2=A0https://github.com/Broadcom/cygnus-linux/commit/
> 1de02697829c3a2ce48a1bc29a8535e4961999ca
>=20
> ?

Not yet. As I note below, this does not work as-is on Cygnus. I wanted
to get the initial code out there, as this already supports some chips.
There as still some additions necessary to get iProc/Cygnus and BCM53xx=
x
chips working (WIP).

The code you link to is a hacked version from Ray. His changes have not
been integrated yet.

> On Fri, Mar 6, 2015 at 5:18 PM, Brian Norris <computersforpeace@gmail=
=2Ecom>
> wrote:
>      Hi,
>=20
>      This adds (long in coming) support for the Broadcom BCM7xxx Set-=
Top
>      Box NAND
>      controller. This controller has been used in a variety of Broadc=
om
>      SoCs.
>=20
>      There are a few more features I'd like add in the near future, m=
ostly
>      to
>      support more SoCs, but this is the base set, which should only n=
eed
>      relatively
>      minor additions to support chips like BCM63138, BCM3384, and Cyg=
nus/
>      iProc.
>      Particularly, we may need to straighten out some endianness issu=
es
>      for the data
>      path on iProc, and interrupt enabling/acking on iProc, BCM63xxx,
>      BCM3xxx, and
>      others.

^^^ Note the previous 2 sentences.


>      TODO: add this to the DTS(I) files for BCM7445.
>=20
>      Happy reviewing! (Speaking of which, I need to catch up on revie=
wing
>      everybody
>      else's MTD submissions...)
>=20
>      Brian

Brian
