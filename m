From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 04/16] pinctrl: samsung: Parse pin banks from DT
Date: Wed, 10 Oct 2012 10:39:30 +0200
Message-ID: <1983938.6eHV2XjAIK@amdc1227>
References: <1349685556-23718-1-git-send-email-t.figa@samsung.com>
 <1349685556-23718-5-git-send-email-t.figa@samsung.com>
 <CACRpkdafuxbO_peOBgmrjXk7ioVBF6D-D7d=shUd-GpHOdNxqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <CACRpkdafuxbO_peOBgmrjXk7ioVBF6D-D7d=shUd-GpHOdNxqg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: ext Tony Lindgren <tony@atomide.com>, Grant Likely <grant.likely@secretlab.ca>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, swarren@wwwdotorg.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com
List-Id: devicetree@vger.kernel.org

On Wednesday 10 of October 2012 09:34:05 Linus Walleij wrote:
> On Mon, Oct 8, 2012 at 10:39 AM, Tomasz Figa <t.figa@samsung.com> wrote:
> > Currently SoC-specific properties such as list of pin banks, register
> > offsets and bitfield sizes are being taken from static data structures
> > residing in pinctrl-exynos.c.
> > 
> > This patch modifies the pinctrl-samsung driver to parse all
> > SoC-specific
> > data from device tree, which will allow to remove the static data
> > structures and facilitate adding of further SoC variants to the
> > pinctrl-samsung driver.
> 
> So why? Two approaches:
> 
> - Put as much info as possible into the device tree
> - Put as much info as possible into the driver
> 
> The first approach is currently only used by pinctrl-single.c.
> 
> That driver is designed for the case where all info about
> the hardware arrives in some description language that
> can be translated into a simple DT description.
> 
> If you want to use that approach, you should use that
> driver. If that driver does not work for you, then it's not
> fulfilling it's purpose as a one-stop shop for simple
> pin controllers entirely contained within the device tree,
> and should be renamed or redesigned.
> 
> If you will end up with a hybrid approach with some
> stuff in the device tree and some stuff in the code,
> it's better to keep the old driver.

This will allow us to cover all the existing Samsung SoCs, starting from 
S3C24xx, through S3C64xx, S5P*, all supported Exynos SoCs and ending on any 
future SoCs using this kind of pin controller, without bloating the driver 
with hardly readable macros, lots of (often duplicated) static data and 
similar.

If there are some serious problems with this approach, just let me know and 
I will reconsider it, but if not, I'd like to keep it, because of the 
benefits it gives.

(Even if I moved all those SoC-specific data to static structures located 
in the driver, to keep the most readable way of GPIO specification in DT, I 
would have to create nodes for all banks in DT anyway and the driver would 
have to match particular nodes with their static data. I don't like this 
kind of approach.)

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
