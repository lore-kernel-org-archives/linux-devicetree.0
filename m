From: Troy Benjegerdes <troy.benjegerdes@sifive.com>
Subject: Re: [PATCH v2 0/2] Add macb support for SiFive FU540-C000
Date: Tue, 18 Jun 2019 11:49:51 -0500
Message-ID: <946B2B53-7A16-4B8D-8CB9-34EFFB9E84D6@sifive.com>
References: <1560745167-9866-1-git-send-email-yash.shah@sifive.com>
 <mvmtvco62k9.fsf@suse.de>
 <alpine.DEB.2.21.9999.1906170252410.19994@viisi.sifive.com>
 <mvmpnnc5y49.fsf@suse.de>
 <alpine.DEB.2.21.9999.1906170305020.19994@viisi.sifive.com>
 <mvmh88o5xi5.fsf@suse.de>
 <alpine.DEB.2.21.9999.1906170419010.19994@viisi.sifive.com>
 <F48A4F7F-0B0D-4191-91AD-DC51686D1E78@sifive.com>
 <d2836a90b92f3522a398d57ab8555d08956a0d1f.camel@wdc.com>
 <alpine.DEB.2.21.9999.1906172019040.15057@viisi.sifive.com>
 <CAAhSdy3zODw=JFaN=2F4K5-umihJDivLO8J8LBdkFkuZgzu41Q@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAhSdy3zODw=JFaN=2F4K5-umihJDivLO8J8LBdkFkuZgzu41Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anup Patel <anup@brainfault.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>, "jamez@wit.com" <jamez@wit.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "davem@davemloft.net" <davem@davemloft.net>, "schwab@suse.de" <schwab@suse.de>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "sachin.ghadi@sifive.com" <sachin.ghadi@sifive.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "ynezz@true.cz" <ynezz@true.cz>, "yash.shah@sifive.com" <yash.shah@sifive.com>
List-Id: devicetree@vger.kernel.org



> On Jun 18, 2019, at 4:32 AM, Anup Patel <anup@brainfault.org> wrote:
>=20
>> =
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
?id=3D72296bde4f4207566872ee355950a59cbc29f852

I added your patches, along with two of mine, and rebased them
to the latest U-boot master, and put them on the =E2=80=98to-upstream=E2=80=
=99 branch
at https://github.com/sifive/u-boot/tree/to-upstream

I am most interested in review of the patch that adds the DTS files
from Linux to U-boot, along with a =E2=80=98-u-boot.dtsi=E2=80=99 file =
which includes
several extra things, most notably an ethernet entry [1] which does
not match the new proposed changes for the MacB driver that Yash
is working on.

How close are we to consensus on the new =E2=80=9Csifive,fu540-macb=E2=80=9D=

device tree entry format? Is this something that is stable enough to
start basing some work in M-mode U-boot on yet, or do we expect
more changes?

[1] =
https://github.com/sifive/u-boot/commit/35e4168e36139722f30143a0ca0aa8637d=
d3ee04#diff-27d2d375ddac52f1bca71594075e1be4R93=
