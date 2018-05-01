From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH V2] ARM: DTS: da850-evm: use phandles to extend nodes
Date: Tue, 1 May 2018 16:27:32 +0530
Message-ID: <95295345-04fd-ff1e-8ad0-1e021bc986a5@ti.com>
References: <20180427094751.19120-1-aford173@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180427094751.19120-1-aford173@gmail.com>
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
To: Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, adam.ford@logicpd.com
List-Id: devicetree@vger.kernel.org

On Friday 27 April 2018 03:17 PM, Adam Ford wrote:
> Many node labels in the device tree (like serial0, serial1, etc) are being
> redefined, so let's modernize the device tree by using phandles to
> extend the existing nodes.  This helps reduce the whitespace.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Can you please resend this so it applies to v4.18/dt branch of my tree?
Also, the subject prefix should be "ARM: dts: ".

Thanks,
Sekhar
