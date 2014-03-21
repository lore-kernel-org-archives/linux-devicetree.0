From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH RFC v2 0/6] drm/i2c: Move tda998x to a couple
 encoder/connector
Date: Fri, 21 Mar 2014 11:21:18 +0000
Message-ID: <20140321112118.GH7528@n2100.arm.linux.org.uk>
References: <cover.1395397665.git.moinejf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <cover.1395397665.git.moinejf@free.fr>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 21, 2014 at 11:27:45AM +0100, Jean-Francois Moine wrote:
> The 'slave encoder' structure of the tda998x driver asks for glue
> between the DRM driver and the encoder/connector structures.

Given how close we are to the coming merge window, that the discussion
about the of-graph bindings is still going on without concensus being
reached, and that this driver is not in staging, this needs to be
delayed until the following merge window when hopefully we have a
clearer picture about the DT side of this.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
