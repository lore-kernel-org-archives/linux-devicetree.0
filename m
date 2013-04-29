From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: re: regulator: palma: add ramp delay support through regulator
 constraints
Date: Mon, 29 Apr 2013 20:32:28 +0300
Message-ID: <20130429173228.GA7024@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Laxman Dewangan,

The patch 28d1e8cd671a: "regulator: palma: add ramp delay support
through regulator constraints" from Apr 18, 2013, leads to the
following Smatch warning:
"drivers/regulator/palmas-regulator.c:843 palmas_regulators_probe()
	 warn: was || intended here instead of &&?"

drivers/regulator/palmas-regulator.c
   842  
   843                  if ((id == PALMAS_REG_SMPS6) && (id == PALMAS_REG_SMPS8))

"id" can't be equal to both.

   844                          ramp_delay_support = true;
   845  
   846                  if (ramp_delay_support) {
   847                          addr = palmas_regs_info[id].tstep_addr;
   848                          ret = palmas_smps_read(pmic->palmas, addr, &reg);
   849                          if (ret < 0) {

regards,
dan carpenter
