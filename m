From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v2 07/19] tegra: fdt: Add LCD definitions for
	Tegra
Date: Thu, 12 Jul 2012 18:22:58 +0900
Message-ID: <4FFE9772.8010200@nvidia.com>
References: <1339604395-6621-1-git-send-email-sjg@chromium.org>
	<1339604395-6621-8-git-send-email-sjg@chromium.org>
	<4FDA749D.2030201@wwwdotorg.org>
	<CAPnjgZ2MUpjGS-BwQ6yASahFiu2OTWx4RUrJ7bkSkq72QmX++Q@mail.gmail.com>
	<20120711054842.GB10344@avionic-0098.mockup.avionic-design.de>
	<CAPnjgZ0Lv2rjVzNottsY+NWYmred5Au+hebUuTTOSAJufTkLjA@mail.gmail.com>
	<20120712084051.GA27022@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <20120712084051.GA27022@avionic-0098.adnet.avionic-design.de>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Stephen Warren <swarren@nvidia.com>, Devicetree@theia.denx.de, Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Thu 12 Jul 2012 05:40:51 PM JST, Thierry Reding wrote:
> Linux has a generic PWM backlight driver. This is currently solved by
> using this in the DT:
>
> 	backlight {
> 		compatible = "pwm-backlight";
> 		pwms = <&pwm 0 5000000>;
>
> 		brightness-levels = <0 4 8 16 32 64 128 255>;
> 		default-brightness-level = <6>;
> 	};
>
> Alex Courbot (Cc'd) has been working on adding a generic way to add GPIO
> and regulator support to that. I don't know exactly what the
> lvds-shutdown-gpios and panel-vdd-gpios properties do. If they control
> hardware connected behind the display controller I suppose they could go
> into the rgb node.

Thanks for bringing that back to light - the patches did not receive any 
feedback so far. If Simon wants to have a look, the one in the series 
that touches the device tree is here: https://lkml.org/lkml/2012/7/9/30

The idea is to extend pwm-backlight to support the GPIOs and regulators 
that may be related to the backlight, and order them into proper power 
sequences that were so far done by callbacks in board files. So your 
nvidia,pwm , nvidia,backlight-enable-gpios and 
nvidia,backlight-vdd-gpios properties would be moved into the backlight 
node and their appropriate power sequences (including any delay required 
by the panel specification) would be written.

Actually, the power sequences code is independent from the backlight and 
could be used in other areas as well. Looking at your panel node, which 
also uses gpios and has a timings table, it might make sense to use them 
there as well.

> The panel alternative that you propose sounds interesting as well. Maybe
> the panel should itself contain either a phandle or a subnode for the
> backlight and collect the properties that you listed above.

The panel and backlight should definitely be connected in some way. But 
since they are controlled independantly, I'm not sure about the 
implications of having them represented hierarchically in the DT.

Alex.

-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
