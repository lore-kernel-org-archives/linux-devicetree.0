From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: enable touchpad button for
 rk3399-gru-kevin
Date: Sat, 14 Oct 2017 21:14:13 +0200
Message-ID: <6303636.5G9IA0odAe@phil>
References: <20171009184028.11829-1-kernel@esmil.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171009184028.11829-1-kernel@esmil.dk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Montag, 9. Oktober 2017, 20:40:28 CEST schrieb Emil Renner Berthing:
> Adding the linux,gpio-keymap entry also has
> the side-effect of making the driver register
> the touchpad as a touchpad rather than another
> touchscreen.
> 
> The index for BTN_LEFT was found by trial and error.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>

applied for 4.15 with Dmitry's Ack


Thanks
Heiko
