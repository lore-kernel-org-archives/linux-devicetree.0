From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/9] dt-bindings: power: Fix "debounce-interval" property
 misspelling
Date: Sun, 18 Feb 2018 21:05:38 -0600
Message-ID: <20180219030538.yioxsjaemoecxysk@rob-hp-laptop>
References: <1518531335-5170-1-git-send-email-geert+renesas@glider.be>
 <1518531335-5170-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1518531335-5170-2-git-send-email-geert+renesas@glider.be>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 13, 2018 at 03:15:27PM +0100, Geert Uytterhoeven wrote:
> "debounce_interval" was never supported.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---
> Please apply to your tree when appropriate.

Done.

> 
>  Documentation/devicetree/bindings/power/wakeup-source.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
