From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v6 5/5] ARM: DTS: da850: Add usb phy node
Date: Wed, 26 Oct 2016 15:56:27 +0530
Message-ID: <d55f19f2-beb3-a681-a6e9-c1d2c303173c@ti.com>
References: <1477451211-31979-1-git-send-email-david@lechnology.com>
 <1477451211-31979-6-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1477451211-31979-6-git-send-email-david@lechnology.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Axel Haslam <ahaslam@baylibre.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 26 October 2016 08:36 AM, David Lechner wrote:
> Add a node for the new usb phy driver.

changed this to:

    Add a node for usb phy device. This device
    controls both the USB 1.1 and USB 2.0 PHYs.

mainly because the node is for the device, not the driver.

> 
> Signed-off-by: David Lechner <david@lechnology.com>

Applied to v4.10/dt

Thanks,
Sekhar
