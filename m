From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/4] Irqchip: Ingenic: Add support for the X1000.
Date: Wed, 30 Jan 2019 13:43:29 -0600
Message-ID: <20190130194329.GA22264@bogus>
References: <1548517123-60058-2-git-send-email-zhouyanjie@zoho.com>
 <1548604232-19159-1-git-send-email-zhouyanjie@zoho.com>
 <1548604232-19159-5-git-send-email-zhouyanjie@zoho.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548604232-19159-5-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhou Yanjie <zhouyanjie@zoho.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, paul.burton@mips.com, mark.rutland@arm.com, marc.zyngier@arm.com, jason@lakedaemon.net, tglx@linutronix.de, syq@debian.org, jiaxun.yang@flygoat.com, 772753199@qq.com
List-Id: devicetree@vger.kernel.org

On Sun, 27 Jan 2019 23:50:32 +0800, Zhou Yanjie wrote:
> Add support for probing the irq-ingenic driver on the X1000 Soc.
> 
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
