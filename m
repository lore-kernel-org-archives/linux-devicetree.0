From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 1/2] MIPS: Ci20: Enable SPI/GPIO driver
Date: Tue, 24 Jul 2018 13:45:23 -0700
Message-ID: <20180724204523.zf5siuo7uh64g6gy@pburton-laptop>
References: <20180606193730.15087-1-malat@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180606193730.15087-1-malat@debian.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Malaterre <malat@debian.org>
Cc: James Hogan <jhogan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Mathieu,

On Wed, Jun 06, 2018 at 09:37:29PM +0200, Mathieu Malaterre wrote:
> Update the Ci20's defconfig to enable the JZ4780's SPI/GPIO driver.
> 
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> ---
>  arch/mips/configs/ci20_defconfig | 2 ++
>  1 file changed, 2 insertions(+)

Thanks - both patches applied to mips-next for 4.19, with changes to
make the commit messages more descriptive.

Paul
