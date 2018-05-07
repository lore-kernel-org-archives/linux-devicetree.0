Return-Path: <robherring2@gmail.com>
Date: Mon, 7 May 2018 11:01:41 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 02/14] dt-bindings: usb: add documentation for typec
 port controller(TCPCI)
Message-ID: <20180507160141.GA13573@rob-hp-laptop>
References: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
 <1525307094-27402-3-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1525307094-27402-3-git-send-email-jun.li@nxp.com>
To: Li Jun <jun.li@nxp.com>
Cc: gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net, a.hajda@samsung.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, gsomlo@gmail.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Thu, May 03, 2018 at 08:24:42AM +0800, Li Jun wrote:
> TCPCI stands for typec port controller interface, its implementation
> has full typec port control with power delivery support, it's a
> standard i2c slave with GPIO input as irq interface, detail see spec
> "Universal Serial Bus Type-C Port Controller Interface Specification
> Revision 1.0, Version 1.1"
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  .../devicetree/bindings/usb/typec-tcpci.txt        | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)

The example may need to change based on discussion on the prior patch, 
otherwise:

Reviewed-by: Rob Herring <robh@kernel.org>
