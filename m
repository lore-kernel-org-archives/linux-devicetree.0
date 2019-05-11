From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] arm64: dts: amlogic: remove ethernet-phy-idAAAA.BBBB
 compatible strings
Date: Sat, 11 May 2019 21:51:50 +0200
Message-ID: <20190511195150.GI4889@lunn.ch>
References: <20190511174534.2403-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190511174534.2403-1-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: khilman@baylibre.com, devicetree@vger.kernel.org, jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, May 11, 2019 at 07:45:34PM +0200, Martin Blumenstingl wrote:
> The Ethernet PHY documentation
> (Documentation/devicetree/bindings/net/phy.txt) states that:
>   If the PHY reports an incorrect ID (or none at all) then the
>   "compatible" list may contain an entry with the correct PHY ID in the
>   form: "ethernet-phy-idAAAA.BBBB"
> 
> An older version of the documentation suggested that the compatible
> string can be used when the PHY ID is known.
> 
> Remove the ethernet-phy-id compatible string and add a comment with the
> PHY ID instead.
> This is a no-op on boards which are shipped with the PHY that was
> listed (= all known cases). However, if a board manufacturer decides to
> ship a different PHY we will now load and use the correct driver because
> we ask the PHY to identify itself.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
 
Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
