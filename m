From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v2 07/10] ASoC: cros_ec_codec: support WoV
Date: Sun, 6 Oct 2019 00:53:31 +0800
Message-ID: <201910060040.RXI5XB2W%lkp@intel.com>
References: <20191005164320.07.I5388b69a7a9c551078fed216a77440cee6dedf49@changeid>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <20191005164320.07.I5388b69a7a9c551078fed216a77440cee6dedf49@changeid>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, cychiang@google.com, drinkcat@google.com, robh+dt@kernel.org, tzungbi@google.com, broonie@kernel.org, kbuild-all@01.org, enric.balletbo@collabora.com, bleung@google.com, dgreid@google.com
List-Id: devicetree@vger.kernel.org

Hi Tzung-Bi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on asoc/for-next]
[cannot apply to v5.4-rc1 next-20191004]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Tzung-Bi-Shih/ASoC-mediatek-mt8183-mt6358-ts3a227-max98357-support-WoV/20191005-171021
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-rc1-42-g38eda53-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> sound/soc/codecs/cros_ec_codec.c:430:39: sparse: sparse: incorrect type in return expression (different address spaces) @@    expected void * @@    got void [noderef] <asvoid * @@
>> sound/soc/codecs/cros_ec_codec.c:430:39: sparse:    expected void *
>> sound/soc/codecs/cros_ec_codec.c:430:39: sparse:    got void [noderef] <asn:2> *
>> sound/soc/codecs/cros_ec_codec.c:549:69: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const volatile [noderef] <asn:2> * @@    got latile [noderef] <asn:2> * @@
>> sound/soc/codecs/cros_ec_codec.c:549:69: sparse:    expected void const volatile [noderef] <asn:2> *
>> sound/soc/codecs/cros_ec_codec.c:549:69: sparse:    got unsigned char [usertype] *addr
>> sound/soc/codecs/cros_ec_codec.c:698:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2> * @@    got latile [noderef] <asn:2> * @@
>> sound/soc/codecs/cros_ec_codec.c:698:33: sparse:    expected void volatile [noderef] <asn:2> *
>> sound/soc/codecs/cros_ec_codec.c:698:33: sparse:    got unsigned char [usertype] *wov_lang_shm_p
   sound/soc/codecs/cros_ec_codec.c:699:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2> * @@    got latile [noderef] <asn:2> * @@
   sound/soc/codecs/cros_ec_codec.c:699:48: sparse:    expected void volatile [noderef] <asn:2> *
>> sound/soc/codecs/cros_ec_codec.c:699:48: sparse:    got unsigned char [usertype] *

