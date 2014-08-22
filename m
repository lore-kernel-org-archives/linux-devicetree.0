From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH 0/7] MIPS: Move device-tree files to a common location
Date: Fri, 22 Aug 2014 14:10:23 -0700
Message-ID: <CAL1qeaGb-o0P7x4nZPJ+dGfoSKz+2ANrB0gGrBi19TtPxVTAZQ@mail.gmail.com>
References: <1408651466-8334-1-git-send-email-abrestic@chromium.org>
        <CAGVrzcZobuL4z0WNX+Sz4p_uwaPL-S5yvEmgRUwZPJi4+qq0tg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <CAGVrzcZobuL4z0WNX+Sz4p_uwaPL-S5yvEmgRUwZPJi4+qq0tg@mail.gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Kumar Gala <galak@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>, Rob Herring <robh+dt@kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, Qais Yousef <qais.yousef@imgtec.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, John Crispin <blogic@openwrt.org>, Mark Rutland <mark.rutland@arm.com>, Jayachandran C <jchandra@broadcom.com>, Paul Burton <paul.burton@imgtec.com>, James Hogan <james.hogan@imgtec.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 22, 2014 at 1:42 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On Aug 21, 2014 3:05 PM, "Andrew Bresticker" <abrestic@chromium.org> wrote:
> >
> > To be consistent with other architectures and to avoid unnecessary
> > makefile duplication, move all MIPS device-trees to arch/mips/boot/dts
> > and build them with a common makefile.
>
> I recall reading that the ARM organization for DTS files was a bit unfortunate
> and should have been something like:
>
> arch/arm/boot/dts/<vendor>/
>
> Is this something we should do for the MIPS and update the other architectures
> to follow that scheme?

I recall reading that as well and that it would be adopted for ARM64,
but that hasn't seemed to have happened.  Perhaps Olof (CC'ed) will no
more.
