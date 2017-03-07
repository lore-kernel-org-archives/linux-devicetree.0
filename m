From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v3 3/4] ARM: dts: da850-evm: add the UI expander node
Date: Tue, 7 Mar 2017 16:48:16 +0530
Message-ID: <217ae6a9-9ed4-5044-34ef-66848836d0ba@ti.com>
References: <1488298516-14363-1-git-send-email-bgolaszewski@baylibre.com>
 <1488298516-14363-4-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488298516-14363-4-git-send-email-bgolaszewski@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Patrick Titiano <ptitiano@baylibre.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tuesday 28 February 2017 09:45 PM, Bartosz Golaszewski wrote:
> We need the expander to be probed to allow the VPIF controller to
> receive interrupts from the video decoder.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This is basically an IO expander on UI card. So I modified subject line to:

"
ARM: dts: da850-evm: add IO expander node on UI card
"

while applying.

Thanks,
Sekhar
