From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 0/3] ARM: dts: sun6i: tablet dts changes
Date: Thu, 18 Aug 2016 20:02:14 +0200
Message-ID: <1471543337-6938-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Maxime and Chen-Yu,

Here is a v2 of the series I sent earlier today, changes:

-Add a 3th patch (patch 1/3) which I forgot in v1, the other
 2 patches actually depend on this one to apply without conflicts
-Name the added dtsi file sun6i-reference-design-tablet.dtsi instead
 of sun6i-a31-reference-design-tablet.dtsi, to be consistent with
 what we've done for sun5i / sun8i (and because it is valid for
 both A31 and A31s based tablets).

Regards,

Hans
