From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v5 1/3] arm64: map FDT as RW for early_init_dt_scan()
Date: Tue, 28 May 2019 08:48:48 -0700
Message-ID: <5ced5861.1c69fb81.956d8.5fb2@mx.google.com>
References: <20190527043336.112854-1-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190527043336.112854-1-hsinyi@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Mark Rutland <mark.rutland@arm.com>, Jun Yao <yaojun8558363@gmail.com>, Yu Zhao <yuzhao@google.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Kees Cook <keescook@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>
List-Id: devicetree@vger.kernel.org

Quoting Hsin-Yi Wang (2019-05-26 21:33:34)
> Currently in arm64, FDT is mapped to RO before it's passed to
> early_init_dt_scan(). However, there might be some codes
> (eg. commit "fdt: add support for rng-seed") that need to modify FDT
> during init. Map FDT to RO after early fixups are done.
>=20
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
