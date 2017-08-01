From: Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH v2 0/4] Add DT support for davinci remoteproc driver
Date: Tue, 1 Aug 2017 11:55:41 -0500
Message-ID: <d03c1786-fd13-7fc0-aad1-dfa91ba50914@ti.com>
References: <20170801154844.24662-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170801154844.24662-1-s-anna@ti.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Robert Tivy <rtivy@ti.com>, Sekhar Nori <nsekhar@ti.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/01/2017 10:48 AM, Suman Anna wrote:
> Hi,
> 
> The following is v2 of the series [1] that adds the device tree support to
> the Davinci remoteproc driver. Patches are baselined on 4.13-rc1, the
> main dependent patches from the series "Davinci remoteproc cleanup/fixes"
> [2] and the resource name additions [3] were merged and available in
> mainline 4.13-rc1.
> 
> DTS nodes for the OMAP-L138 LCDK board will be added for a subsequent merge
> window once these patches are picked up.
> 
> Change summary for v2:
>  - Patches 1 and 2 are unchanged
>  - Binding in Patch 3 revised slightly to address Rob Herring's comments
>  - Patch 4 updated to deal with non-OF builds since Davinci platforms still
>    support non-DT boots.
> 
> regards
> Suman
> 
> [1] http://marc.info/?l=linux-arm-kernel&m=149514538506046&w=2

Oops, pasted the wrong link, correct link is
http://marc.info/?l=linux-arm-kernel&m=149583015432586&w=2

> [2] http://marc.info/?l=linux-arm-kernel&m=149514538506046&w=2
> [3] http://marc.info/?l=linux-kernel&m=149497287512869&w=2
> 
> Suman Anna (4):
>   remoteproc/davinci: Switch to platform_get_resource_byname()
>   remoteproc/davinci: Add support to parse internal memories
>   dt-bindings: remoteproc: Add bindings for Davinci DSP processors
>   remoteproc/davinci: Add device tree support for OMAP-L138 DSP
> 
>  .../bindings/remoteproc/ti,davinci-rproc.txt       | 86 +++++++++++++++++++
>  drivers/remoteproc/da8xx_remoteproc.c              | 98 ++++++++++++++++++++--
>  2 files changed, 179 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,davinci-rproc.txt
> 
