From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5] MIPS: NI 169445 board support
Date: Wed, 7 Jun 2017 16:35:44 -0500
Message-ID: <20170607213544.rvgxhd7dwh56les2@rob-hp-laptop>
References: <1496259237-9524-1-git-send-email-nathan.sullivan@ni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1496259237-9524-1-git-send-email-nathan.sullivan@ni.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Sullivan <nathan.sullivan@ni.com>
Cc: ralf@linux-mips.org, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, May 31, 2017 at 02:33:57PM -0500, Nathan Sullivan wrote:
> Support the National Instruments 169445 board.
> 
> Signed-off-by: Nathan Sullivan <nathan.sullivan@ni.com>
> ---
> 
> Changes from v4:
> 
> - Address Rob Herring's device tree feedback
> 
> I'm still unclear on the vmlinux.its.S changes.  The linux-mti tree has a
> config in the image tree for each board it supports, and I followed that
> pattern here.  Rob was concerned about how the configs would scale wrt
> the number of bootloaders around, but it's really just one per board/dt,
> right?

It was more just a comment if I was MIPS maintainer, but I'm not so for 
the DT parts:

Acked-by: Rob Herring <robh@kernel.org>

> 
> ---
>  Documentation/devicetree/bindings/mips/ni.txt   |   7 ++
>  MAINTAINERS                                     |   8 ++
>  arch/mips/boot/dts/Makefile                     |   1 +
>  arch/mips/boot/dts/ni/169445.dts                | 100 ++++++++++++++++++++++++
>  arch/mips/boot/dts/ni/Makefile                  |   7 ++
>  arch/mips/configs/generic/board-ni169445.config |  27 +++++++
>  arch/mips/generic/Kconfig                       |   6 ++
>  arch/mips/generic/vmlinux.its.S                 |  25 ++++++
>  8 files changed, 181 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/ni.txt
>  create mode 100644 arch/mips/boot/dts/ni/169445.dts
>  create mode 100644 arch/mips/boot/dts/ni/Makefile
>  create mode 100644 arch/mips/configs/generic/board-ni169445.config
