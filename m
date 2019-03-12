From: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v3 1/4] drm: rockchip: introduce rk3066 hdmi
Date: Tue, 12 Mar 2019 19:10:33 +0100
Message-ID: <d53892e0-17f9-1c7f-b7d3-2794fad09207@gmail.com>
References: <20190302104116.1535-1-jbx6244@gmail.com>
 <20190302104116.1535-2-jbx6244@gmail.com>
 <20190303202308.GD13157@ravnborg.org>
 <b6b818d5-8c24-e01a-572e-97c1754c80e8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <b6b818d5-8c24-e01a-572e-97c1754c80e8@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, heiko@sntech.de, airlied@linux.ie, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 3/4/19 11:48 PM, Johan Jonker wrote:
>
> With regard to the bugs something between rc1 and rc8 results
> in a freeze on poweroff. Power domain doesn't seem to turn off
> the vop and hdmi in rc8.

The bug is due to a patch revert earlier this year.
To shutdown MK808 one can continue to use the patch at the link below
until this issue is fix by them.

drm/rockchip: shutdown drm subsystem on shutdown
https://patchwork.kernel.org/patch/10556151/

[for-4.20] Revert "drm/rockchip: Allow driver to be shutdown on
reboot/kexec"
https://patchwork.kernel.org/patch/10714725/
