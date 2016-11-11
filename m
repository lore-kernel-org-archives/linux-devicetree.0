From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2 2/5] ARM: bus: da8xx-mstpri: new driver
Date: Fri, 11 Nov 2016 16:17:22 +0530
Message-ID: <dbf9924b-1d00-1c9d-192e-927f9bbe58c2@ti.com>
References: <1477925138-23457-1-git-send-email-bgolaszewski@baylibre.com>
 <1477925138-23457-3-git-send-email-bgolaszewski@baylibre.com>
 <20161109182433.vskk5rn7hfxshfy6@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161109182433.vskk5rn7hfxshfy6@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, linux-drm <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>, Frank Rowand <frowand.list@gmail.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 09 November 2016 11:54 PM, Rob Herring wrote:
> On Mon, Oct 31, 2016 at 03:45:35PM +0100, Bartosz Golaszewski wrote:
>> Create the driver for the da8xx master peripheral priority
>> configuration and implement support for writing to the three
>> Master Priority registers on da850 SoCs.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> ---
>>  .../devicetree/bindings/bus/ti,da850-mstpri.txt    |  20 ++
> 
> Acked-by: Rob Herring <robh@kernel.org>

Applied to v4.10/drivers

Thanks,
Sekhar
