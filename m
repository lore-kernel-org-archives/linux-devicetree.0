From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCHv2 7/7] ARM: dts: Add Altera Arria10 OCRAM EDAC devicetree
 entry
Date: Tue, 5 Apr 2016 13:44:10 -0500
Message-ID: <alpine.DEB.2.02.1604051343040.32718@linux-builds1>
References: <1459450087-24792-1-git-send-email-tthayer@opensource.altera.com>
 <1459450087-24792-8-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1459450087-24792-8-git-send-email-tthayer@opensource.altera.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, bp@alien8.de, dougthompson@xmission.com, grant.likely@linaro.org, linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org, m.chehab@samsung.com
List-Id: devicetree@vger.kernel.org

On Thu, 31 Mar 2016, tthayer@opensource.altera.com wrote:

> From: Thor Thayer <tthayer@opensource.altera.com>
> 
> Add the device tree entries needed to support the Altera On-Chip
> RAM EDAC on the Arria10 chip.
> 
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
> v2: No change
> ---
>  arch/arm/boot/dts/socfpga_arria10.dtsi |    5 +++++
>  1 file changed, 5 insertions(+)

I've applied this patch and will take through the arm-soc tree.

Thanks,
Dinh
