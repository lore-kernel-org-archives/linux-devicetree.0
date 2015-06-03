From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH] of: clean-up unnecessary libfdt include paths
Date: Wed, 3 Jun 2015 10:26:38 +0200
Message-ID: <20150603082638.GJ9839@linux-mips.org>
References: <1433308225-13874-1-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <1433308225-13874-1-git-send-email-robh@kernel.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linux-mips@linux-mips.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 03, 2015 at 12:10:25AM -0500, Rob Herring wrote:
> Date:   Wed,  3 Jun 2015 00:10:25 -0500
> From: Rob Herring <robh@kernel.org>
> To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
> Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh@kernel.org>,
>  Ralf Baechle <ralf@linux-mips.org>, Benjamin Herrenschmidt
>  <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
>  Ellerman <mpe@ellerman.id.au>, linux-mips@linux-mips.org,
>  linuxppc-dev@lists.ozlabs.org
> Subject: [PATCH] of: clean-up unnecessary libfdt include paths
> 
> With the latest dtc import include fixups, it is no longer necessary to
> add explicit include paths to use libfdt. Remove these across the
> kernel.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Grant Likely <grant.likely@linaro.org>
> Cc: linux-mips@linux-mips.org
> Cc: linuxppc-dev@lists.ozlabs.org

For the MIPS bits;

Acked-by: Ralf Baechle <ralf@linux-mips.org>

  Ralf
