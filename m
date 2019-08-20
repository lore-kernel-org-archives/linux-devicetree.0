From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH 0/6] arm64: dts: ti: k3-j721e: Add gpio nodes
Date: Tue, 20 Aug 2019 18:19:26 +0530
Message-ID: <65efe3c5-8551-546f-5de6-0d9038cea757@ti.com>
References: <20190809082947.30590-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190809082947.30590-1-lokeshvutla@ti.com>
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
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>, linus.walleij@linaro.org
Cc: Keerthy <j-keerthy@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Tero,

On 09/08/19 1:59 PM, Lokesh Vutla wrote:
> This series adds gpio nodes for J721E SoC and enable gpio keys
> in J72E common process board.
> 
> Tested Boot log: https://pastebin.ubuntu.com/p/P6QqmZYtSC/
> 
> This series depends on Power-domain cells update series:
> https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=15210
Can you merge the patches 2-6?

Thanks and regards,
Lokesh
