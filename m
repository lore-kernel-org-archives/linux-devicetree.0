From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH v10 03/12] mfd: palmas add variant and OTP detection
Date: Fri, 5 Apr 2013 18:32:23 +0200
Message-ID: <20130405163223.GO17363@zurbaran>
References: <1363964122-19201-1-git-send-email-ian@slimlogic.co.uk>
 <1363964122-19201-4-git-send-email-ian@slimlogic.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1363964122-19201-4-git-send-email-ian@slimlogic.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ian Lartey <ian@slimlogic.co.uk>
Cc: linux-doc@vger.kernel.org, linus.walleij@linaro.org, lgirdwood@gmail.com, grant.likely@secretlab.ca, wim@iguana.be, ldewangan@nvidia.com, gg@slimlogic.co.uk, linux-leds@vger.kernel.org, sfr@canb.auug.org.au, mturquette@linaro.org, linux-watchdog@vger.kernel.org, swarren@wwwdotorg.org, devicetree-discuss@lists.ozlabs.org, cooloney@gmail.com, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org, j-keerthy@ti.com, broonie@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org, t-kristo@ti.com, rpurdie@rpsys.net, rob@landley.net, akpm@linux-foundation.org
List-Id: devicetree@vger.kernel.org

Hi Ian,

On Fri, Mar 22, 2013 at 02:55:13PM +0000, Ian Lartey wrote:
> @@ -278,20 +329,20 @@ static void palmas_dt_to_pdata(struct i2c_client *i2c,
>  	int ret;
>  	u32 prop;
>  
> -	ret = of_property_read_u32(node, "ti,mux_pad1", &prop);
> +	ret = of_property_read_u32(node, "ti,mux-pad1", &prop);
>  	if (!ret) {
>  		pdata->mux_from_pdata = 1;
>  		pdata->pad1 = prop;
>  	}
>  
> -	ret = of_property_read_u32(node, "ti,mux_pad2", &prop);
> +	ret = of_property_read_u32(node, "ti,mux-pad2", &prop);
>  	if (!ret) {
>  		pdata->mux_from_pdata = 1;
>  		pdata->pad2 = prop;
>  	}
>  
>  	/* The default for this register is all masked */
> -	ret = of_property_read_u32(node, "ti,power_ctrl", &prop);
> +	ret = of_property_read_u32(node, "ti,power-ctrl", &prop);
>  	if (!ret)
>  		pdata->power_ctrl = prop;
>  	else
> @@ -309,7 +360,7 @@ static int palmas_i2c_probe(struct i2c_client *i2c,
>  	struct palmas_platform_data *pdata;
>  	struct device_node *node = i2c->dev.of_node;
>  	int ret = 0, i;
> -	unsigned int reg, addr;
> +	unsigned int reg;
>  	int slave;
>  	struct mfd_cell *children;
The '-' to '_' fix has been sent by J Keerthy and is on my mfd-next tree
aready. Would you mind removing it from this patch ?

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
