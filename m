From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 3/3] of: support passing console options with
 stdout-path
Date: Thu, 26 Feb 2015 15:44:00 +0100
Message-ID: <20150226144400.GC8806@lunn.ch>
References: <1417110967-16284-1-git-send-email-leif.lindholm@linaro.org>
 <1417110967-16284-4-git-send-email-leif.lindholm@linaro.org>
 <54EF09AA.2080706@hurleysoftware.com>
 <20150226134646.GB8806@lunn.ch>
 <54EF2933.3020408@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54EF2933.3020408@hurleysoftware.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: Leif Lindholm <leif.lindholm@linaro.org>, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, plagnioj@jcrosoft.com, ijc@debian.org, s.hauer@pengutronix.de
List-Id: devicetree@vger.kernel.org

> Sorry if I was unclear. My question was not _whether_ to fix this
> for earlycon, but rather _how_.
> 
> IOW, is the ':' character accepted as a path terminator for
> 1. all nodes, so fix this in fdt_path_offset();
> 2. only chosen nodes;
> 3. unique to stdout-path, so fix this in early_init_dt_scan_chosen_serial()?

Ah, sorry.

The ':' character is accepted as a path terminator for stdout-path and
stdin-path within chosen node. It does not appear to be mentioned
anywhere else in the standard.

	 Andrew
