From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCH 4/5] ARM: dts: Arria10 ECC Manager IRQ controller changes
Date: Fri, 3 Jun 2016 11:06:18 -0500
Message-ID: <alpine.DEB.2.02.1606031105540.1763@linux-builds1>
References: <1464193783-5071-1-git-send-email-tthayer@opensource.altera.com>
 <1464193783-5071-5-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1464193783-5071-5-git-send-email-tthayer@opensource.altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: tthayer@opensource.altera.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, tthayer.linux@gmail.com, robh+dt@kernel.org, bp@alien8.de, dougthompson@xmission.com, grant.likely@linaro.org, linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org, m.chehab@samsung.com
List-Id: devicetree@vger.kernel.org

On Wed, 25 May 2016, tthayer@opensource.altera.com wrote:

> From: Thor Thayer <tthayer@opensource.altera.com>
> 
> Changes to support IRQ controller implementation including adding
> new property irq-controller to eccmgr and adding IRQ property
> to children.
> 
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
>  arch/arm/boot/dts/socfpga_arria10.dtsi |    6 ++++++
>  1 file changed, 6 insertions(+)
>

Applied! 

Thanks,
Dinh
