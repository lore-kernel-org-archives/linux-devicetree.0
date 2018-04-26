From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 2/3] edac: altera: Add support for Stratix10 SDRAM EDAC
Date: Thu, 26 Apr 2018 08:08:15 +0200
Message-ID: <20180426060815.GA7931@pd.tnic>
References: <1524594959-5259-1-git-send-email-thor.thayer@linux.intel.com>
 <1524594959-5259-3-git-send-email-thor.thayer@linux.intel.com>
 <2d310ff0-fa0e-e432-ae11-ba34080b4f6e@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <2d310ff0-fa0e-e432-ae11-ba34080b4f6e@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, thor.thayer@linux.intel.com, catalin.marinas@arm.com, will.deacon@arm.com, robh+dt@kernel.org, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 25, 2018 at 09:14:27PM -0500, Dinh Nguyen wrote:
> Does it make sense to have the support for this in separate files?

No. Per vendor or per uarch/processor type, standalone EDAC drivers are
fine. But not per the RAS capability of a functional unit.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
