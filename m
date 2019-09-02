From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 08/18] dt-bindings: interrupt-controller: Add Loongson-3 HTINTC
Date: Mon, 02 Sep 2019 14:39:00 +0100
Message-ID: <5d6d1b74.1c69fb81.ed670.4fe4@mx.google.com>
References: <20190830043232.20191-1-jiaxun.yang@flygoat.com> <20190830043232.20191-3-jiaxun.yang@flygoat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190830043232.20191-3-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.co, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 30 Aug 2019 12:32:22 +0800, Jiaxun Yang wrote:
> Document Loongson-3 HyperTransport Interrupt controller.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../loongson,ls3-htintc.yaml                  | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-htintc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
