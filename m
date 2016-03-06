Return-Path: <guodong.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <201603061722.6YMRvw3K%fengguang.wu@intel.com>
References: <1457254062-22677-2-git-send-email-guodong.xu@linaro.org>
	<201603061722.6YMRvw3K%fengguang.wu@intel.com>
Date: Sun, 6 Mar 2016 19:09:35 +0800
Message-ID: <CAFGCpxxSCRkt4fKD2jYz+qkJKSKLw2XPAMF4HZD-WseeRNyQ2g@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: dw_mmc: add resets support to dw_mmc
From: Guodong Xu <guodong.xu@linaro.org>
Content-Type: multipart/alternative; boundary=001a11418fde293bed052d5f62d2
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, robh+dt@kernel.org, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, jh80.chung@samsung.com, Ulf Hansson <ulf.hansson@linaro.org>, shawn.lin@rock-chips.com, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mmc@vger.kernel.org, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Zhangfei Gao <zhangfei.gao@linaro.org>
List-ID: <devicetree@vger.kernel.org>

--001a11418fde293bed052d5f62d2
Content-Type: text/plain; charset=UTF-8

Sorry, I made mistake in this patch.
Header file changes was missed, include/linux/mmc/dw_mmc.h

I will resend the patches.

-Guodong


On 6 March 2016 at 17:11, kbuild test robot <lkp@intel.com> wrote:

