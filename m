From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: [Patch v2 1/2] 5200/mpc: improve i2c bus error recovery
Date: Thu, 18 Feb 2010 14:23:57 +0100
Message-ID: <OFA4DA54B0.B66AC60E-ONC12576CE.004938F6-C12576CE.00499A98@transmode.se>
References: <1266433154.2322.0@antares>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1266433154.2322.0@antares>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: =?ISO-8859-15?Q?Albrecht_Dre=DF?= <albrecht.dress@arcor.de>
Cc: Linux PPC Development <linuxppc-dev@ozlabs.org>, Devicetree Discussions <devicetree-discuss@lists.ozlabs.org>, "Ben Dooks (embedded platforms)" <ben-linux@fluff.org>, "Ira W. Snyder" <iws@ovro.caltech.edu>
List-Id: devicetree@vger.kernel.org


> @@ -93,20 +94,23 @@ static irqreturn_t mpc_i2c_isr(int irq,
>   /* Sometimes 9th clock pulse isn't generated, and slave doesn't release
>    * the bus, because it wants to send ACK.
>    * Following sequence of enabling/disabling and sending start/stop generates
> - * the pulse, so it's all OK.
> + * the 9 pulses, so it's all OK.
>    */
>   static void mpc_i2c_fixup(struct mpc_i2c *i2c)
>   {
> -   writeccr(i2c, 0);
> -   udelay(30);
> -   writeccr(i2c, CCR_MEN);
> -   udelay(30);
> -   writeccr(i2c, CCR_MSTA | CCR_MTX);
> -   udelay(30);
> -   writeccr(i2c, CCR_MSTA | CCR_MTX | CCR_MEN);
> -   udelay(30);
> -   writeccr(i2c, CCR_MEN);
> -   udelay(30);
> +   int k;
> +   u32 delay_val = 1000000 / i2c->real_clk + 1;
> +
> +   if (delay_val < 2)
> +      delay_val = 2;
> +
> +   for (k = 9; k; k--) {
> +      writeccr(i2c, 0);
> +      writeccr(i2c, CCR_MSTA | CCR_MTX | CCR_MEN);
> +      udelay(delay_val);
> +      writeccr(i2c, CCR_MEN);
> +      udelay(delay_val << 1);
> +   }
>   }

I am curious, didn't old method work with by just wrapping
a for(k=9; k; k--) around it? How did the wave form look?

   Jocke
