From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: ls1012a: Add FRWY-LS1012A device tree
 binding
Date: Sat, 8 Dec 2018 10:22:53 +0800
Message-ID: <20181208022252.GO3987@dragon>
References: <20181026084554.32290-1-pramod.kumar_1@nxp.com>
 <20181031064809.GF10386@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181031064809.GF10386@tiger>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pramod Kumar <pramod.kumar_1@nxp.com>, Rob Herring <robh@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Leo Li <leoyang.li@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 31, 2018 at 02:48:12PM +0800, Shawn Guo wrote:
> On Fri, Oct 26, 2018 at 08:45:26AM +0000, Pramod Kumar wrote:
> > LS1012A-FRWY is an ls1012a based SoC board
> > Add device tree binding for LS1012A-FRWY board
> > 
> > Signed-off-by: Pramod Kumar <pramod.kumar_1@nxp.com>
> 
> It should really be sent together with "arm64: dts: ls1012a: Add
> FRWY-LS1012A board support" as a patch series.
> 
> Applied, thanks.

I dropped this patch from my 4.21 queue for now, as Rob is moving the
bindings to json-schema during this development cycle.  I will add the
compatible back using json-schema format after 4.21-rc1 is available.

Shawn
