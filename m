From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 4/4] dts, altera: Arria10 SDRAM EDAC DTS additions.
Date: Fri, 15 May 2015 12:55:09 +0200
Message-ID: <5383549.sAl5szqT14@wuerfel>
References: <1431553787-27741-1-git-send-email-tthayer@opensource.altera.com>
 <1431553787-27741-5-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1431553787-27741-5-git-send-email-tthayer@opensource.altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, tthayer.linux@gmail.com, robh+dt@kernel.org, bp@alien8.de, tthayer@opensource.altera.com, dougthompson@xmission.com, grant.likely@linaro.org, dinguyen@opensource.altera.com, linux-edac@vger.kernel.org, m.chehab@samsung.com
List-Id: devicetree@vger.kernel.org

On Wednesday 13 May 2015 16:49:47 tthayer@opensource.altera.com wrote:
> +               sdr: sdr@ffc25000 {
> +                       compatible = "syscon";
> +                       reg = <0xffcfb100 0x80>;
> +               };
> +
> 

A syscon node with just 128 bytes seems very odd. Can you check the
hardware manual to see if this is part of some bigger unit?

	Arnd
