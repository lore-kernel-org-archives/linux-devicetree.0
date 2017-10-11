From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] dt-bindings: PCI: rcar: Correct example to match reality
Date: Wed, 11 Oct 2017 19:13:19 +0300
Message-ID: <850057d8-19dd-6eb8-7f0d-2a147196feaa@cogentembedded.com>
References: <1507729813-21501-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1507729813-21501-1-git-send-email-geert+renesas@glider.be>
Content-Language: en-MW
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/11/2017 04:50 PM, Geert Uytterhoeven wrote:

> Correct the USB subnodes in the example, cfr. commit f7d569c1e6a6fa73
> ("ARM: dts: r8a779x: Fix PCI bus dtc warnings"):
>    1. Drop the bogus 'device_type = "pci"' properties,
>    2. Correct the unit addresses.
> 
> Update other bits in the example to match real use:
>    1. Rename the USB subnodes from "pci" to "usb",
>    2. Update the "phys" property.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
