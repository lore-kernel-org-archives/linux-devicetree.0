From: Vivien Didelot <vivien.didelot@gmail.com>
Subject: Re: [PATCH 1/2] regulator: mc13xxx: Use lowercase regulator names to
 match the DT
Date: Fri, 25 Jan 2019 11:33:57 -0500
Message-ID: <20190125113357.GB21150@t480s.localdomain>
References: <20190125153705.29921-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125153705.29921-1-robh@kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Fri, 25 Jan 2019 09:37:04 -0600, Rob Herring <robh@kernel.org> wrote:
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
> Fix this by using a lowercase regulator name to match the DT node name.
> 
> Fixes: c32569e358ad ("regulator: Use of_node_name_eq for node name comparisons")
> Reported-by: Vivien Didelot <vivien.didelot@gmail.com>
> Reported-by: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
 
This fixes the boot with arch/arm/boot/dts/imx51-zii-rdu1.dts,

Tested-by: Vivien Didelot <vivien.didelot@gmail.com>


Thanks,

	Vivien
