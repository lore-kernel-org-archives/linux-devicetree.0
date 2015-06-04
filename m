From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH 1/3] MIPS: prepare for user enabling of CONFIG_OF
Date: Thu, 04 Jun 2015 17:01:31 +0900
Message-ID: <20150604080131.8BF05C40D1F@trevor.secretlab.ca>
References: <1433285204-4307-1-git-send-email-robh@kernel.org>
        <1433285204-4307-2-git-send-email-robh@kernel.org>
        <20150603082410.GI9839@linux-mips.org>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20150603082410.GI9839@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Wed, 3 Jun 2015 10:24:10 +0200
, Ralf Baechle <ralf@linux-mips.org>
 wrote:
> On Tue, Jun 02, 2015 at 05:46:42PM -0500, Rob Herring wrote:
> 
> > In preparation to allow users to enable DeviceTree without arch or
> > machine selecting it, we need to fix build errors on MIPS. When
> > CONFIG_OF is enabled, device_tree_init cannot be resolved. This is
> > trivially fixed by using CONFIG_USE_OF instead of CONFIG_OF for prom.h.
> 
> Want to take this through your tree?  If so,
> 
> Acked-by: Ralf Baechle <ralf@linux-mips.org>
> 
>   Ralf

For the whole series:
Acked-by: Grant Likely <grant.likely@linaro.org>
