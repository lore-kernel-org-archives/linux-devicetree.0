From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/3] dt-bindings: clock: Add loongson-1 clock bindings
Date: Wed, 13 Feb 2019 16:56:30 -0600
Message-ID: <20190213225630.GA19462@bogus>
References: <20190128152052.3047-1-jiaxun.yang@flygoat.com>
 <20190201063540.19636-1-jiaxun.yang@flygoat.com>
 <20190201063540.19636-4-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190201063540.19636-4-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-mips@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-Id: devicetree@vger.kernel.org

On Fri,  1 Feb 2019 14:35:40 +0800, Jiaxun Yang wrote:
> Loongson-1 is a series of MIPS MCUs.
> This patch add the clock bindings for loongson-1b and
> loongson-1c clock subsystem.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../bindings/clock/loongson1-clock.txt          | 14 ++++++++++++++
>  include/dt-bindings/clock/ls1b-clock.h          | 17 +++++++++++++++++
>  include/dt-bindings/clock/ls1c-clock.h          | 14 ++++++++++++++
>  3 files changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/loongson1-clock.txt
>  create mode 100644 include/dt-bindings/clock/ls1b-clock.h
>  create mode 100644 include/dt-bindings/clock/ls1c-clock.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
