From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v9 00/12] Sunxi: Add SMP support on A83T
Date: Tue, 8 May 2018 10:11:07 -0700
Message-ID: <7491f58f-d24d-8f7c-c195-87d13457fd80@gmail.com>
References: <20180504190545.5114-1-mylene.josserand@bootlin.com>
 <20180508131914.6sy7cd6urnfg3tam@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180508131914.6sy7cd6urnfg3tam@flea>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, =?UTF-8?Q?Myl=c3=a8ne_Josserand?= <mylene.josserand@bootlin.com>
Cc: linux@armlinux.org.uk, wens@csie.org, marc.zyngier@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, horms@verge.net.au, geert@linux-m68k.org, magnus.damm@gmail.com, opendmb@gmail.com, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, clabbe.montjoie@gmail.com, quentin.schulz@bootlin.com, thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05/08/2018 06:19 AM, Maxime Ripard wrote:
> Hi,
> 
> On Fri, May 04, 2018 at 09:05:33PM +0200, Mylène Josserand wrote:
>> Hello everyone,
>>
>> This is a V9 of my series that adds SMP support for Allwinner sun8i-a83t.
>> Based on sunxi's tree, sunxi/for-next branch.
>> Depends on a patch from Doug Berger that allows to include the "cpu-type"
>> header on assembly files that I included in my series (patch 01).
> 
> I applied the patches, with the remarks done by Russell on v8 fixed,
> and the function sun8i_a83t_cntvoff_init made static.

Did you push those patches to sunxi/linux.git yet? I would like to make
sure I have the same copy of patch 1 since that is necessary for some of
our Broadcom ARM SoCs for 4.18.

Thanks!
-- 
Florian
