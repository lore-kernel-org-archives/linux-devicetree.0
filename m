From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: dts: Add ddc i2c reference to veyron
Date: Thu, 3 Sep 2015 16:18:54 +0100
Message-ID: <20150903151854.GA21084@n2100.arm.linux.org.uk>
References: <1441229148-12095-1-git-send-email-dianders@chromium.org>
 <CAL_JsqLLPCy6OpsP4NNjUA6+UxeTC-zGjGPPU+MLhUqFXSSGJQ@mail.gmail.com>
 <20150903082210.GU21084@n2100.arm.linux.org.uk>
 <CAL_JsqL838-somj-o2QtxRA9bXon5dHijx22v0mVowqyhKgoUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqL838-somj-o2QtxRA9bXon5dHijx22v0mVowqyhKgoUQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Douglas Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Alexandru Stan <amstan@chromium.org>, briannorris@chromium.org, Yakir Yang <ykk@rock-chips.com>, =?utf-8?B?5aea5pm65oOF?= <mark.yao@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 03, 2015 at 09:46:38AM -0500, Rob Herring wrote:
> Yes, that is fairly common (ADV75xx is same), and we would not
> describe an I2C bus in DT in that case. Same with HPD directly handled
> vs. a GPIO line. That is no different than what Doug has said:
> ddc-i2c-bus is present if using the SOC's I2C host and absent if using
> the HDMI block's DDC functionality. I'm only questioning the location
> of the property.

No, I don't think that's what Doug wants.  Doug wants the bridge's
internal I2C host to be exposed, so he can number it through a DT
alias.

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
