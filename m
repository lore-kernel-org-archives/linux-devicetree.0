From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: BCM5310x switch support
Date: Mon, 13 Jun 2016 12:46:02 -0700
Message-ID: <575F0D7A.7040509@gmail.com>
References: <1465583756-26740-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1465583756-26740-1-git-send-email-f.fainelli@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: nbd@nbd.name, devicetree@vger.kernel.org, zajec5@gmail.com, bcm-kernel-feedback-list@broadcom.com, hauke@hauke-m.de
List-Id: devicetree@vger.kernel.org

On 06/10/2016 11:35 AM, Florian Fainelli wrote:
> Hi all,
> 
> This patch series adds the Device Tree changes needed to enable the
> Switch Register Access Block found on Broadcom BCM5301x SoCs.
> 
> First patch adds the SRAB block and the GMAC as child nodes of the BCMA
> bus so we get proper device_node/struct device parenting. The second patch
> defines the SRAB interrupts, and the last one defines the switch ports layouts
> according to the new DSA binding accepted in net-next:
> 
> https://git.kernel.org/cgit/linux/kernel/git/davem/net-next.git/commit/?id=8c5ad1d6179df31eea1b736c88296db6e3ffd25d
> 
> The B53 driver binding is defined here:
> 
> https://git.kernel.org/cgit/linux/kernel/git/davem/net-next.git/diff/Documentation/devicetree/bindings/net/dsa/b53.txt?id=967dd82ffc52e9d8ea0defde094f9a39a3f4eeed
> 
> Florian Fainelli (3):
>   ARM: dts: Enable SRAB switch and GMACs on 5301x DTS
>   ARM: dts: BCM5301X: Add SRAB interrupts
>   ARM: dts: BCM5310x: Enable switch ports on SmartRG SR400AC

Applied with Andrew's Reviewed-by tag and removed the labels in patch 3,
thanks
-- 
Florian
