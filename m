From: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v2 0/2] Add macb support for SiFive FU540-C000
Date: Tue, 18 Jun 2019 15:02:45 +0530
Message-ID: <CAAhSdy3zODw=JFaN=2F4K5-umihJDivLO8J8LBdkFkuZgzu41Q@mail.gmail.com>
References: <1560745167-9866-1-git-send-email-yash.shah@sifive.com>
 <mvmtvco62k9.fsf@suse.de> <alpine.DEB.2.21.9999.1906170252410.19994@viisi.sifive.com>
 <mvmpnnc5y49.fsf@suse.de> <alpine.DEB.2.21.9999.1906170305020.19994@viisi.sifive.com>
 <mvmh88o5xi5.fsf@suse.de> <alpine.DEB.2.21.9999.1906170419010.19994@viisi.sifive.com>
 <F48A4F7F-0B0D-4191-91AD-DC51686D1E78@sifive.com> <d2836a90b92f3522a398d57ab8555d08956a0d1f.camel@wdc.com>
 <alpine.DEB.2.21.9999.1906172019040.15057@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.9999.1906172019040.15057@viisi.sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>, "palmer@sifive.com" <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, "troy.benjegerdes@sifive.com" <troy.benjegerdes@sifive.com>, "jamez@wit.com" <jamez@wit.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "davem@davemloft.net" <davem@davemloft.net>, "schwab@suse.de" <schwab@suse.de>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "sachin.ghadi@sifive.com" <sachin.ghadi@sifive.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "ynezz@true.cz" <ynezz@true.cz>, "yash.shah@sifive.com" <yash.shah@sifive.com>, "robh+dt@kernel.org" <rob>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 18, 2019 at 8:56 AM Paul Walmsley <paul.walmsley@sifive.com> wr=
ote:
>
> On Mon, 17 Jun 2019, Alistair Francis wrote:
>
> > > The legacy M-mode U-boot handles the phy reset already, and I=E2=80=
=99ve been
> > > able to load upstream S-mode uboot as a payload via TFTP, and then
> > > load and boot a 4.19 kernel.
> > >
> > > It would be nice to get this all working with 5.x, however there are
> > > still
> > > several missing pieces to really have it work well.
> >
> > Let me know what is still missing/doesn't work and I can add it. At the
> > moment the only known issue I know of is a missing SD card driver in U-
> > Boot.
>
> The DT data has changed between the non-upstream data that people
> developed against previously, vs. the DT data that just went upstream
> here:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D72296bde4f4207566872ee355950a59cbc29f852
>
> and
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dc35f1b87fc595807ff15d2834d241f9771497205
>
> So Upstream U-Boot is going to need several patches to get things working
> again.  Clock identifiers and Ethernet are two known areas.

Done.

I just send-out few patches to fix U-Boot SiFive Clock driver.

The U-Boot SiFive Clock driver fix series can be found in
riscv_unleashed_clk_sync_v1 branch of:
https://github.com/avpatel/u-boot.git

Users will also require OpenSBI DTB fix which can be found
in sifive_unleashed_dtb_fix_v1 branch of:
https://github.com/avpatel/opensbi.git

With above fixes, we can now use same DTB for both U-Boot
and Linux kernel (5.2-rc1). Although, users are free to pass a
different DTB to Linux kernel via TFTP.

I have tested SiFive serial and Cadance MACB ethernet on
both U-Boot and Linux (5.2-rc1)

Regards,
Anup
