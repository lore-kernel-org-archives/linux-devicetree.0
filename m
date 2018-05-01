From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv2 1/3] Documentation: dt: socfpga: Add Stratix10 ECC
 Manager binding
Date: Tue, 1 May 2018 07:54:42 -0500
Message-ID: <20180501125442.GA12012@rob-hp-laptop>
References: <1524854238-19394-1-git-send-email-thor.thayer@linux.intel.com>
 <1524854238-19394-2-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1524854238-19394-2-git-send-email-thor.thayer@linux.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: thor.thayer@linux.intel.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, dinguyen@kernel.org, bp@alien8.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 27, 2018 at 01:37:16PM -0500, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Add the device tree bindings needed to support the Stratix10
> ECC Manager and SDRAM ECC.
> 
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
> v2  Remove unused System Manager syscon.
>     Remove unused SDRAM ECC register defines.
>     Remove unused address, size and range from bindings.
> ---
>  .../bindings/arm/altera/socfpga-eccmgr.txt         | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)

This should move to bindings/edac/. Can you do that as a follow-up 
patch?

Reviewed-by: Rob Herring <robh@kernel.org>
