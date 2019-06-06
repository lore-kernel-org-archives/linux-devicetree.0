From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [RESEND][PATCH v3 1/2] usb: dwc3: Add avoiding vbus glitch happen
 during xhci reset
Date: Thu, 6 Jun 2019 11:16:54 +0300
Message-ID: <78eb1558-b8d4-0632-ad0c-4144c711d2da@cogentembedded.com>
References: <20190606025418.26313-1-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190606025418.26313-1-ran.wang_1@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ran Wang <ran.wang_1@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, Yang Li <pku.leo@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello!

On 06.06.2019 5:54, Ran Wang wrote:

> When DWC3 is set to host mode by programming register DWC3_GCTL, VBUS
> (or its control signal) will turn on immediately on related Root Hub
> ports. Then the VBUS will be de-asserted for a little while during xhci
> reset (conducted by xhci driver) for a little while and back to normal.
> 
> This VBUS glitch might cause some USB devices emuration fail if kernel

    Enumeration. :-)

> boot with them connected. One SW workaround which can fix this is to
> program all PORTSC[PP] to 0 to turn off VBUS immediately after setting
> host mode in DWC3 driver(per signal measurement result, it will be too
> late to do it in xhci-plat.c or xhci.c).
> 
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
[...]

MBR, Sergei
