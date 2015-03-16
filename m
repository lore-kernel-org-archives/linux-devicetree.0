From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH] PM / Domains: Correct unit address in power-controller example
Date: Mon, 16 Mar 2015 10:14:30 -0700
Message-ID: <7hh9tkooeh.fsf@deeprootsystems.com>
References: <1426517232-2592-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1426517232-2592-1-git-send-email-geert+renesas@glider.be> (Geert
	Uytterhoeven's message of "Mon, 16 Mar 2015 15:47:12 +0100")
Sender: linux-pm-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Geert Uytterhoeven <geert+renesas@glider.be> writes:

> In example 2 of the generic PM domains DT bindings, the unit address of
> the device node representing the child power controller doesn't match
> its "reg" property. Correct it.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Kevin Hilman <khilman@linaro.org>
