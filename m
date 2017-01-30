From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH V7 3/4] drm/bridge: Add driver for GE B850v3 LVDS/DP++
 Bridge
Date: Mon, 30 Jan 2017 19:05:31 +0200
Message-ID: <877f5ciilg.fsf@intel.com>
References: <cover.1483301745.git.peter.senna@collabora.com>
 <4232c88a99f44a24287d04d74b891e2eb139864c.1483301745.git.peter.senna@collabora.com>
 <759f96e2-43da-45ba-cf8d-55bc1f6e8442@codeaurora.org>
 <20170128141646.GA21291@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170128141646.GA21291@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Senna Tschudin <peter.senna@collabora.com>, Archit Taneja <architt@codeaurora.org>
Cc: mark.rutland@arm.com, martyn.welch@collabora.co.uk, daniel.vetter@ffwll.ch, peter.senna@gmail.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, ykk@rock-chips.com, jslaby@suse.cz, mchehab@osg.samsung.com, linux@armlinux.org.uk, javier@dowhile0.org, treding@nvidia.com, linux@roeck-us.net, martin.donnelly@ge.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, enric.balletbo@collabora.com, rmk+kernel@armlinux.org.uk, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org, tiwai@suse.com, kernel@pengutronix.de, galak@codeaurora.org, Fabio Estevam <fabio.estevam@nxp.com>, akpm@linux-foundation.org, shawnguo@kernel.org, davem@davemloft.net
List-Id: devicetree@vger.kernel.org

On Sat, 28 Jan 2017, Peter Senna Tschudin <peter.senna@collabora.com> wrote:
> On Thu, Jan 05, 2017 at 01:18:47PM +0530, Archit Taneja wrote:
> Hi Archit,
>
> Thank you for the comments!
>
> [...]
>> > +	total_size = (block[EDID_EXT_BLOCK_CNT] + 1) * EDID_LENGTH;
>> > +	if (total_size > EDID_LENGTH) {
>> > +		kfree(block);
>> > +		block = kmalloc(total_size, GFP_KERNEL);
>> > +		if (!block)
>> > +			return NULL;
>> > +
>> > +		/* Yes, read the entire buffer, and do not skip the first
>> > +		 * EDID_LENGTH bytes.
>> > +		 */
>> 
>> Is this the reason why you aren't using drm_do_get_edid()?
>
> Yes, for some hw specific reason, it is necessary to read the entire
> EDID buffer starting from 0, not block by block.

Hrmh, I'm planning on moving the edid override and firmware edid
mechanisms at the drm_do_get_edid() level to be able to truly and
transparently use a different edid. Currently, they're only used for
modes, really, and lead to some info retrieved from overrides, some from
the real edid. This kind of hacks will bypass the override/firmware edid
mechanisms then too. :(

BR,
Jani.


>
> [...]
>
> I fixed all your other suggestions. Thank you!
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Jani Nikula, Intel Open Source Technology Center
