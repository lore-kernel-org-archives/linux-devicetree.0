From: Vivien Didelot <vivien.didelot@gmail.com>
Subject: Re: [PATCH] of: Make of_node_name_eq() case insensitive
Date: Thu, 24 Jan 2019 15:19:06 -0500
Message-ID: <20190124151906.GB31994@t480s.localdomain>
References: <20190124200825.2611-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190124200825.2611-1-f.fainelli@gmail.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, 24 Jan 2019 12:08:25 -0800, Florian Fainelli <f.fainelli@gmail.com> wrote:
> Since c32569e358ad ("regulator: Use of_node_name_eq for node name
> comparisons") Vivien reported the mc13892-regulator complaining about
> not being able to find regulators.
> 
> This is because prior to that commit we used of_node_cmp() to compare
> the regulator array passed from mc13892_regulators down to
> mc13xxx_parse_regulators_dt() and they are all defined in uppercase
> letters by the MC13892_*_DEFINE* macros, whereas they are defined as
> lowercase in the DTS.
> 
> Fix this by use strncasecmp() since that makes sure the comparison is
> case insensitive like what of_node_cmp() did.
> 
> Reported-by: Vivien Didelot <vivien.didelot@gmail.com>
> Fixes: c32569e358ad ("regulator: Use of_node_name_eq for node name comparisons")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
 
This fixes the boot on i.MX51 ZII RDU1, which was printing this:

    [    2.895302] imx-ipuv3 40000000.ipu: IPUv3EX probed
    [    2.903869] spi_imx 70010000.spi: dma setup error -19, use pio
    [    2.911943] mc13xxx spi0.0: mc13892: rev: 2.4, fin: 2, fab: 0, icid: 7/2
    [    2.921463] mc13892-regulator mc13892-regulator: Unknown regulator: sw1
    [    2.928207] mc13892-regulator mc13892-regulator: Unknown regulator: sw2
    [    2.934896] mc13892-regulator mc13892-regulator: Unknown regulator: sw3
    [    2.941575] mc13892-regulator mc13892-regulator: Unknown regulator: sw4
    [    2.948263] mc13892-regulator mc13892-regulator: Unknown regulator: vpll
    [    2.955050] mc13892-regulator mc13892-regulator: Unknown regulator: vdig
    [    2.961820] mc13892-regulator mc13892-regulator: Unknown regulator: vsd
    [    2.968464] mc13892-regulator mc13892-regulator: Unknown regulator: vusb
    [    2.975251] mc13892-regulator mc13892-regulator: Unknown regulator: vusb2
    [    2.982110] mc13892-regulator mc13892-regulator: Unknown regulator: vvideo
    [    2.989039] mc13892-regulator mc13892-regulator: Unknown regulator: vaudio
    [    2.995983] mc13892-regulator mc13892-regulator: Unknown regulator: vcam
    [    3.002754] mc13892-regulator mc13892-regulator: Unknown regulator: vgen1
    [    3.009597] mc13892-regulator mc13892-regulator: Unknown regulator: vgen2
    [    3.016458] mc13892-regulator mc13892-regulator: Unknown regulator: vgen3

before looping forever on the defered probe of the Marvell switch.

Tested-by: Vivien Didelot <vivien.didelot@gmail.com>


Thanks,

	Vivien
