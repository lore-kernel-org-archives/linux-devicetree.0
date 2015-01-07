From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v8] edac: synps: Added EDAC support for zynq ddr ecc
 controller
Date: Wed, 7 Jan 2015 11:54:30 +0100
Message-ID: <20150107105430.GA3984@pd.tnic>
References: <a728a8d4678f4dbf9de189a480297c3d@BY2FFO11FD034.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <a728a8d4678f4dbf9de189a480297c3d@BY2FFO11FD034.protection.gbl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, linux-doc@vger.kernel.org, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, michal.simek@xilinx.com, punnaia@xilinx.com, kalluripunnaiahchoudary@gmail.com, robh+dt@kernel.org, rob@landley.net, dougthompson@xmission.com, kpc528@gmail.com, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 06, 2015 at 11:13:47PM +0530, Punnaiah Choudary Kalluri wrote:
> Added EDAC support for reporting the ecc errors of synopsys ddr controller.
> The ddr ecc controller corrects single bit errors and detects double bit
> errors.
> 
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>

Applied and queued for 3.20,
thanks.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
