From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH 0/4] Add new device nodes for Spreadtrum SC9860 platform
Date: Wed, 13 Feb 2019 13:45:53 +0800
Message-ID: <CAMz4kuLCA2d0aRf4r7-F6w7q58F4Do-z5weTXNHYVvvJ4Acegg@mail.gmail.com>
References: <cover.1548052878.git.baolin.wang@linaro.org> <CAK8P3a3UROFLTtEcNXKtMUN283UQ6auQUOXCR=6e3BdLu5K8Nw@mail.gmail.com>
 <CAMz4kuLotnNom9kx2EmdfVEb+gvWfEbxoh6+hiqk87EjmtYJwA@mail.gmail.com>
 <20190201130519.GH20797@sirena.org.uk> <CAMz4kuJdPts31Ak-H=VAivvoqqPtxO5M1RdqrNPwTLT5d1h_7w@mail.gmail.com>
 <20190212122035.GA20635@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212122035.GA20635@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Olof Johansson <olof@lixom.net>, Orson Zhai <orsonzhai@gmail.com>, Lyra Zhang <zhang.lyra@gmail.com>, DTML <devicetree@vger.kernel.org>, arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 12 Feb 2019 at 20:20, Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Feb 12, 2019 at 04:40:10PM +0800, Baolin Wang wrote:
> > On Fri, 1 Feb 2019 at 21:05, Mark Brown <broonie@kernel.org> wrote:
>
> > > You can just list all the individual device names in the of_match_table
> > > for the MFD and then it can bind to any of them.  You can always map
> > > them onto the same behaviour in the MFD driver if they are identical
> > > from a software point of view.
>
> > If I understood correctly, as you suggested, we should add new
> > mfd_cell groups to list all different PMICs' device names. Something
> > like:
>
> I do think this is a good idea (registering the components of the MFD
> using mfd_cell), though it wasn't quite the point I was making.  Having
> individual device names matters less for Linux-internal names like this.
>
> > But from my point, they are just some meaningless duplication, and
> > will waste lots of code there.
>
> I was more thinking of the of_match table that has the IDs that appear
> in DT - they're the one that's the ABI.  Look at something like wm8994
> where the driver has several IDs listed in the main table then selects
> function drivers based on that.

Yes, we can use id_table to populate the PMIC child devices, but some
child devices need use the device node to get some resources which are
described in DT, so we must specify the of_compabible member of
mfd_cell. That means we should use compatible string of the
of_match_table to populate the child devices.

So the problem is still there, we should expand the mfd_cell groups to
list all device names, but just some meaningless duplication.




--
Baolin Wang
Best Regards
