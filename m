Return-Path: <D.Lavnikevich@sam-solutions.com>
From: Dmitry Lavnikevich <d.lavnikevich@sam-solutions.com>
Subject: [PATCH v2 0/5] Add Phytec pbab01 audio support
Date: Fri, 12 Sep 2014 19:04:28 +0300
Message-ID: <1410537872-17274-1-git-send-email-d.lavnikevich@sam-solutions.com>
In-Reply-To: <1410356809-26179-1-git-send-email-d.lavnikevich@sam-solutions.com>
References: <1410356809-26179-1-git-send-email-d.lavnikevich@sam-solutions.com>
MIME-Version: 1.0
Content-Type: text/plain
To: shawn.guo@freescale.com, kernel@pengutronix.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, perex@perex.cz, tiwai@suse.de
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =devicetree@vger.kernel.org, alsa-devel@alsa-project.org
List-ID: <devicetree@vger.kernel.org>

Since previous patchset version asoc machine driver imx-tlv320aic3x
was replaced with simple-audio-card and audmux.
Also changed commit message for first patch, which now explicitly
states that it has more than stylistic purpose.
