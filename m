From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 13/15] Documentation: devicetree: ravb: Add r8a77965
Date: Thu, 15 Feb 2018 16:45:34 +0100
Message-ID: <20180215154235.ndpizqzkciqyifun@verge.net.au>
References: <1518515162-23663-1-git-send-email-jacopo+renesas@jmondi.org>
 <1518515162-23663-14-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1518515162-23663-14-git-send-email-jacopo+renesas@jmondi.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, geert@linux-m68k.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 13, 2018 at 10:46:00AM +0100, Jacopo Mondi wrote:
> Add documentation for r8a77965 compatible string to renesas ravb device
> tree bindings documentation.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

This needs to be CCed to Sergei and netdev to proceed into mainline.

There are lot of examples and little consistency, but I believe a good
prefix and subject for the patch would be:

dt-bindings: net: ravb: Add support for r8a77965 SoC
