From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/4] dt-bindings: arm: Document SoC compatible value for
 Armadillo-800 EVA
Date: Tue, 27 Feb 2018 09:17:21 +0100
Message-ID: <20180227081720.ejxqgr5zbufxkfmi@verge.net.au>
References: <1519668225-12548-1-git-send-email-geert+renesas@glider.be>
 <1519668225-12548-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1519668225-12548-2-git-send-email-geert+renesas@glider.be>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 26, 2018 at 07:03:42PM +0100, Geert Uytterhoeven wrote:
> The compatible property of the root node in a DTS for Atmark Techno
> Armadillo-800 EVA should include the compatible value for the R-Mobile
> A1 SoC, too.
> 
> Fixes: d2c2a0776899ba2d ("ARM: shmobile: Add platform device tree bindings documentation")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
