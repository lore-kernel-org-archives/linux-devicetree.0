From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [RFC/PATCH 4/5] arm64: Add support for arch_memremap_ro()
Date: Tue, 04 Jun 2019 09:54:35 -0700
Message-ID: <5cf6a24c.1c69fb81.c970e.907e@mx.google.com>
References: <20190517164746.110786-1-swboyd@chromium.org> <20190517164746.110786-5-swboyd@chromium.org> <20190603155612.GC63283@arrakis.emea.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603155612.GC63283@arrakis.emea.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Evan Green <evgreen@chromium.org>, Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, Will Deacon <will.deacon@arm.com>, Dan Williams <dan.j.williams@intel.com>
List-Id: devicetree@vger.kernel.org

Quoting Catalin Marinas (2019-06-03 08:56:13)
> On Fri, May 17, 2019 at 09:47:45AM -0700, Stephen Boyd wrote:
> > Pass in PAGE_KERNEL_RO to the underlying IO mapping mechanism to get a
> > read-only mapping for the MEMREMAP_RO type of memory mappings that
> > memremap() supports.
> >=20
> > Cc: Evan Green <evgreen@chromium.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: Will Deacon <will.deacon@arm.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>=20
> Not sure what the plans are with this series but if you need an ack for
> arm64:
>=20
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks. I'll resend without the RFC tag and see how it goes.
