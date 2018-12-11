Return-Path: <SRS0=chcA=OU=atomide.com=tony@kernel.org>
Date: Tue, 11 Dec 2018 08:35:53 -0800
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] ARM: dts: am335x-chiliboard: Add stdout-path property
Message-ID: <20181211163553.GT6707@atomide.com>
References: <20181121210515.22182-1-m.niestroj@grinn-global.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181121210515.22182-1-m.niestroj@grinn-global.com>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Cc: =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

* Marcin Niestroj <m.niestroj@grinn-global.com> [181121 13:05]:
> Add stdout-path property in /chosen node so that earlycon can be
> used by just adding earlycon in bootargs.

Applying into omap-for-v4.21/dt thanks.

Tony
