From: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH v3 07/10] ASoC: cros_ec_codec: support WoV
Date: Tue, 15 Oct 2019 14:49:41 +0800
Message-ID: <CA+Px+wXEpPbWgsQcrz3YVbH1-3z9Jgy3KM3H8o=O6T3M2Gbb2A@mail.gmail.com>
References: <20191014180059.07.I5388b69a7a9c551078fed216a77440cee6dedf49@changeid>
 <201910150924.II2vi71d%lkp@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <201910150924.II2vi71d%lkp@intel.com>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: kbuild test robot <lkp@intel.com>
Cc: Gwendal Grignou <gwendal@google.com>, devicetree@vger.kernel.org, ALSA development <alsa-devel@alsa-project.org>, kbuild-all@lists.01.org, Jimmy Cheng-Yi Chiang <cychiang@google.com>, Nicolas Boichat <drinkcat@google.com>, robh+dt@kernel.org, Mark Brown <broonie@kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Benson Leung <bleung@google.com>, Dylan Reid <dgreid@google.com>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 15, 2019 at 9:34 AM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Tzung-Bi,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on asoc/for-next]
> [cannot apply to v5.4-rc3 next-20191014]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Tzung-Bi-Shih/ASoC-mediatek-mt8183-mt6358-ts3a227-max98357-support-WoV/20191014-183227
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> config: x86_64-randconfig-g002-201941 (attached as .config)
> compiler: gcc-7 (Debian 7.4.0-13) 7.4.0
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=x86_64
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    sound/soc/codecs/cros_ec_codec.c: In function 'cros_ec_codec_platform_probe':
> >> sound/soc/codecs/cros_ec_codec.c:993:23: error: implicit declaration of function 'of_read_number'; did you mean 'wov_read_audio'? [-Werror=implicit-function-declaration]
>       priv->ec_shm_addr = of_read_number(regaddr_p, 2);
>                           ^~~~~~~~~~~~~~
>                           wov_read_audio
>    cc1: some warnings being treated as errors

The error is caused by EC_CODEC=y but CONFIG_OF is not set:
$ grep -e 'CONFIG_OF.*' -e 'EC_CODEC' config
# CONFIG_OF is not set
CONFIG_SND_SOC_CROS_EC_CODEC=y

>
> vim +993 sound/soc/codecs/cros_ec_codec.c
>
>    973
>    974  static int cros_ec_codec_platform_probe(struct platform_device *pdev)
>    975  {
>    976          struct device *dev = &pdev->dev;
>    977          struct cros_ec_device *ec_device = dev_get_drvdata(pdev->dev.parent);
>    978          struct cros_ec_codec_priv *priv;
>    979          struct device_node *node;
>    980          struct resource res;
>    981          struct ec_param_ec_codec p;
>    982          struct ec_response_ec_codec_get_capabilities r;
>    983          int ret;
>    984          u64 ec_shm_size;
>    985          const __be32 *regaddr_p;
>    986
>    987          priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>    988          if (!priv)
>    989                  return -ENOMEM;
>    990
>    991          regaddr_p = of_get_address(dev->of_node, 0, &ec_shm_size, NULL);
>    992          if (regaddr_p) {
>  > 993                  priv->ec_shm_addr = of_read_number(regaddr_p, 2);

In the case, the of_get_address( ) will get a dummy implementation
(https://elixir.bootlin.com/linux/v5.3.6/source/include/linux/of_address.h#L82)
while of_read_number( ) won't
(https://elixir.bootlin.com/linux/v5.3.6/source/include/linux/of.h#L234).

Rob, what do you think if we add a dummy implementation for
of_read_number( ) if !CONFIG_OF (i.e. after
https://elixir.bootlin.com/linux/v5.3.6/source/include/linux/of.h#L559)?
 Does it make sense?

>    994                  priv->ec_shm_len = ec_shm_size;
>    995
>    996                  dev_dbg(dev, "ec_shm_addr=%#llx len=%#x\n",
>    997                          priv->ec_shm_addr, priv->ec_shm_len);
>    998          }
>    999
>   1000          node = of_parse_phandle(dev->of_node, "memory-region", 0);
>   1001          if (node) {
>   1002                  ret = of_address_to_resource(node, 0, &res);
>   1003                  if (!ret) {
>   1004                          priv->ap_shm_phys_addr = res.start;
>   1005                          priv->ap_shm_len = resource_size(&res);
>   1006                          priv->ap_shm_addr =
>   1007                                  (uint64_t)(uintptr_t)devm_ioremap_wc(
>   1008                                          dev, priv->ap_shm_phys_addr,
>   1009                                          priv->ap_shm_len);
>   1010                          priv->ap_shm_last_alloc = priv->ap_shm_phys_addr;
>   1011
>   1012                          dev_dbg(dev, "ap_shm_phys_addr=%#llx len=%#x\n",
>   1013                                  priv->ap_shm_phys_addr, priv->ap_shm_len);
>   1014                  }
>   1015          }
>   1016
>   1017          priv->dev = dev;
>   1018          priv->ec_device = ec_device;
>   1019          atomic_set(&priv->dmic_probed, 0);
>   1020
>   1021          p.cmd = EC_CODEC_GET_CAPABILITIES;
>   1022          ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC,
>   1023                                     (uint8_t *)&p, sizeof(p),
>   1024                                     (uint8_t *)&r, sizeof(r));
>   1025          if (ret) {
>   1026                  dev_err(dev, "failed to EC_CODEC_GET_CAPABILITIES\n");
>   1027                  return ret;
>   1028          }
>   1029          priv->ec_capabilities = r.capabilities;
>   1030
>   1031          platform_set_drvdata(pdev, priv);
>   1032
>   1033          ret = devm_snd_soc_register_component(dev, &i2s_rx_component_driver,
>   1034                                                &i2s_rx_dai_driver, 1);
>   1035          if (ret)
>   1036                  return ret;
>   1037
>   1038          return devm_snd_soc_register_component(dev, &wov_component_driver,
>   1039                                                 &wov_dai_driver, 1);
>   1040  }
>   1041
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