vim +430 sound/soc/codecs/cros_ec_codec.c

   406	
   407	static void *wov_map_shm(struct cros_ec_codec_priv *priv,
   408				 uint8_t shm_id, uint32_t *len, uint8_t *type)
   409	{
   410		struct ec_param_ec_codec p;
   411		struct ec_response_ec_codec_get_shm_addr r;
   412		uint32_t req, offset;
   413	
   414		p.cmd = EC_CODEC_GET_SHM_ADDR;
   415		p.get_shm_addr_param.shm_id = shm_id;
   416		if (send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC,
   417					 (uint8_t *)&p, sizeof(p),
   418					 (uint8_t *)&r, sizeof(r)) < 0) {
   419			dev_err(priv->dev, "failed to EC_CODEC_GET_SHM_ADDR\n");
   420			return NULL;
   421		}
   422	
   423		dev_dbg(priv->dev, "phys_addr=%#llx, len=%#x\n", r.phys_addr, r.len);
   424	
   425		*len = r.len;
   426		*type = r.type;
   427	
   428		switch (r.type) {
   429		case EC_CODEC_SHM_TYPE_EC_RAM:
 > 430			return devm_ioremap_wc(priv->dev,
   431					       r.phys_addr + priv->ec_shm_addr, r.len);
   432		case EC_CODEC_SHM_TYPE_SYSTEM_RAM:
   433			if (r.phys_addr) {
   434				dev_err(priv->dev, "unknown status\n");
   435				return NULL;
   436			}
   437	
   438			req = round_up(r.len, PAGE_SIZE);
   439			dev_dbg(priv->dev, "round up from %u to %u\n", r.len, req);
   440	
   441			if (priv->ap_shm_last_alloc + req >
   442			    priv->ap_shm_phys_addr + priv->ap_shm_len) {
   443				dev_err(priv->dev, "insufficient space for AP SHM\n");
   444				return NULL;
   445			}
   446	
   447			dev_dbg(priv->dev, "alloc AP SHM addr=%#llx, len=%#x\n",
   448				priv->ap_shm_last_alloc, req);
   449	
   450			p.cmd = EC_CODEC_SET_SHM_ADDR;
   451			p.set_shm_addr_param.phys_addr = priv->ap_shm_last_alloc;
   452			p.set_shm_addr_param.len = req;
   453			p.set_shm_addr_param.shm_id = shm_id;
   454			if (send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC,
   455						 (uint8_t *)&p, sizeof(p),
   456						 NULL, 0) < 0) {
   457				dev_err(priv->dev, "failed to EC_CODEC_SET_SHM_ADDR\n");
   458				return NULL;
   459			}
   460	
   461			/*
   462			 * Note: EC codec only requests for `r.len' but we allocate
   463			 * round up PAGE_SIZE `req'.
   464			 */
   465			offset = priv->ap_shm_last_alloc - priv->ap_shm_phys_addr;
   466			priv->ap_shm_last_alloc += req;
   467	
   468			return (void *)(uintptr_t)(priv->ap_shm_addr + offset);
   469		default:
   470			return NULL;
   471		}
   472	}
   473	
   474	static bool wov_queue_full(struct cros_ec_codec_priv *priv)
   475	{
   476		return ((priv->wov_wp + 1) % sizeof(priv->wov_buf)) == priv->wov_rp;
   477	}
   478	
   479	static size_t wov_queue_size(struct cros_ec_codec_priv *priv)
   480	{
   481		if (priv->wov_wp >= priv->wov_rp)
   482			return priv->wov_wp - priv->wov_rp;
   483		else
   484			return sizeof(priv->wov_buf) - priv->wov_rp + priv->wov_wp;
   485	}
   486	
   487	static void wov_queue_dequeue(struct cros_ec_codec_priv *priv, size_t len)
   488	{
   489		struct snd_pcm_runtime *runtime = priv->wov_substream->runtime;
   490		size_t req;
   491	
   492		while (len) {
   493			req = min(len, runtime->dma_bytes - priv->wov_dma_offset);
   494			if (priv->wov_wp >= priv->wov_rp)
   495				req = min(req, (size_t)priv->wov_wp - priv->wov_rp);
   496			else
   497				req = min(req, sizeof(priv->wov_buf) - priv->wov_rp);
   498	
   499			memcpy(runtime->dma_area + priv->wov_dma_offset,
   500			       priv->wov_buf + priv->wov_rp, req);
   501	
   502			priv->wov_dma_offset += req;
   503			if (priv->wov_dma_offset == runtime->dma_bytes)
   504				priv->wov_dma_offset = 0;
   505	
   506			priv->wov_rp += req;
   507			if (priv->wov_rp == sizeof(priv->wov_buf))
   508				priv->wov_rp = 0;
   509	
   510			len -= req;
   511		}
   512	
   513		snd_pcm_period_elapsed(priv->wov_substream);
   514	}
   515	
   516	static void wov_queue_try_dequeue(struct cros_ec_codec_priv *priv)
   517	{
   518		size_t period_bytes = snd_pcm_lib_period_bytes(priv->wov_substream);
   519	
   520		while (period_bytes && wov_queue_size(priv) >= period_bytes) {
   521			wov_queue_dequeue(priv, period_bytes);
   522			period_bytes = snd_pcm_lib_period_bytes(priv->wov_substream);
   523		}
   524	}
   525	
   526	static void wov_queue_enqueue(struct cros_ec_codec_priv *priv,
   527				      uint8_t *addr, size_t len, bool iomem)
   528	{
   529		size_t req;
   530	
   531		while (len) {
   532			if (wov_queue_full(priv)) {
   533				wov_queue_try_dequeue(priv);
   534	
   535				if (wov_queue_full(priv)) {
   536					dev_err(priv->dev, "overrun detected\n");
   537					return;
   538				}
   539			}
   540	
   541			if (priv->wov_wp >= priv->wov_rp)
   542				req = sizeof(priv->wov_buf) - priv->wov_wp;
   543			else
   544				/* Note: waste 1-byte to differentiate full and empty */
   545				req = priv->wov_rp - priv->wov_wp - 1;
   546			req = min(req, len);
   547	
   548			if (iomem)
 > 549				memcpy_fromio(priv->wov_buf + priv->wov_wp, addr, req);
   550			else
   551				memcpy(priv->wov_buf + priv->wov_wp, addr, req);
   552	
   553			priv->wov_wp += req;
   554			if (priv->wov_wp == sizeof(priv->wov_buf))
   555				priv->wov_wp = 0;
   556	
   557			addr += req;
   558			len -= req;
   559		}
   560	
   561		wov_queue_try_dequeue(priv);
   562	}
   563	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
