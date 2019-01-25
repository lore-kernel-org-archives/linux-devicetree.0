From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 1/2] regulator: mc13xxx: Use lowercase regulator names to
 match the DT
Date: Fri, 25 Jan 2019 10:17:39 -0800
Message-ID: <8ba0eee6-2bfd-b1a1-8607-d57690755af1@gmail.com>
References: <20190125153705.29921-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125153705.29921-1-robh@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>
List-Id: devicetree@vger.kernel.org

On 1/25/19 7:37 AM, Rob Herring wrote:
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

Thanks, when I looked at it last night, it seems to me that you also
need to patch the following drivers:

drivers/regulator/88pm8607.c
drivers/regulator/da9052-regulator.c
drivers/regulator/max8997-regulator.c
drivers/regulator/s5m8767.c

since they all define their array of regulators using uppercase, and
then later match that using the same logic that
drivers/regulator/mc13xxx-regulator-core.c does.
-- 
Florian
