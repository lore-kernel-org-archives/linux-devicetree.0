From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 6/6] Documentation: Add entry for Spreadtrum's Shark64 SoC
Date: Mon, 29 Sep 2014 15:59:46 +0200
Message-ID: <3268049.TolhrmBCZA@wuerfel>
References: <1411992293-7729-1-git-send-email-zhang.lyra@gmail.com> <1411992293-7729-7-git-send-email-zhang.lyra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1411992293-7729-7-git-send-email-zhang.lyra@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: zhang.lyra@gmail.com
Cc: catalin.marinas@arm.com, gregkh@linuxfoundation.org, ijc+devicetree@hellion.org.uk, jslaby@suse.cz, galak@codeaurora.org, broonie@linaro.org, mark.rutland@arm.com, m-karicheri2@ti.com, pawel.moll@arm.com, artagnon@gmail.com, rrichter@cavium.com, robh+dt@kernel.org, will.deacon@arm.com, orsonzhai@gmail.com, geng.ren@spreadtrum.com, zhizhou.zhang@spreadtrum.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "chunyan.zhang" <chunyan.zhang@spreadtrum.com>
List-Id: devicetree@vger.kernel.org

On Monday 29 September 2014 20:04:53 zhang.lyra@gmail.com wrote:
> From: "chunyan.zhang" <chunyan.zhang@spreadtrum.com>
> 
> Adds a devicetree binding documentation for Spreadtrum's Shark64 SoC.
> 
> Signed-off-by: chunyan.zhang <chunyan.zhang@spreadtrum.com>

One more thing: The email addresses look wrong, please use the form in
which you normally write the names, such as

Signed-off-by: Zhang Chunyan <chunyan.zhang@spreadtrum.com>

You can set the user name that git will add using the
'git config --global user.name ...'.

Also, I notice that the email from which the patch is sent does not
match the last 'Signed-off-by' line. If Chunyan and Lyra are both
your names, better pick one that you use for both the email and the
signoff. If you are Lyra and are posting a patch from Chunyan, please
add your own line below hers, like

Signed-off-by: Zhang Chunyan <chunyan.zhang@spreadtrum.com>
Signed-off-by: Zhang Lyra <zhang.lyra@gmail.com>

so that you include everybody who was involved in sending the
patch, but have your own list last.

	Arnd
