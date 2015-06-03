From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH 1/3] MIPS: prepare for user enabling of CONFIG_OF
Date: Wed, 3 Jun 2015 10:24:10 +0200
Message-ID: <20150603082410.GI9839@linux-mips.org>
References: <1433285204-4307-1-git-send-email-robh@kernel.org>
 <1433285204-4307-2-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <1433285204-4307-2-git-send-email-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 02, 2015 at 05:46:42PM -0500, Rob Herring wrote:

> In preparation to allow users to enable DeviceTree without arch or
> machine selecting it, we need to fix build errors on MIPS. When
> CONFIG_OF is enabled, device_tree_init cannot be resolved. This is
> trivially fixed by using CONFIG_USE_OF instead of CONFIG_OF for prom.h.

Want to take this through your tree?  If so,

Acked-by: Ralf Baechle <ralf@linux-mips.org>

  Ralf
