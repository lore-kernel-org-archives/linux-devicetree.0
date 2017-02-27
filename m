From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/3] media: dt-bindings: vpif: extend the example with
 an output port
Date: Mon, 27 Feb 2017 16:46:15 -0600
Message-ID: <20170227224615.akogq6rccv3rwzrz@rob-hp-laptop>
References: <1487771027-7763-1-git-send-email-bgolaszewski@baylibre.com>
 <1487771027-7763-3-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1487771027-7763-3-git-send-email-bgolaszewski@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Patrick Titiano <ptitiano@baylibre.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 22, 2017 at 02:43:46PM +0100, Bartosz Golaszewski wrote:
> This makes the example more or less correspond with the da850-evm
> hardware setup.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  .../devicetree/bindings/media/ti,da850-vpif.txt    | 40 +++++++++++++++++-----
>  1 file changed, 32 insertions(+), 8 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
