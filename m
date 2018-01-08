From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 0/2] arm64: dts: r8a779[56]: update register size for
 thermal
Date: Mon, 8 Jan 2018 07:59:12 +0100
Message-ID: <20180108065911.dz2z4a4aaqjw6qfd@verge.net.au>
References: <20180105155447.10071-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180105155447.10071-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 05, 2018 at 04:54:45PM +0100, Niklas Söderlund wrote:
> Hi,
> 
> This series updates the register size for the thermal hardware. In later
> versions of the datasheet one additional register is documented. This
> register is needed to be able to determine if calibration data should be
> read from register or if static values from the driver should be used.
> 
> There is already a posted RFC patch which make use of this additional
> register (THSCP) if the register size described in DT covers it.
> Currently no hardware where the calibration value is fused have been
> found so that patch is not tested and therefore kept back until such a
> system is found. In the mean time there is no harm in getting the
> correct register size described in DT now that it's documented in the
> datasheet (Rev 0.80).
> 
> * Changes since v1
> - Increase size from just covering the new register in TSC1 to
>   increasing the size of all TSC's to 0x100 which is the smallest
>   granularity of the address decoder circuitry. Suggested by Geert.
> 
> Niklas Söderlund (2):
>   arm64: dts: r8a7795: update register size for thermal
>   arm64: dts: r8a7796: update register size for thermal

Applied, but this seems to go in the opposite direction of:

846106d9d973 ("ARM: dts: r8a7793: Reduce size of thermal registers")
1af62038f499 ("ARM: dts: r8a7791: Reduce size of thermal registers")
d0191d85a237 ("ARM: dts: r8a7790: Reduce size of thermal registers")

Should those patches be dropped and the register areas grown to 0x100
instead?
