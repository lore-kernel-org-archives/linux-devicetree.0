From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v5 2/5] drm/dp: fix link probing for devices supporting DP 1.4+
Date: Tue, 25 Sep 2018 13:18:42 +0200
Message-ID: <18095829.BFmvNaydv0@phil>
References: <1537866837-4408-1-git-send-email-dkos@cadence.com> <1537866837-4408-3-git-send-email-dkos@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537866837-4408-3-git-send-email-dkos@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Damian Kos <dkos@cadence.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Gustavo Padovan <gustavo@padovan.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <sean@poorly.run>, Sandy Huang <hjc@rock-chips.com>, Quentin Schulz <quentin.schulz@free-electrons.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, pgaj@cadence.com, ltyrala@cadence.com, rafalc@cadence.com, jartur@cadence.com, piotrs@cadence.com, quentin.schulz@bootlin.com, jbergsagel@ti.com
List-Id: devicetree@vger.kernel.org

Hi Damian,

Am Dienstag, 25. September 2018, 11:13:32 CEST schrieb Damian Kos:
> From: Quentin Schulz <quentin.schulz@free-electrons.com>
> 
> DP 1.4 introduced a DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT bit in
> DP_TRAINING_AUX_RD_INTERVAL register. If set, DPCD registers from
> DP_DPCD_REV to DP_ADAPTER_CAP should be retrieved starting from
> DP_DPCD_REV_EXTENDED. All registers are copied except DP_DPCD_REV,
> DP_MAX_LINK_RATE and DP_DOWNSTREAMPORT_PRESENT which represent the
> "true capabilities" of DPRX device.
> 
> Original DP_DPCD_REV, DP_MAX_LINK_RATE and DP_DOWNSTREAMPORT_PRESENT
> might falsely return lower capabilities to "avoid interoperability
> issues with some of the existing DP Source devices that malfunction
> when they discover the higher capabilities within those three
> registers.".
> 
> Before DP 1.4, DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT bit was reserved
> and read 0 so it's safe to check against it even if DP revision is
> <1.4
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
> Signed-off-by: Damian Kos <dkos@cadence.com>

in v4 you received a
	Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
for this patch. If a patch is largely unchanged from one version to another
please add these previously received tags to the commit message.
This prevents people from reviewing needlessly stuff twice ;-) .

So the above should read

----- 8< -----
Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
Signed-off-by: Damian Kos <dkos@cadence.com>
Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
----- 8< -----


Heiko
