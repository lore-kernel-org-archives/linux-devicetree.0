From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCHv6] mtd: gpio-nand: add device tree bindings
Date: Fri, 14 Oct 2011 16:48:20 +0300
Message-ID: <1318600108.12351.130.camel@sauron>
References: <1318374618-26573-1-git-send-email-jamie@jamieiles.com>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1318374618-26573-1-git-send-email-jamie@jamieiles.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Jamie Iles <jamie@jamieiles.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Scott Wood <scottwood@freescale.com>, devicetree-discuss@lists.ozlabs.org, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2011-10-12 at 00:10 +0100, Jamie Iles wrote:
> +#ifdef CONFIG_OF
> +static const struct of_device_id gpio_nand_id_table[] = {
> +	{ .compatible = "gpio-control-nand" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, gpio_nand_id_table);
...
> +#else /* CONFIG_OF */
...
> +#endif /* CONFIG_OF */

I wonder, why it is either OF of platform data? What if I want my kernel
to fall-back to platform data if device tree data is absent? What is the
general policy? Sorry, I am not very well aware of the DT stuff. But off
the top of my head, it is logical when things go like this: I have a
kernel with working platform data, but I can change that dynamically by
feeding it a device tree configuration. Hmm?

-- 
Best Regards,
Artem Bityutskiy


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
