From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/3] ehci-platform: add the max clock number to 4
Date: Mon, 01 Aug 2016 08:58:15 +0200
Message-ID: <2477355.hXm3xYUusy@wuerfel>
References: <20160731112536.4625-1-icenowy@aosc.xyz>
 <20160731112536.4625-3-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160731112536.4625-3-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Reinder de Haan <patchesrdh@mveas.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Tony Prisk <linux@prisktech.co.nz>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Icenowy Zheng <icenowy@aosc.xyz>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On Sunday, July 31, 2016 7:25:36 PM CEST Icenowy Zheng wrote:
> Allwinner A64 EHCI requires 4 clocks to be enabled.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> 

Can you say what those four clocks are?

Are you sure that it's not just a case of a clock being
incorrectly described in the clk driver, i.e. you reference
one clock along with its parent here?

	Arnd
