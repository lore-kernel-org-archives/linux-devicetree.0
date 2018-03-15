From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] clk: Add driver for the si544 clock generator
 chip
Date: Thu, 15 Mar 2018 13:35:18 +0300
Message-ID: <20180315103517.qkdqagrasoogp3yj@mwanda>
References: <1520930639-11642-1-git-send-email-mike.looijmans@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kbuild-bounces@lists.01.org>
Content-Disposition: inline
In-Reply-To: <1520930639-11642-1-git-send-email-mike.looijmans@topic.nl>
List-Unsubscribe: <https://lists.01.org/mailman/options/kbuild>,
 <mailto:kbuild-request@lists.01.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/kbuild/>
List-Post: <mailto:kbuild@lists.01.org>
List-Help: <mailto:kbuild-request@lists.01.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/kbuild>,
 <mailto:kbuild-request@lists.01.org?subject=subscribe>
Errors-To: kbuild-bounces@lists.01.org
Sender: "kbuild" <kbuild-bounces@lists.01.org>
To: kbuild@01.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org, Mike Looijmans <mike.looijmans@topic.nl>, robh+dt@kernel.org, kbuild-all@01.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Mike,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v4.16-rc4]
[also build test WARNING on next-20180314]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Mike-Looijmans/clk-Add-driver-for-the-si544-clock-generator-chip/20180314-122736

smatch warnings:
drivers/clk/clk-si544.c:188 si544_calc_muldiv() warn: impossible condition '((frequency * tmp) >= 10800000000) => (0-u32max >= 10800000000)'

# https://github.com/0day-ci/linux/commit/aba3d3de8751c1457bcf0b75bcc901f289a18426
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout aba3d3de8751c1457bcf0b75bcc901f289a18426
vim +188 drivers/clk/clk-si544.c

aba3d3de Mike Looijmans 2018-03-13  168  
aba3d3de Mike Looijmans 2018-03-13  169  /* Calculate divider settings for a given frequency */
aba3d3de Mike Looijmans 2018-03-13  170  static int si544_calc_muldiv(struct clk_si544_muldiv *settings,
aba3d3de Mike Looijmans 2018-03-13  171  	unsigned long frequency)
aba3d3de Mike Looijmans 2018-03-13  172  {
aba3d3de Mike Looijmans 2018-03-13  173  	u64 vco;
aba3d3de Mike Looijmans 2018-03-13  174  	u32 ls_freq;
aba3d3de Mike Looijmans 2018-03-13  175  	u32 tmp;
aba3d3de Mike Looijmans 2018-03-13  176  	u8 res;
aba3d3de Mike Looijmans 2018-03-13  177  
aba3d3de Mike Looijmans 2018-03-13  178  	/* Determine the minimum value of LS_DIV and resulting target freq. */
aba3d3de Mike Looijmans 2018-03-13  179  	ls_freq = frequency;
aba3d3de Mike Looijmans 2018-03-13  180  	settings->ls_div_bits = 0;
aba3d3de Mike Looijmans 2018-03-13  181  
aba3d3de Mike Looijmans 2018-03-13  182  	if (frequency >= (FVCO_MIN / HS_DIV_MAX))
aba3d3de Mike Looijmans 2018-03-13  183  		settings->ls_div_bits = 0;
aba3d3de Mike Looijmans 2018-03-13  184  	else {
aba3d3de Mike Looijmans 2018-03-13  185  		res = 1;
aba3d3de Mike Looijmans 2018-03-13  186  		tmp = 2 * HS_DIV_MAX;
aba3d3de Mike Looijmans 2018-03-13  187  		while (tmp <= (HS_DIV_MAX * 32)) {
aba3d3de Mike Looijmans 2018-03-13 @188  			if ((frequency * tmp) >= FVCO_MIN)
aba3d3de Mike Looijmans 2018-03-13  189  				break;
aba3d3de Mike Looijmans 2018-03-13  190  			++res;
aba3d3de Mike Looijmans 2018-03-13  191  			tmp <<= 1;
aba3d3de Mike Looijmans 2018-03-13  192  		}
aba3d3de Mike Looijmans 2018-03-13  193  		settings->ls_div_bits = res;
aba3d3de Mike Looijmans 2018-03-13  194  		ls_freq = frequency << res;
aba3d3de Mike Looijmans 2018-03-13  195  	}
aba3d3de Mike Looijmans 2018-03-13  196  
aba3d3de Mike Looijmans 2018-03-13  197  	/* Determine minimum HS_DIV by rounding up */
aba3d3de Mike Looijmans 2018-03-13  198  	vco = FVCO_MIN + ls_freq - 1;
aba3d3de Mike Looijmans 2018-03-13  199  	do_div(vco, ls_freq);
aba3d3de Mike Looijmans 2018-03-13  200  	settings->hs_div = vco;
aba3d3de Mike Looijmans 2018-03-13  201  	/* round up to even number if needed */
aba3d3de Mike Looijmans 2018-03-13  202  	if ((settings->hs_div > HS_DIV_MAX_ODD) && (settings->hs_div & 1))
aba3d3de Mike Looijmans 2018-03-13  203  		++settings->hs_div;
aba3d3de Mike Looijmans 2018-03-13  204  	/* Calculate VCO frequency (in 10..12GHz range) */
aba3d3de Mike Looijmans 2018-03-13  205  	vco = (u64)ls_freq * settings->hs_div;
aba3d3de Mike Looijmans 2018-03-13  206  	/* Calculate the integer part of the feedback divider */
aba3d3de Mike Looijmans 2018-03-13  207  	tmp = do_div(vco, FXO);
aba3d3de Mike Looijmans 2018-03-13  208  	settings->fb_div_int = vco;
aba3d3de Mike Looijmans 2018-03-13  209  	/* And the fractional bits using the remainder */
aba3d3de Mike Looijmans 2018-03-13  210  	vco = (u64)tmp << 32;
aba3d3de Mike Looijmans 2018-03-13  211  	do_div(vco, FXO);
aba3d3de Mike Looijmans 2018-03-13  212  	settings->fb_div_frac = vco;
aba3d3de Mike Looijmans 2018-03-13  213  
aba3d3de Mike Looijmans 2018-03-13  214  	return 0;
aba3d3de Mike Looijmans 2018-03-13  215  }
aba3d3de Mike Looijmans 2018-03-13  216  