> Hi Guodong,
>
> [auto build test ERROR on ulf.hansson-mmc/next]
> [also build test ERROR on v4.5-rc6 next-20160304]
> [if your patch is applied to the wrong git tree, please drop us a note to
> help improving the system]
>
> url:
> https://github.com/0day-ci/linux/commits/Guodong-Xu/Documentation-synopsys-dw-mshc-add-binding-for-resets/20160306-164955
> base:   https://git.linaro.org/people/ulf.hansson/mmc next
> config: sparc64-allyesconfig (attached as .config)
> reproduce:
>         wget
> https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross
> -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=sparc64
>
> All errors (new ones prefixed by >>):
>
>    drivers/mmc/host/dw_mmc.c: In function 'dw_mci_parse_dt':
> >> drivers/mmc/host/dw_mmc.c:2882:7: error: 'struct dw_mci_board' has no
> member named 'rstc'
>      pdata->rstc = devm_reset_control_get_optional(dev, NULL);
>           ^
> >> drivers/mmc/host/dw_mmc.c:2882:2: error: implicit declaration of
> function 'devm_reset_control_get_optional'
> [-Werror=implicit-function-declaration]
>      pdata->rstc = devm_reset_control_get_optional(dev, NULL);
>      ^
>    drivers/mmc/host/dw_mmc.c:2883:18: error: 'struct dw_mci_board' has no
> member named 'rstc'
>      if (IS_ERR(pdata->rstc)) {
>                      ^
>    drivers/mmc/host/dw_mmc.c:2884:20: error: 'struct dw_mci_board' has no
> member named 'rstc'
>       if (PTR_ERR(pdata->rstc) == -EPROBE_DEFER)
>                        ^
>    drivers/mmc/host/dw_mmc.c:2886:8: error: 'struct dw_mci_board' has no
> member named 'rstc'
>       pdata->rstc = NULL;
>            ^
>    drivers/mmc/host/dw_mmc.c: In function 'dw_mci_probe':
>    drivers/mmc/host/dw_mmc.c:3025:17: error: 'struct dw_mci_board' has no
> member named 'rstc'
>      if (host->pdata->rstc != NULL)
>                     ^
> >> drivers/mmc/host/dw_mmc.c:3026:3: error: implicit declaration of
> function 'reset_control_deassert' [-Werror=implicit-function-declaration]
>       reset_control_deassert(host->pdata->rstc);
>       ^
>    drivers/mmc/host/dw_mmc.c:3026:37: error: 'struct dw_mci_board' has no
> member named 'rstc'
>       reset_control_deassert(host->pdata->rstc);
>                                         ^
>    drivers/mmc/host/dw_mmc.c:3180:17: error: 'struct dw_mci_board' has no
> member named 'rstc'
>      if (host->pdata->rstc != NULL)
>                     ^
> >> drivers/mmc/host/dw_mmc.c:3181:3: error: implicit declaration of
> function 'reset_control_assert' [-Werror=implicit-function-declaration]
>       reset_control_assert(host->pdata->rstc);
>       ^
>    drivers/mmc/host/dw_mmc.c:3181:35: error: 'struct dw_mci_board' has no
> member named 'rstc'
>       reset_control_assert(host->pdata->rstc);
>                                       ^
>    drivers/mmc/host/dw_mmc.c: In function 'dw_mci_remove':
>    drivers/mmc/host/dw_mmc.c:3215:17: error: 'struct dw_mci_board' has no
> member named 'rstc'
>      if (host->pdata->rstc != NULL)
>                     ^
>    drivers/mmc/host/dw_mmc.c:3216:35: error: 'struct dw_mci_board' has no
> member named 'rstc'
>       reset_control_assert(host->pdata->rstc);
>                                       ^
>    cc1: some warnings being treated as errors
>
> vim +2882 drivers/mmc/host/dw_mmc.c
>
>   2876
>   2877          pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>   2878          if (!pdata)
>   2879                  return ERR_PTR(-ENOMEM);
>   2880
>   2881          /* find reset controller when exist */
> > 2882          pdata->rstc = devm_reset_control_get_optional(dev, NULL);
>   2883          if (IS_ERR(pdata->rstc)) {
>   2884                  if (PTR_ERR(pdata->rstc) == -EPROBE_DEFER)
>   2885                          return ERR_PTR(-EPROBE_DEFER);
> > 2886                  pdata->rstc = NULL;
>   2887          }
>   2888
>   2889          /* find out number of slots supported */
>   2890          of_property_read_u32(np, "num-slots", &pdata->num_slots);
>   2891
>   2892          if (of_property_read_u32(np, "fifo-depth",
> &pdata->fifo_depth))
>   2893                  dev_info(dev,
>   2894                           "fifo-depth property not found, using
> value of FIFOTH register as default\n");
>   2895
>   2896          of_property_read_u32(np, "card-detect-delay",
> &pdata->detect_delay_ms);
>   2897
>   2898          if (!of_property_read_u32(np, "clock-frequency",
> &clock_frequency))
>   2899                  pdata->bus_hz = clock_frequency;
>   2900
>   2901          if (drv_data && drv_data->parse_dt) {
>   2902                  ret = drv_data->parse_dt(host);
>   2903                  if (ret)
>   2904                          return ERR_PTR(ret);
>   2905          }
>   2906
>   2907          if (of_find_property(np, "supports-highspeed", NULL)) {
>   2908                  dev_info(dev, "supports-highspeed property is
> deprecated.\n");
>   2909                  pdata->caps |= MMC_CAP_SD_HIGHSPEED |
> MMC_CAP_MMC_HIGHSPEED;
>   2910          }
>   2911
>   2912          return pdata;
>   2913  }
>   2914
>   2915  #else /* CONFIG_OF */
>   2916  static struct dw_mci_board *dw_mci_parse_dt(struct dw_mci *host)
>   2917  {
>   2918          return ERR_PTR(-EINVAL);
>   2919  }
>   2920  #endif /* CONFIG_OF */
>   2921
>   2922  static void dw_mci_enable_cd(struct dw_mci *host)
>   2923  {
>   2924          unsigned long irqflags;
>   2925          u32 temp;
>   2926          int i;
>   2927          struct dw_mci_slot *slot;
>   2928
>   2929          /*
>   2930           * No need for CD if all slots have a non-error GPIO
>   2931           * as well as broken card detection is found.
>   2932           */
>   2933          for (i = 0; i < host->num_slots; i++) {
>   2934                  slot = host->slot[i];
>   2935                  if (slot->mmc->caps & MMC_CAP_NEEDS_POLL)
>   2936                          return;
>   2937
>   2938                  if (IS_ERR_VALUE(mmc_gpio_get_cd(slot->mmc)))
>   2939                          break;
>   2940          }
>   2941          if (i == host->num_slots)
>   2942                  return;
>   2943
>   2944          spin_lock_irqsave(&host->irq_lock, irqflags);
>   2945          temp = mci_readl(host, INTMASK);
>   2946          temp  |= SDMMC_INT_CD;
>   2947          mci_writel(host, INTMASK, temp);
>   2948          spin_unlock_irqrestore(&host->irq_lock, irqflags);
>   2949  }
>   2950
>   2951  int dw_mci_probe(struct dw_mci *host)
>   2952  {
>   2953          const struct dw_mci_drv_data *drv_data = host->drv_data;
>   2954          int width, i, ret = 0;
>   2955          u32 fifo_size;
>   2956          int init_slots = 0;
>   2957
>   2958          if (!host->pdata) {
>   2959                  host->pdata = dw_mci_parse_dt(host);
>   2960                  if (PTR_ERR(host->pdata) == -EPROBE_DEFER)
>   2961                          return -EPROBE_DEFER;
>   2962                  else if (IS_ERR(host->pdata)) {
>   2963                          dev_err(host->dev, "platform data not
> available\n");
>   2964                          return -EINVAL;
>   2965                  }
>   2966          }
>   2967
>   2968          host->biu_clk = devm_clk_get(host->dev, "biu");
>   2969          if (IS_ERR(host->biu_clk)) {
>   2970                  dev_dbg(host->dev, "biu clock not available\n");
>   2971          } else {
>   2972                  ret = clk_prepare_enable(host->biu_clk);
>   2973                  if (ret) {
>   2974                          dev_err(host->dev, "failed to enable biu
> clock\n");
>   2975                          return ret;
>   2976                  }
>   2977          }
>   2978
>   2979          host->ciu_clk = devm_clk_get(host->dev, "ciu");
>   2980          if (IS_ERR(host->ciu_clk)) {
>   2981                  dev_dbg(host->dev, "ciu clock not available\n");
>   2982                  host->bus_hz = host->pdata->bus_hz;
>   2983          } else {
>   2984                  ret = clk_prepare_enable(host->ciu_clk);
>   2985                  if (ret) {
>   2986                          dev_err(host->dev, "failed to enable ciu
> clock\n");
>   2987                          goto err_clk_biu;
>   2988                  }
>   2989
>   2990                  if (host->pdata->bus_hz) {
>   2991                          ret = clk_set_rate(host->ciu_clk,
> host->pdata->bus_hz);
>   2992                          if (ret)
>   2993                                  dev_warn(host->dev,
>   2994                                           "Unable to set bus rate
> to %uHz\n",
>   2995                                           host->pdata->bus_hz);
>   2996                  }
>   2997                  host->bus_hz = clk_get_rate(host->ciu_clk);
>   2998          }
>   2999
>   3000          if (!host->bus_hz) {
>   3001                  dev_err(host->dev,
>   3002                          "Platform data must supply bus speed\n");
>   3003                  ret = -ENODEV;
>   3004                  goto err_clk_ciu;
>   3005          }
>   3006
>   3007          if (drv_data && drv_data->init) {
>   3008                  ret = drv_data->init(host);
>   3009                  if (ret) {
>   3010                          dev_err(host->dev,
>   3011                                  "implementation specific init
> failed\n");
>   3012                          goto err_clk_ciu;
>   3013                  }
>   3014          }
>   3015
>   3016          if (drv_data && drv_data->setup_clock) {
>   3017                  ret = drv_data->setup_clock(host);
>   3018                  if (ret) {
>   3019                          dev_err(host->dev,
>   3020                                  "implementation specific clock
> setup failed\n");
>   3021                          goto err_clk_ciu;
>   3022                  }
>   3023          }
>   3024
>   3025          if (host->pdata->rstc != NULL)
> > 3026                  reset_control_deassert(host->pdata->rstc);
>   3027
>   3028          setup_timer(&host->cmd11_timer,
>   3029                      dw_mci_cmd11_timer, (unsigned long)host);
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology
> Center
> https://lists.01.org/pipermail/kbuild-all                   Intel
> Corporation
>

--001a11418fde293bed052d5f62d2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+U29ycnksIEkgbWFkZSBtaXN0YWtlIGluIHRoaXMgcGF0Y2guwqA8ZGl2
PkhlYWRlciBmaWxlIGNoYW5nZXMgd2FzIG1pc3NlZCwgaW5jbHVkZS9saW51eC9tbWMvZHdfbW1j
LmjCoDxkaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIHdpbGwgcmVzZW5kIHRoZSBwYXRjaGVzLjwv
ZGl2PjxkaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4tR3VvZG9uZzwvZGl2PjxkaXY+PGJyPjwvZGl2
PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRp
diBjbGFzcz0iZ21haWxfcXVvdGUiPk9uIDYgTWFyY2ggMjAxNiBhdCAxNzoxMSwga2J1aWxkIHRl
c3Qgcm9ib3QgPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86bGtwQGludGVsLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPmxrcEBpbnRlbC5jb208L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJy
PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4
O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPkhpIEd1b2Rvbmcs
PGJyPg0KPGJyPg0KW2F1dG8gYnVpbGQgdGVzdCBFUlJPUiBvbiB1bGYuaGFuc3Nvbi1tbWMvbmV4
dF08YnI+DQpbYWxzbyBidWlsZCB0ZXN0IEVSUk9SIG9uIHY0LjUtcmM2IG5leHQtMjAxNjAzMDRd
PGJyPg0KW2lmIHlvdXIgcGF0Y2ggaXMgYXBwbGllZCB0byB0aGUgd3JvbmcgZ2l0IHRyZWUsIHBs
ZWFzZSBkcm9wIHVzIGEgbm90ZSB0byBoZWxwIGltcHJvdmluZyB0aGUgc3lzdGVtXTxicj4NCjxi
cj4NCnVybDrCoCDCoCA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vMGRheS1jaS9saW51eC9j
b21taXRzL0d1b2RvbmctWHUvRG9jdW1lbnRhdGlvbi1zeW5vcHN5cy1kdy1tc2hjLWFkZC1iaW5k
aW5nLWZvci1yZXNldHMvMjAxNjAzMDYtMTY0OTU1IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vMGRheS1jaS9saW51eC9jb21taXRzL0d1b2Rvbmct
WHUvRG9jdW1lbnRhdGlvbi1zeW5vcHN5cy1kdy1tc2hjLWFkZC1iaW5kaW5nLWZvci1yZXNldHMv
MjAxNjAzMDYtMTY0OTU1PC9hPjxicj4NCmJhc2U6wqAgwqA8YSBocmVmPSJodHRwczovL2dpdC5s
aW5hcm8ub3JnL3Blb3BsZS91bGYuaGFuc3Nvbi9tbWMiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHBzOi8vZ2l0LmxpbmFyby5vcmcvcGVvcGxlL3VsZi5oYW5zc29uL21tYzwv
YT4gbmV4dDxicj4NCmNvbmZpZzogc3BhcmM2NC1hbGx5ZXNjb25maWcgKGF0dGFjaGVkIGFzIC5j
b25maWcpPGJyPg0KcmVwcm9kdWNlOjxicj4NCsKgIMKgIMKgIMKgIHdnZXQgPGEgaHJlZj0iaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9jZ2l0L2xpbnV4L2tlcm5lbC9naXQvd2ZnL2xrcC10ZXN0cy5n
aXQvcGxhaW4vc2Jpbi9tYWtlLmNyb3NzIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwczovL2dpdC5rZXJuZWwub3JnL2NnaXQvbGludXgva2VybmVsL2dpdC93ZmcvbGtwLXRl
c3RzLmdpdC9wbGFpbi9zYmluL21ha2UuY3Jvc3M8L2E+IC1PIH4vYmluL21ha2UuY3Jvc3M8YnI+
DQrCoCDCoCDCoCDCoCBjaG1vZCAreCB+L2Jpbi9tYWtlLmNyb3NzPGJyPg0KwqAgwqAgwqAgwqAg
IyBzYXZlIHRoZSBhdHRhY2hlZCAuY29uZmlnIHRvIGxpbnV4IGJ1aWxkIHRyZWU8YnI+DQrCoCDC
oCDCoCDCoCBtYWtlLmNyb3NzIEFSQ0g9c3BhcmM2NDxicj4NCjxicj4NCkFsbCBlcnJvcnMgKG5l
dyBvbmVzIHByZWZpeGVkIGJ5ICZndDsmZ3Q7KTo8YnI+DQo8YnI+DQrCoCDCoGRyaXZlcnMvbW1j
L2hvc3QvZHdfbW1jLmM6IEluIGZ1bmN0aW9uICYjMzk7ZHdfbWNpX3BhcnNlX2R0JiMzOTs6PGJy
Pg0KJmd0OyZndDsgZHJpdmVycy9tbWMvaG9zdC9kd19tbWMuYzoyODgyOjc6IGVycm9yOiAmIzM5
O3N0cnVjdCBkd19tY2lfYm9hcmQmIzM5OyBoYXMgbm8gbWVtYmVyIG5hbWVkICYjMzk7cnN0YyYj
Mzk7PGJyPg0KPHNwYW4gY2xhc3M9IiI+wqAgwqAgwqBwZGF0YS0mZ3Q7cnN0YyA9IGRldm1fcmVz
ZXRfY29udHJvbF9nZXRfb3B0aW9uYWwoZGV2LCBOVUxMKTs8YnI+DQo8L3NwYW4+wqAgwqAgwqAg
wqAgwqAgXjxicj4NCiZndDsmZ3Q7IGRyaXZlcnMvbW1jL2hvc3QvZHdfbW1jLmM6Mjg4MjoyOiBl
cnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJiMzOTtkZXZtX3Jlc2V0X2Nv
bnRyb2xfZ2V0X29wdGlvbmFsJiMzOTsgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFy
YXRpb25dPGJyPg0KPHNwYW4gY2xhc3M9IiI+wqAgwqAgwqBwZGF0YS0mZ3Q7cnN0YyA9IGRldm1f
cmVzZXRfY29udHJvbF9nZXRfb3B0aW9uYWwoZGV2LCBOVUxMKTs8YnI+DQo8L3NwYW4+wqAgwqAg
wqBePGJyPg0KwqAgwqBkcml2ZXJzL21tYy9ob3N0L2R3X21tYy5jOjI4ODM6MTg6IGVycm9yOiAm
IzM5O3N0cnVjdCBkd19tY2lfYm9hcmQmIzM5OyBoYXMgbm8gbWVtYmVyIG5hbWVkICYjMzk7cnN0
YyYjMzk7PGJyPg0KwqAgwqAgwqBpZiAoSVNfRVJSKHBkYXRhLSZndDtyc3RjKSkgezxicj4NCsKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXjxicj4NCsKgIMKgZHJpdmVycy9tbWMvaG9z
dC9kd19tbWMuYzoyODg0OjIwOiBlcnJvcjogJiMzOTtzdHJ1Y3QgZHdfbWNpX2JvYXJkJiMzOTsg
aGFzIG5vIG1lbWJlciBuYW1lZCAmIzM5O3JzdGMmIzM5Ozxicj4NCjxzcGFuIGNsYXNzPSIiPsKg
IMKgIMKgIGlmIChQVFJfRVJSKHBkYXRhLSZndDtyc3RjKSA9PSAtRVBST0JFX0RFRkVSKTxicj4N
Cjwvc3Bhbj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF48YnI+DQrCoCDCoGRy
aXZlcnMvbW1jL2hvc3QvZHdfbW1jLmM6Mjg4Njo4OiBlcnJvcjogJiMzOTtzdHJ1Y3QgZHdfbWNp
X2JvYXJkJiMzOTsgaGFzIG5vIG1lbWJlciBuYW1lZCAmIzM5O3JzdGMmIzM5Ozxicj4NCsKgIMKg
IMKgIHBkYXRhLSZndDtyc3RjID0gTlVMTDs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoF48YnI+DQrC
oCDCoGRyaXZlcnMvbW1jL2hvc3QvZHdfbW1jLmM6IEluIGZ1bmN0aW9uICYjMzk7ZHdfbWNpX3By
b2JlJiMzOTs6PGJyPg0KwqAgwqBkcml2ZXJzL21tYy9ob3N0L2R3X21tYy5jOjMwMjU6MTc6IGVy
cm9yOiAmIzM5O3N0cnVjdCBkd19tY2lfYm9hcmQmIzM5OyBoYXMgbm8gbWVtYmVyIG5hbWVkICYj
Mzk7cnN0YyYjMzk7PGJyPg0KPHNwYW4gY2xhc3M9IiI+wqAgwqAgwqBpZiAoaG9zdC0mZ3Q7cGRh
dGEtJmd0O3JzdGMgIT0gTlVMTCk8YnI+DQo8L3NwYW4+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgXjxicj4NCiZndDsmZ3Q7IGRyaXZlcnMvbW1jL2hvc3QvZHdfbW1jLmM6MzAyNjozOiBl
cnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJiMzOTtyZXNldF9jb250cm9s
X2RlYXNzZXJ0JiMzOTsgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dPGJy
Pg0KwqAgwqAgwqAgcmVzZXRfY29udHJvbF9kZWFzc2VydChob3N0LSZndDtwZGF0YS0mZ3Q7cnN0
Yyk7PGJyPg0KwqAgwqAgwqAgXjxicj4NCsKgIMKgZHJpdmVycy9tbWMvaG9zdC9kd19tbWMuYzoz
MDI2OjM3OiBlcnJvcjogJiMzOTtzdHJ1Y3QgZHdfbWNpX2JvYXJkJiMzOTsgaGFzIG5vIG1lbWJl
ciBuYW1lZCAmIzM5O3JzdGMmIzM5Ozxicj4NCsKgIMKgIMKgIHJlc2V0X2NvbnRyb2xfZGVhc3Nl
cnQoaG9zdC0mZ3Q7cGRhdGEtJmd0O3JzdGMpOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIF48YnI+DQrCoCDCoGRyaXZlcnMv
bW1jL2hvc3QvZHdfbW1jLmM6MzE4MDoxNzogZXJyb3I6ICYjMzk7c3RydWN0IGR3X21jaV9ib2Fy
ZCYjMzk7IGhhcyBubyBtZW1iZXIgbmFtZWQgJiMzOTtyc3RjJiMzOTs8YnI+DQo8c3BhbiBjbGFz
cz0iIj7CoCDCoCDCoGlmIChob3N0LSZndDtwZGF0YS0mZ3Q7cnN0YyAhPSBOVUxMKTxicj4NCjwv
c3Bhbj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBePGJyPg0KJmd0OyZndDsgZHJpdmVy
cy9tbWMvaG9zdC9kd19tbWMuYzozMTgxOjM6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBv
ZiBmdW5jdGlvbiAmIzM5O3Jlc2V0X2NvbnRyb2xfYXNzZXJ0JiMzOTsgWy1XZXJyb3I9aW1wbGlj
aXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dPGJyPg0KwqAgwqAgwqAgcmVzZXRfY29udHJvbF9hc3Nl
cnQoaG9zdC0mZ3Q7cGRhdGEtJmd0O3JzdGMpOzxicj4NCsKgIMKgIMKgIF48YnI+DQrCoCDCoGRy
aXZlcnMvbW1jL2hvc3QvZHdfbW1jLmM6MzE4MTozNTogZXJyb3I6ICYjMzk7c3RydWN0IGR3X21j
aV9ib2FyZCYjMzk7IGhhcyBubyBtZW1iZXIgbmFtZWQgJiMzOTtyc3RjJiMzOTs8YnI+DQrCoCDC
oCDCoCByZXNldF9jb250cm9sX2Fzc2VydChob3N0LSZndDtwZGF0YS0mZ3Q7cnN0Yyk7PGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
Xjxicj4NCsKgIMKgZHJpdmVycy9tbWMvaG9zdC9kd19tbWMuYzogSW4gZnVuY3Rpb24gJiMzOTtk
d19tY2lfcmVtb3ZlJiMzOTs6PGJyPg0KwqAgwqBkcml2ZXJzL21tYy9ob3N0L2R3X21tYy5jOjMy
MTU6MTc6IGVycm9yOiAmIzM5O3N0cnVjdCBkd19tY2lfYm9hcmQmIzM5OyBoYXMgbm8gbWVtYmVy
IG5hbWVkICYjMzk7cnN0YyYjMzk7PGJyPg0KPHNwYW4gY2xhc3M9IiI+wqAgwqAgwqBpZiAoaG9z
dC0mZ3Q7cGRhdGEtJmd0O3JzdGMgIT0gTlVMTCk8YnI+DQo8L3NwYW4+wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgXjxicj4NCsKgIMKgZHJpdmVycy9tbWMvaG9zdC9kd19tbWMuYzozMjE2
OjM1OiBlcnJvcjogJiMzOTtzdHJ1Y3QgZHdfbWNpX2JvYXJkJiMzOTsgaGFzIG5vIG1lbWJlciBu
YW1lZCAmIzM5O3JzdGMmIzM5Ozxicj4NCsKgIMKgIMKgIHJlc2V0X2NvbnRyb2xfYXNzZXJ0KGhv
c3QtJmd0O3BkYXRhLSZndDtyc3RjKTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBePGJyPg0KwqAgwqBjYzE6IHNvbWUgd2Fybmlu
Z3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnM8YnI+DQo8YnI+DQp2aW0gKzI4ODIgZHJpdmVycy9t
bWMvaG9zdC9kd19tbWMuYzxicj4NCjxicj4NCsKgIDI4NzY8YnI+DQrCoCAyODc3wqAgwqAgwqAg
wqAgwqAgcGRhdGEgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnBkYXRhKSwgR0ZQX0tFUk5F
TCk7PGJyPg0KwqAgMjg3OMKgIMKgIMKgIMKgIMKgIGlmICghcGRhdGEpPGJyPg0KwqAgMjg3OcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVybiBFUlJfUFRSKC1FTk9NRU0pOzxicj4NCsKg
IDI4ODA8YnI+DQrCoCAyODgxwqAgwqAgwqAgwqAgwqAgLyogZmluZCByZXNldCBjb250cm9sbGVy
IHdoZW4gZXhpc3QgKi88YnI+DQomZ3Q7IDI4ODLCoCDCoCDCoCDCoCDCoCBwZGF0YS0mZ3Q7cnN0
YyA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRfb3B0aW9uYWwoZGV2LCBOVUxMKTs8YnI+DQrCoCAy
ODgzwqAgwqAgwqAgwqAgwqAgaWYgKElTX0VSUihwZGF0YS0mZ3Q7cnN0YykpIHs8YnI+DQrCoCAy
ODg0wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKFBUUl9FUlIocGRhdGEtJmd0O3JzdGMp
ID09IC1FUFJPQkVfREVGRVIpPGJyPg0KwqAgMjg4NcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHJldHVybiBFUlJfUFRSKC1FUFJPQkVfREVGRVIpOzxicj4NCiZndDsgMjg4
NsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBkYXRhLSZndDtyc3RjID0gTlVMTDs8YnI+DQrC
oCAyODg3wqAgwqAgwqAgwqAgwqAgfTxicj4NCsKgIDI4ODg8YnI+DQrCoCAyODg5wqAgwqAgwqAg
wqAgwqAgLyogZmluZCBvdXQgbnVtYmVyIG9mIHNsb3RzIHN1cHBvcnRlZCAqLzxicj4NCsKgIDI4
OTDCoCDCoCDCoCDCoCDCoCBvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwgJnF1b3Q7bnVtLXNsb3Rz
JnF1b3Q7LCAmYW1wO3BkYXRhLSZndDtudW1fc2xvdHMpOzxicj4NCsKgIDI4OTE8YnI+DQrCoCAy
ODkywqAgwqAgwqAgwqAgwqAgaWYgKG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAmcXVvdDtmaWZv
LWRlcHRoJnF1b3Q7LCAmYW1wO3BkYXRhLSZndDtmaWZvX2RlcHRoKSk8YnI+DQrCoCAyODkzwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZGV2X2luZm8oZGV2LDxicj4NCsKgIDI4OTTCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O2ZpZm8tZGVwdGggcHJvcGVy
dHkgbm90IGZvdW5kLCB1c2luZyB2YWx1ZSBvZiBGSUZPVEggcmVnaXN0ZXIgYXMgZGVmYXVsdFxu
JnF1b3Q7KTs8YnI+DQrCoCAyODk1PGJyPg0KwqAgMjg5NsKgIMKgIMKgIMKgIMKgIG9mX3Byb3Bl
cnR5X3JlYWRfdTMyKG5wLCAmcXVvdDtjYXJkLWRldGVjdC1kZWxheSZxdW90OywgJmFtcDtwZGF0
YS0mZ3Q7ZGV0ZWN0X2RlbGF5X21zKTs8YnI+DQrCoCAyODk3PGJyPg0KwqAgMjg5OMKgIMKgIMKg
IMKgIMKgIGlmICghb2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICZxdW90O2Nsb2NrLWZyZXF1ZW5j
eSZxdW90OywgJmFtcDtjbG9ja19mcmVxdWVuY3kpKTxicj4NCsKgIDI4OTnCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBwZGF0YS0mZ3Q7YnVzX2h6ID0gY2xvY2tfZnJlcXVlbmN5Ozxicj4NCsKg
IDI5MDA8YnI+DQrCoCAyOTAxwqAgwqAgwqAgwqAgwqAgaWYgKGRydl9kYXRhICZhbXA7JmFtcDsg
ZHJ2X2RhdGEtJmd0O3BhcnNlX2R0KSB7PGJyPg0KwqAgMjkwMsKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHJldCA9IGRydl9kYXRhLSZndDtwYXJzZV9kdChob3N0KTs8YnI+DQrCoCAyOTAzwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKHJldCk8YnI+DQrCoCAyOTA0wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuIEVSUl9QVFIocmV0KTs8YnI+DQrCoCAy
OTA1wqAgwqAgwqAgwqAgwqAgfTxicj4NCsKgIDI5MDY8YnI+DQrCoCAyOTA3wqAgwqAgwqAgwqAg
wqAgaWYgKG9mX2ZpbmRfcHJvcGVydHkobnAsICZxdW90O3N1cHBvcnRzLWhpZ2hzcGVlZCZxdW90
OywgTlVMTCkpIHs8YnI+DQrCoCAyOTA4wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZGV2X2lu
Zm8oZGV2LCAmcXVvdDtzdXBwb3J0cy1oaWdoc3BlZWQgcHJvcGVydHkgaXMgZGVwcmVjYXRlZC5c
biZxdW90Oyk7PGJyPg0KwqAgMjkwOcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBkYXRhLSZn
dDtjYXBzIHw9IE1NQ19DQVBfU0RfSElHSFNQRUVEIHwgTU1DX0NBUF9NTUNfSElHSFNQRUVEOzxi
cj4NCsKgIDI5MTDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KwqAgMjkxMTxicj4NCsKgIDI5MTLCoCDC
oCDCoCDCoCDCoCByZXR1cm4gcGRhdGE7PGJyPg0KwqAgMjkxM8KgIH08YnI+DQrCoCAyOTE0PGJy
Pg0KwqAgMjkxNcKgICNlbHNlIC8qIENPTkZJR19PRiAqLzxicj4NCsKgIDI5MTbCoCBzdGF0aWMg
c3RydWN0IGR3X21jaV9ib2FyZCAqZHdfbWNpX3BhcnNlX2R0KHN0cnVjdCBkd19tY2kgKmhvc3Qp
PGJyPg0KwqAgMjkxN8KgIHs8YnI+DQrCoCAyOTE4wqAgwqAgwqAgwqAgwqAgcmV0dXJuIEVSUl9Q
VFIoLUVJTlZBTCk7PGJyPg0KwqAgMjkxOcKgIH08YnI+DQrCoCAyOTIwwqAgI2VuZGlmIC8qIENP
TkZJR19PRiAqLzxicj4NCsKgIDI5MjE8YnI+DQrCoCAyOTIywqAgc3RhdGljIHZvaWQgZHdfbWNp
X2VuYWJsZV9jZChzdHJ1Y3QgZHdfbWNpICpob3N0KTxicj4NCsKgIDI5MjPCoCB7PGJyPg0KwqAg
MjkyNMKgIMKgIMKgIMKgIMKgIHVuc2lnbmVkIGxvbmcgaXJxZmxhZ3M7PGJyPg0KwqAgMjkyNcKg
IMKgIMKgIMKgIMKgIHUzMiB0ZW1wOzxicj4NCsKgIDI5MjbCoCDCoCDCoCDCoCDCoCBpbnQgaTs8
YnI+DQrCoCAyOTI3wqAgwqAgwqAgwqAgwqAgc3RydWN0IGR3X21jaV9zbG90ICpzbG90Ozxicj4N
CsKgIDI5Mjg8YnI+DQrCoCAyOTI5wqAgwqAgwqAgwqAgwqAgLyo8YnI+DQrCoCAyOTMwwqAgwqAg
wqAgwqAgwqAgwqAqIE5vIG5lZWQgZm9yIENEIGlmIGFsbCBzbG90cyBoYXZlIGEgbm9uLWVycm9y
IEdQSU88YnI+DQrCoCAyOTMxwqAgwqAgwqAgwqAgwqAgwqAqIGFzIHdlbGwgYXMgYnJva2VuIGNh
cmQgZGV0ZWN0aW9uIGlzIGZvdW5kLjxicj4NCsKgIDI5MzLCoCDCoCDCoCDCoCDCoCDCoCovPGJy
Pg0KwqAgMjkzM8KgIMKgIMKgIMKgIMKgIGZvciAoaSA9IDA7IGkgJmx0OyBob3N0LSZndDtudW1f
c2xvdHM7IGkrKykgezxicj4NCsKgIDI5MzTCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzbG90
ID0gaG9zdC0mZ3Q7c2xvdFtpXTs8YnI+DQrCoCAyOTM1wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgaWYgKHNsb3QtJmd0O21tYy0mZ3Q7Y2FwcyAmYW1wOyBNTUNfQ0FQX05FRURTX1BPTEwpPGJy
Pg0KwqAgMjkzNsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVybjs8
YnI+DQrCoCAyOTM3PGJyPg0KwqAgMjkzOMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChJ
U19FUlJfVkFMVUUobW1jX2dwaW9fZ2V0X2NkKHNsb3QtJmd0O21tYykpKTxicj4NCsKgIDI5MznC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBicmVhazs8YnI+DQrCoCAyOTQw
wqAgwqAgwqAgwqAgwqAgfTxicj4NCsKgIDI5NDHCoCDCoCDCoCDCoCDCoCBpZiAoaSA9PSBob3N0
LSZndDtudW1fc2xvdHMpPGJyPg0KwqAgMjk0MsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJl
dHVybjs8YnI+DQrCoCAyOTQzPGJyPg0KwqAgMjk0NMKgIMKgIMKgIMKgIMKgIHNwaW5fbG9ja19p
cnFzYXZlKCZhbXA7aG9zdC0mZ3Q7aXJxX2xvY2ssIGlycWZsYWdzKTs8YnI+DQrCoCAyOTQ1wqAg
wqAgwqAgwqAgwqAgdGVtcCA9IG1jaV9yZWFkbChob3N0LCBJTlRNQVNLKTs8YnI+DQrCoCAyOTQ2
wqAgwqAgwqAgwqAgwqAgdGVtcMKgIHw9IFNETU1DX0lOVF9DRDs8YnI+DQrCoCAyOTQ3wqAgwqAg
wqAgwqAgwqAgbWNpX3dyaXRlbChob3N0LCBJTlRNQVNLLCB0ZW1wKTs8YnI+DQrCoCAyOTQ4wqAg
wqAgwqAgwqAgwqAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYW1wO2hvc3QtJmd0O2lycV9sb2Nr
LCBpcnFmbGFncyk7PGJyPg0KwqAgMjk0OcKgIH08YnI+DQrCoCAyOTUwPGJyPg0KwqAgMjk1McKg
IGludCBkd19tY2lfcHJvYmUoc3RydWN0IGR3X21jaSAqaG9zdCk8YnI+DQrCoCAyOTUywqAgezxi
cj4NCsKgIDI5NTPCoCDCoCDCoCDCoCDCoCBjb25zdCBzdHJ1Y3QgZHdfbWNpX2Rydl9kYXRhICpk
cnZfZGF0YSA9IGhvc3QtJmd0O2Rydl9kYXRhOzxicj4NCsKgIDI5NTTCoCDCoCDCoCDCoCDCoCBp
bnQgd2lkdGgsIGksIHJldCA9IDA7PGJyPg0KwqAgMjk1NcKgIMKgIMKgIMKgIMKgIHUzMiBmaWZv
X3NpemU7PGJyPg0KwqAgMjk1NsKgIMKgIMKgIMKgIMKgIGludCBpbml0X3Nsb3RzID0gMDs8YnI+
DQrCoCAyOTU3PGJyPg0KwqAgMjk1OMKgIMKgIMKgIMKgIMKgIGlmICghaG9zdC0mZ3Q7cGRhdGEp
IHs8YnI+DQrCoCAyOTU5wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaG9zdC0mZ3Q7cGRhdGEg
PSBkd19tY2lfcGFyc2VfZHQoaG9zdCk7PGJyPg0KwqAgMjk2MMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIGlmIChQVFJfRVJSKGhvc3QtJmd0O3BkYXRhKSA9PSAtRVBST0JFX0RFRkVSKTxicj4N
CsKgIDI5NjHCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gLUVQ
Uk9CRV9ERUZFUjs8YnI+DQrCoCAyOTYywqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZWxzZSBp
ZiAoSVNfRVJSKGhvc3QtJmd0O3BkYXRhKSkgezxicj4NCsKgIDI5NjPCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBkZXZfZXJyKGhvc3QtJmd0O2RldiwgJnF1b3Q7cGxhdGZv
cm0gZGF0YSBub3QgYXZhaWxhYmxlXG4mcXVvdDspOzxicj4NCsKgIDI5NjTCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gLUVJTlZBTDs8YnI+DQrCoCAyOTY1wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCsKgIDI5NjbCoCDCoCDCoCDCoCDCoCB9PGJy
Pg0KwqAgMjk2Nzxicj4NCsKgIDI5NjjCoCDCoCDCoCDCoCDCoCBob3N0LSZndDtiaXVfY2xrID0g
ZGV2bV9jbGtfZ2V0KGhvc3QtJmd0O2RldiwgJnF1b3Q7Yml1JnF1b3Q7KTs8YnI+DQrCoCAyOTY5
wqAgwqAgwqAgwqAgwqAgaWYgKElTX0VSUihob3N0LSZndDtiaXVfY2xrKSkgezxicj4NCsKgIDI5
NzDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBkZXZfZGJnKGhvc3QtJmd0O2RldiwgJnF1b3Q7
Yml1IGNsb2NrIG5vdCBhdmFpbGFibGVcbiZxdW90Oyk7PGJyPg0KwqAgMjk3McKgIMKgIMKgIMKg
IMKgIH0gZWxzZSB7PGJyPg0KwqAgMjk3MsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldCA9
IGNsa19wcmVwYXJlX2VuYWJsZShob3N0LSZndDtiaXVfY2xrKTs8YnI+DQrCoCAyOTczwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKHJldCkgezxicj4NCsKgIDI5NzTCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBkZXZfZXJyKGhvc3QtJmd0O2RldiwgJnF1b3Q7ZmFp
bGVkIHRvIGVuYWJsZSBiaXUgY2xvY2tcbiZxdW90Oyk7PGJyPg0KwqAgMjk3NcKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVybiByZXQ7PGJyPg0KwqAgMjk3NsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQrCoCAyOTc3wqAgwqAgwqAgwqAgwqAgfTxicj4N
CsKgIDI5Nzg8YnI+DQrCoCAyOTc5wqAgwqAgwqAgwqAgwqAgaG9zdC0mZ3Q7Y2l1X2NsayA9IGRl
dm1fY2xrX2dldChob3N0LSZndDtkZXYsICZxdW90O2NpdSZxdW90Oyk7PGJyPg0KwqAgMjk4MMKg
IMKgIMKgIMKgIMKgIGlmIChJU19FUlIoaG9zdC0mZ3Q7Y2l1X2NsaykpIHs8YnI+DQrCoCAyOTgx
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZGV2X2RiZyhob3N0LSZndDtkZXYsICZxdW90O2Np
dSBjbG9jayBub3QgYXZhaWxhYmxlXG4mcXVvdDspOzxicj4NCsKgIDI5ODLCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBob3N0LSZndDtidXNfaHogPSBob3N0LSZndDtwZGF0YS0mZ3Q7YnVzX2h6
Ozxicj4NCsKgIDI5ODPCoCDCoCDCoCDCoCDCoCB9IGVsc2Ugezxicj4NCsKgIDI5ODTCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCByZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoaG9zdC0mZ3Q7Y2l1
X2Nsayk7PGJyPg0KwqAgMjk4NcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChyZXQpIHs8
YnI+DQrCoCAyOTg2wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZGV2X2Vy
cihob3N0LSZndDtkZXYsICZxdW90O2ZhaWxlZCB0byBlbmFibGUgY2l1IGNsb2NrXG4mcXVvdDsp
Ozxicj4NCsKgIDI5ODfCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBnb3Rv
IGVycl9jbGtfYml1Ozxicj4NCsKgIDI5ODjCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJy
Pg0KwqAgMjk4OTxicj4NCsKgIDI5OTDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAoaG9z
dC0mZ3Q7cGRhdGEtJmd0O2J1c19oeikgezxicj4NCsKgIDI5OTHCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCByZXQgPSBjbGtfc2V0X3JhdGUoaG9zdC0mZ3Q7Y2l1X2Nsaywg
aG9zdC0mZ3Q7cGRhdGEtJmd0O2J1c19oeik7PGJyPg0KwqAgMjk5MsKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChyZXQpPGJyPg0KwqAgMjk5M8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGRldl93YXJuKGhvc3QtJmd0O2Rl
diw8YnI+DQrCoCAyOTk0wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDtVbmFibGUgdG8gc2V0IGJ1cyByYXRlIHRvICV1
SHpcbiZxdW90Oyw8YnI+DQrCoCAyOTk1wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBob3N0LSZndDtwZGF0YS0mZ3Q7YnVzX2h6
KTs8YnI+DQrCoCAyOTk2wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCsKgIDI5OTfC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBob3N0LSZndDtidXNfaHogPSBjbGtfZ2V0X3JhdGUo
aG9zdC0mZ3Q7Y2l1X2Nsayk7PGJyPg0KwqAgMjk5OMKgIMKgIMKgIMKgIMKgIH08YnI+DQrCoCAy
OTk5PGJyPg0KwqAgMzAwMMKgIMKgIMKgIMKgIMKgIGlmICghaG9zdC0mZ3Q7YnVzX2h6KSB7PGJy
Pg0KwqAgMzAwMcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGRldl9lcnIoaG9zdC0mZ3Q7ZGV2
LDxicj4NCsKgIDMwMDLCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVv
dDtQbGF0Zm9ybSBkYXRhIG11c3Qgc3VwcGx5IGJ1cyBzcGVlZFxuJnF1b3Q7KTs8YnI+DQrCoCAz
MDAzwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0ID0gLUVOT0RFVjs8YnI+DQrCoCAzMDA0
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ290byBlcnJfY2xrX2NpdTs8YnI+DQrCoCAzMDA1
wqAgwqAgwqAgwqAgwqAgfTxicj4NCsKgIDMwMDY8YnI+DQrCoCAzMDA3wqAgwqAgwqAgwqAgwqAg
aWYgKGRydl9kYXRhICZhbXA7JmFtcDsgZHJ2X2RhdGEtJmd0O2luaXQpIHs8YnI+DQrCoCAzMDA4
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0ID0gZHJ2X2RhdGEtJmd0O2luaXQoaG9zdCk7
PGJyPg0KwqAgMzAwOcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChyZXQpIHs8YnI+DQrC
oCAzMDEwwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZGV2X2Vycihob3N0
LSZndDtkZXYsPGJyPg0KwqAgMzAxMcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgICZxdW90O2ltcGxlbWVudGF0aW9uIHNwZWNpZmljIGluaXQgZmFpbGVk
XG4mcXVvdDspOzxicj4NCsKgIDMwMTLCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBnb3RvIGVycl9jbGtfY2l1Ozxicj4NCsKgIDMwMTPCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB9PGJyPg0KwqAgMzAxNMKgIMKgIMKgIMKgIMKgIH08YnI+DQrCoCAzMDE1PGJyPg0KwqAg
MzAxNsKgIMKgIMKgIMKgIMKgIGlmIChkcnZfZGF0YSAmYW1wOyZhbXA7IGRydl9kYXRhLSZndDtz
ZXR1cF9jbG9jaykgezxicj4NCsKgIDMwMTfCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXQg
PSBkcnZfZGF0YS0mZ3Q7c2V0dXBfY2xvY2soaG9zdCk7PGJyPg0KwqAgMzAxOMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIGlmIChyZXQpIHs8YnI+DQrCoCAzMDE5wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgZGV2X2Vycihob3N0LSZndDtkZXYsPGJyPg0KwqAgMzAyMMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZxdW90O2lt
cGxlbWVudGF0aW9uIHNwZWNpZmljIGNsb2NrIHNldHVwIGZhaWxlZFxuJnF1b3Q7KTs8YnI+DQrC
oCAzMDIxwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ290byBlcnJfY2xr
X2NpdTs8YnI+DQrCoCAzMDIywqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCsKgIDMw
MjPCoCDCoCDCoCDCoCDCoCB9PGJyPg0KwqAgMzAyNDxicj4NCsKgIDMwMjXCoCDCoCDCoCDCoCDC
oCBpZiAoaG9zdC0mZ3Q7cGRhdGEtJmd0O3JzdGMgIT0gTlVMTCk8YnI+DQomZ3Q7IDMwMjbCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXNldF9jb250cm9sX2RlYXNzZXJ0KGhvc3QtJmd0O3Bk
YXRhLSZndDtyc3RjKTs8YnI+DQrCoCAzMDI3PGJyPg0KwqAgMzAyOMKgIMKgIMKgIMKgIMKgIHNl
dHVwX3RpbWVyKCZhbXA7aG9zdC0mZ3Q7Y21kMTFfdGltZXIsPGJyPg0KwqAgMzAyOcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGR3X21jaV9jbWQxMV90aW1lciwgKHVuc2lnbmVkIGxv
bmcpaG9zdCk7PGJyPg0KPGJyPg0KLS0tPGJyPg0KMC1EQVkga2VybmVsIHRlc3QgaW5mcmFzdHJ1
Y3R1cmXCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBPcGVuIFNvdXJjZSBUZWNobm9sb2d5IENlbnRl
cjxicj4NCjxhIGhyZWY9Imh0dHBzOi8vbGlzdHMuMDEub3JnL3BpcGVybWFpbC9rYnVpbGQtYWxs
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpc3RzLjAxLm9yZy9w
aXBlcm1haWwva2J1aWxkLWFsbDwvYT7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEludGVs
IENvcnBvcmF0aW9uPGJyPg0KPC9ibG9ja3F1b3RlPjwvZGl2Pjxicj48L2Rpdj4NCg==
--001a11418fde293bed052d5f62d2--
