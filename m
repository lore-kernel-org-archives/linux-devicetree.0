From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v5 6/8] mfd: lochnagar: Add support for the Cirrus Logic
 Lochnagar
Date: Fri, 23 Nov 2018 09:15:40 +0000
Message-ID: <20181123091540.GL16508@imbe.wolfsonmicro.main>
References: <20181120141631.18949-6-ckeepax@opensource.cirrus.com>
 <201811231606.fDWBzL7a%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201811231606.fDWBzL7a%fengguang.wu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, lee.jones@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, broonie@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 23, 2018 at 05:00:57PM +0800, kbuild test robot wrote:
> Hi Charles,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on ljones-mfd/for-mfd-next]
> [also build test ERROR on v4.20-rc3]
> [cannot apply to next-20181122]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>    drivers/regulator/lochnagar-regulator.c: In function 'lochnagar_micbias_of_parse':

> >> drivers/regulator/lochnagar-regulator.c:115:7: error: 'LOCHNAGAR2_P2_MICBIAS_SRC_SHIFT' undeclared (first use in this function); did you mean 'LOCHNAGAR_DEVICE_ID_SHIFT'?
>           LOCHNAGAR2_P2_MICBIAS_SRC_SHIFT;
>           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

These issues will resolve themselves in the merge, this patch is
already merged in Mark's tree and will resolve the issue:

fa2bb8b97d77 ("regulator: lochnagar: Explicitly include register headers")

Thanks,
Charles
