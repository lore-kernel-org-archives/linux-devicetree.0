From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 06/19] dt-bindings: interrupt-controller: Add
 Loongson-3 IOINTC
Date: Tue, 17 Sep 2019 16:26:31 -0500
Message-ID: <20190917212631.GA3313@bogus>
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
 <20190905144316.12527-7-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190905144316.12527-7-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-mips@vger.kernel.org, chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.co, devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-Id: devicetree@vger.kernel.org

On Thu,  5 Sep 2019 22:43:03 +0800, Jiaxun Yang wrote:
> Document Loongson-3 I/O Interrupt controller.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../loongson,ls3-iointc.yaml                  | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-iointc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
