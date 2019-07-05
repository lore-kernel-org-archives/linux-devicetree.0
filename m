From: santosh.shilimkar@oracle.com
Subject: Re: [RESEND PATCH next v2 0/6] ARM: keystone: update dt and enable
 cpts support
Date: Fri, 5 Jul 2019 16:48:49 -0700
Message-ID: <2ef8b34e-7a6e-b3e4-90e0-c4e7f16c2e99@oracle.com>
References: <20190705151247.30422-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190705151247.30422-1-grygorii.strashko@ti.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: devicetree@vger.kernel.org, Murali Karicheri <m-karicheri2@ti.com>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 7/5/19 8:12 AM, Grygorii Strashko wrote:
> Hi Santosh,
> 
> This series is set of platform changes required to enable NETCP CPTS reference
> clock selection and final patch to enable CPTS for Keystone 66AK2E/L/HK SoCs.
> 
> Those patches were posted already [1] together with driver's changes, so this
> is re-send of DT/platform specific changes only, as driver's changes have
> been merged already.
> 
> Patches 1-5: CPTS DT nodes update for TI Keystone 2 66AK2HK/E/L SoCs.
> Patch 6: enables CPTS for TI Keystone 2 66AK2HK/E/L SoCs.
> 
> [1] https://patchwork.kernel.org/cover/10980037/
> 
> Grygorii Strashko (6):
>    ARM: dts: keystone-clocks: add input fixed clocks
>    ARM: dts: k2e-clocks: add input ext. fixed clocks tsipclka/b
>    ARM: dts: k2e-netcp: add cpts refclk_mux node
>    ARM: dts: k2hk-netcp: add cpts refclk_mux node
>    ARM: dts: k2l-netcp: add cpts refclk_mux node
>    ARM: configs: keystone: enable cpts
> 
Will add these for 5.4 queue. Thanks !!

Regards,
Santosh
